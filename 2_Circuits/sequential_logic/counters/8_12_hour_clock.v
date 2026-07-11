module BCD_Digit(
    input clk, reset, ena,
    input [3:0] limit,
    output reg [3:0] q,
    output carry
);
    assign carry = ena && (q == limit);
    always @(posedge clk) begin
        if (reset) q <= 4'b0;
        else if (ena) begin
            if (q == limit) q <= 0;
            else q <= q + 1;
        end
    end
endmodule

module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output [7:0] mm,
    output [7:0] ss
);
    wire ena_s1, ena_m0, ena_m1, ena_h0, ena_h1;
    
    BCD_Digit s0(
        .clk(clk),
        .reset(reset),
        .ena(ena),
        .limit(4'd9),
        .q(ss[3:0]),
        .carry(ena_s1)
    );
    BCD_Digit s1(
        .clk(clk),
        .reset(reset),
        .ena(ena_s1),
        .limit(4'd5),
        .q(ss[7:4]),
        .carry(ena_m0)
    );

    BCD_Digit m0(
        .clk(clk),
        .reset(reset),
        .ena(ena_m0),
        .limit(4'd9),
        .q(mm[3:0]),
        .carry(ena_m1)
    );
    BCD_Digit m1(
        .clk(clk),
        .reset(reset),
        .ena(ena_m1),
        .limit(4'd5),
        .q(mm[7:4]),
        .carry(ena_h0)
    );

    always @(posedge clk) begin
        if (reset) begin
            hh[7:4] <= 4'b0001;
            hh[3:0] <= 4'b0010;
            pm <= 1'b0;
        end
        else if (ena_h0) begin
            if (hh[7:4] == 4'd1 && hh[3:0] == 4'd2) begin
                hh[7:4] <= 4'd0;
                hh[3:0] <= 4'd1;
            end
            else if (hh[3:0] == 4'd9) begin
                hh[7:4] <= 4'd1;
                hh[3:0] <= 4'd0;
            end
            else begin
                hh[3:0] <= hh[3:0] + 1;
            end

            if (hh[3:0] == 4'd1 && hh[7:4] == 4'd1) pm <= ~pm;
        end
    end
endmodule