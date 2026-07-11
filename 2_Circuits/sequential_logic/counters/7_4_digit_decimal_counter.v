module BCD_Digit(
    input clk, reset, ena,
    output reg [3:0] q,
    output reg carry
);
    assign carry = ena && (q == 4'b1001);
    always @(posedge clk) begin
        if (reset) q <= 4'b0;
        else if (ena) begin
            if (q == 4'b1001) q <= 0;
            else q <= q + 1;
        end
    end
endmodule

module top_module(
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q
);
    BCD_Digit digit0 (
        .clk(clk),
        .reset(reset),
        .ena(1'b1),
        .q(q[3:0]),
        .carry(ena[1])
    );

    BCD_Digit digit1 (
        .clk(clk),
        .reset(reset),
        .ena(ena[1]),
        .q(q[7:4]),
        .carry(ena[2])
    );
    
    BCD_Digit digit2 (
        .clk(clk),
        .reset(reset),
        .ena(ena[2]),
        .q(q[11:8]),
        .carry(ena[3])
    );
    
    BCD_Digit digit3 (
        .clk(clk),
        .reset(reset),
        .ena(ena[3]),
        .q(q[15:12]),
        .carry()
    );
endmodule