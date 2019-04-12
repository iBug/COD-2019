module VGA (
    input clk, rst,
    output hs, vs,
    output en,
    output [15:0] x, y
);
    parameter HD = 640, HF = 16, HS = 96, HB = 48;
    parameter VD = 480, VF = 10, VS = 2, VB = 31;

    reg [15:0] hc, vc;
    assign x = en ? hc : 0;
    assign y = en ? vc : 0;
    assign en = (hc < HD) && (vc < VD);
    assign hs = ~((hc >= HD + HF) && (hc < HD + HF + HS));
    assign vs = ~((vc >= VD + VF) && (vc < VD + VF + VS));

    // Clock requirement: 25 MHz
    always @(posedge clk) begin
        if (rst) begin
            hc <= 0;
            vc <= 0;
        end else begin
            if (hc >= HD + HF + HS + HB - 1)
                hc <= 0;
            else begin
                hc <= hc + 1;
                if (vc >= VD + VF + VS + VB - 1)
                    vc <= 0;
                else
                    vc <= vc + 1;
            end
        end
    end
endmodule
