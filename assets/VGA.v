module VGA (
    // Clock requirement: 100 MHz
    input clk, rst,
    output hs, vs,
    output en,
    output [15:0] x, y
);
    parameter HD = 640, HF = 16, HS = 96, HB = 48;
    parameter VD = 480, VF = 10, VS = 2, VB = 31;

    reg ce;
    reg [15:0] count;
    reg [15:0] hc, vc;
    assign x = en ? hc : 0;
    assign y = en ? vc : 0;
    assign en = (hc < HD) && (vc < VD);
    assign hs = ~((hc >= HD + HF) && (hc < HD + HF + HS));
    assign vs = ~((vc >= VD + VF) && (vc < VD + VF + VS));

    // Clock divider
    always @(posedge clk) begin
        if (rst)
            {ce, count} <= 0;
        else
            {ce, count} <= count + 16'h4000;
    end

    // VGA Scanner
    always @(posedge clk) begin
        if (rst) begin
            hc <= 0;
            vc <= 0;
        end else if (ce) begin
            if (hc >= HD + HF + HS + HB - 1) begin
                hc <= 0;
                if (vc >= VD + VF + VS + VB - 1)
                    vc <= 0;
                else
                    vc <= vc + 1;
            end else begin
                hc <= hc + 1;
            end
        end
    end
endmodule
