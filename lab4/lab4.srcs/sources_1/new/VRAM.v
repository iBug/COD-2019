module VRAM (
    input clock,
    input [15:0] ra, wa,
    input [11:0] wd,
    output [11:0] rd,
    input we
);
    BRAM internal(.clka(clock), .clkb(clock), .addra(wa), .dina(wd), .ena(1), .wea(we), .addrb(ra), .doutb(rd), .enb(1));
endmodule
