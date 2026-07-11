module top_module(
    input clk,
    input reset,
    output reg [31:0] q
); 
    integer i;

    always @(posedge clk) begin
        if (reset) q <= 32'h1;
        else begin
            for (i = 0; i < 31; i = i + 1) begin
                if (i == 21 || i == 1 || i == 0) begin
                    q[i] <= q[i + 1] ^ q[0];
                end
                else begin
                    q[i] <= q[i + 1];
                end
            end

            q[31] <= q[0];
        end
    end
endmodule