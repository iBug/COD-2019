module Painter (
    input clk, rst,
    input [11:0] SW,
    input BTNL, BTNU, BTNR, BTND,
    input draw,
    output VGA_HS, VGA_VS,
    output [3:0] VGA_R, VGA_G, VGA_B
);
    reg [7:0] x, y;
    wire ml, mu, mr, md;
    ButtonControl BL (clk, rst, BTNL, ml);
    ButtonControl BU (clk, rst, BTNU, mu);
    ButtonControl BR (clk, rst, BTNR, mr);
    ButtonControl BD (clk, rst, BTND, md);

    wire [15:0] vram_ra, vram_wa;
    wire [11:0] vram_rd, vram_wd;
    wire vga_en;
    wire [15:0] vga_x, vga_y;
    VRAM vram (clk, vram_ra, vram_wa, vram_wd, vram_rd, draw);
    VGA vga (clk, rst, VGA_HS, VGA_VS, vga_en, vga_x, vga_y);

    wire [7:0] rx, ry;
    wire en;
    assign vram_wa = {x, y};
    assign vram_wd = SW;
    assign rx = vga_x - 192;
    assign ry = vga_y - 112;
    assign en = vga_en && (vga_x >= 192 && vga_x < 448 && vga_y >= 112 && vga_y < 368);
    assign vram_ra = en ? {rx, ry} : 0;
    assign {VGA_R, VGA_G, VGA_B} = en ? ((rx == x && ry == y) ? 12'hFFF : vram_rd) : 12'b0;

    always @(posedge clk) begin
        if (rst) begin
            x <= 127;
            y <= 127;
        end else begin
            if (ml && x > 0)
                x <= x - 1;
            else if (mr && x < 255)
                x <= x + 1;
            if (mu && y > 0)
                y <= y - 1;
            else if (md && y < 255)
                y <= y + 1;
        end
    end
endmodule

module ButtonControl (
    input clk, rst,
    input i,
    output o
);
    integer c;
    assign o = (c == 1) || (c >= 50_000_000 && c % 4_000_000 == 0);
    always @(posedge clk) begin
        if (rst)
            c <= 0;
        else if (i)
            c <= c + 1;
        else
            c <= 0;
    end
endmodule
