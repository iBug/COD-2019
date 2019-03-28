module Sorter2
#(parameter W = 4)
(
    input [W - 1:0] x0, x1,
    output [W - 1:0] s0, s1
);
    wire s;
    assign s = x0 > x1;
    assign s0 = s ? x1 : x0;
    assign s1 = s ? x0 : x1;
endmodule

module Sorter4
#(parameter W = 4)
(
    input clock, reset,
    input [W - 1:0] x0, x1, x2, x3,
    output [W - 1:0] s0, s1, s2, s3,
    output done
);
    reg [W - 1:0] r0, r1, r2, r3;
    assign s0 = r0;
    assign s1 = r1;
    assign s2 = r2;
    assign s3 = r3;

    reg [1:0] state;
    wire [1:0] nextstate;
    assign nextstate = (state == 3) ? state : (state + 1);
    assign done = (state == 3);

    wire [W - 1:0] i0, i1, i2, i3, o0, o1, o2, o3,
        n0, n1, n2, n3;

    Sorter2 sorter_a(i0, i1, o0, o1),
            sorter_b(i2, i3, o2, o3);

    assign n0 = ({W{state == 0}} & o0) | ({W{state == 1}} & o0) | ({W{state == 2}} & r0) | ({W{state == 3}} & r0);
    assign n1 = ({W{state == 0}} & o1) | ({W{state == 1}} & o2) | ({W{state == 2}} & o0) | ({W{state == 3}} & r1);
    assign n2 = ({W{state == 0}} & o2) | ({W{state == 1}} & o1) | ({W{state == 2}} & o1) | ({W{state == 3}} & r2);
    assign n3 = ({W{state == 0}} & o3) | ({W{state == 1}} & o3) | ({W{state == 2}} & r3) | ({W{state == 3}} & r3);

    assign i0 = ({W{state == 0}} & r0) | ({W{state == 1}} & r0) | ({W{state == 2}} & r1);
    assign i1 = ({W{state == 0}} & r1) | ({W{state == 1}} & r2) | ({W{state == 2}} & r2);
    assign i2 = ({W{state == 0}} & r2) | ({W{state == 1}} & r1);
    assign i3 = ({W{state == 0}} & r3) | ({W{state == 1}} & r3);

    always @(posedge clock) begin
        if (reset) begin
            state <= 0;
            r0 <= x0;
            r1 <= x1;
            r2 <= x2;
            r3 <= x3;
        end else begin
            state <= nextstate;
            r0 <= n0;
            r1 <= n1;
            r2 <= n2;
            r3 <= n3;
        end
    end
endmodule
