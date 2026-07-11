module top_module (
    input clk, in, 
    output reg out
);
    always @(posedge clk) begin
        out <= in ^ out;
    end
endmodule