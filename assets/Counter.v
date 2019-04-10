module Counter
#(parameter w = 4)
(
    input clock, reset,
    input ce, pe,
    input [3:0] d,
    output reg [3:0] q
);
    always @(posedge clk) begin
        if (reset) begin
            q <= 0;
        end else begin
            if (pe)
                q <= d;
            else if (ce)
                q <= q + 1;
    end
endmodule
