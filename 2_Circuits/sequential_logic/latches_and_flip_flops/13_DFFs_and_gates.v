module top_module (
    input clk,
    input x,
    output z
);
    reg Q0, Q1, Q2;
    always @(posedge clk) begin
        Q0 <= x ^ Q0;
        Q1 <= x & ~Q1;
        Q2 <= x | ~Q2;
    end
    
    assign z = ~(Q0 | Q1 | Q2);
endmodule