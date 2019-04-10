module RegisterFile
#(parameter wAddr = 2, wData = 4)
(
    input clock, reset,
    input [wAddr - 1:0] ra0, ra1,
    input [wAddr - 1:0] wa0,
    input [wData - 1:0] wd0,
    input we,
    output [wData - 1:0] rd0, rd1
);
    reg [wData - 1:0] r [(1 << wAddr) - 1:0];
    assign rd0 = r[ra0];
    assign rd1 = r[ra1];
    integer i;
    always @(posedge clock) begin
        if (reset) begin
            for (i = 0; i < (1 << wAddr); i = i + 1) begin
                r[i] <= 0;
            end
        end else if (we) begin
            r[wa0] <= wd0;
        end
    end
endmodule
