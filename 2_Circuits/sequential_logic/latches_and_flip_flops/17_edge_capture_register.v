module top_module(
    input clk, reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] in_delayed;
    always @(posedge clk) begin
        in_delayed <= in;
        if (reset) out <= 32'b0;
        else begin
            out <= in_delayed & ~in | out;
        end
    end
endmodule