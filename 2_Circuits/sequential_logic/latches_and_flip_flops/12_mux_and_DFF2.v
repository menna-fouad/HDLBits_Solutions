module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire mux1, D;
    assign mux1 = E ? w : Q;
    assign D = L ? R : mux1;

    always @(posedge clk) begin
        Q <= D;
    end
endmodule