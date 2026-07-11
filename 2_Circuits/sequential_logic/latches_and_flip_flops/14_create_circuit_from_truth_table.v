module top_module(
    input clk, j, k,
    output reg Q
);
    wire D;
    assign D = j & ~Q | ~k & Q;
    always @(posedge clk) begin
        Q <= D;
    end
endmodule

module top_module(
    input clk, j, k,
    output reg Q
);
    reg D;
    always @(posedge clk) begin
        case ({j, k})
            2'b00 : Q <= Q;
            2'b01 : Q <= 1'b0;
            2'b10 : Q <= 1'b1;
            2'b11 : Q <= ~Q;
        endcase
    end
endmodule