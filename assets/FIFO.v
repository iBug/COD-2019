module FIFO (
    input clock, reset,
    input en_in, en_out,
    input [3:0] in,
    output reg [3:0] out,
    output empty, full,
    output [15:0] display
);
    reg [2:0] head, tail;
    reg prev_in, prev_out;

    assign empty = head == tail;
    assign full = (tail + 3'b1) == head;
    wire push, pop;
    assign push = (~prev_in) & en_in & ((~full) | pop);
    assign pop = (~prev_out) & en_out & (~empty);

    reg [2:0] scan_a;
    wire [3:0] scan_d, head_d;
    integer scan_n;
    reg [6:0] segdata;
    wire [6:0] seg;
    wire dp;
    wire [7:0] select;
    assign dp = scan_a != head;
    assign select = ~(8'b1 << scan_a);
    assign seg = (tail >= head ? (scan_a >= head && scan_a < tail) : (scan_a < tail || scan_a >= head)) ? segdata : 7'h7F;
    assign display = {select, dp, seg};

    RegisterFile #(3, 4) RF (clock, reset, head, scan_a, tail, in, push, head_d, scan_d);

    always @(scan_d) begin
        case (scan_d)
            4'd0: segdata = 7'b0000001;
            4'd1: segdata = 7'b1001111;
            4'd2: segdata = 7'b0010010;
            4'd3: segdata = 7'b0000110;
            4'd4: segdata = 7'b1001100;
            4'd5: segdata = 7'b0100100;
            4'd6: segdata = 7'b0100000;
            4'd7: segdata = 7'b0001111;
            4'd8: segdata = 7'b0000000;
            4'd9: segdata = 7'b0000100;
            default: segdata = 7'b1111110;
        endcase
    end

    always @(posedge clock) begin
        if (reset) begin
            prev_in <= 0;
            prev_out <= 0;
            head <= 0;
            tail <= 0;
            scan_a <= 0;
            scan_n <= 0;
        end else begin
            prev_in <= en_in;
            prev_out <= en_out;
            if (pop) begin
                head <= head + 1;
                out <= head_d;
            end
            if (push) begin
                tail <= tail + 1;
            end
            if (scan_n >= 10000) begin
                scan_n <= 0;
                scan_a <= scan_a + 1;
            end else begin
                scan_n <= scan_n + 1;
            end
        end
    end
endmodule
