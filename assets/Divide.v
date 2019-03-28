module Divide(
    input clock, reset,
    input [7:0] x, y,
    output reg [7:0] q, r,
    output done, error
);
    reg [7:0] n;
    wire [7:0] nextQ, nextR, nextN;
    wire [7:0] t;
    wire s;

    assign done = n == 0;
    assign error = y == 0;

    assign t = (r << 1) | x[n - 1];
    assign s = t >= y;
    assign nextR = s ? t - y : t;
    assign nextQ = s ? q | (1 << (n - 1)) : q;
    assign nextN = ((n == 0) | (error)) ? 0 : n - 1;

    always @(posedge clock) begin
        if (reset) begin
            n <= 8;
            q <= 0;
            r <= 0;
        end else begin
            n <= nextN;
            q <= nextQ;
            r <= nextR;
        end
    end
endmodule
