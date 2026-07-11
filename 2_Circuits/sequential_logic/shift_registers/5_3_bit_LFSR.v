module shift(
    input clk, L,
    input r, q_in,
    output reg Q
);
    always @(posedge clk) begin
        Q <= L ? r : q_in;
    end
endmodule

module top_module(
    input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR
);
    wire q0_in, q1_in, q2_in;
    assign q0_in = LEDR[2];
    assign q1_in = LEDR[0];
    assign q2_in = LEDR[1] ^ LEDR[2];
    shift shift0(.clk(KEY[0]), .L(KEY[1]), .r(SW[0]), .q_in(q0_in), .Q(LEDR[0]));
    shift shift1(.clk(KEY[0]), .L(KEY[1]), .r(SW[1]), .q_in(q1_in), .Q(LEDR[1]));
    shift shift2(.clk(KEY[0]), .L(KEY[1]), .r(SW[2]), .q_in(q2_in), .Q(LEDR[2]));
endmodule