module flipflop_and_mux(
    input L, clk,
    input r_in, q_in,
    output reg q
);
    always @(posedge clk) begin
        if (L) q <= r_in;
        else q <= q_in;
    end
endmodule

module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q
);
    always @(posedge clk) begin
        if (L) q <= r_in;
        else q <= q_in;
    end
endmodule