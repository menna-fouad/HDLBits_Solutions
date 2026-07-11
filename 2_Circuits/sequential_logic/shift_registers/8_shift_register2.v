module MUXDFF (
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

module top_module(
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
);
    MUXDFF mux_dff0(
        .clk(KEY[0]),
        .w(LEDR[1]),
        .R(SW[0]),
        .E(KEY[1]),
        .L(KEY[2]),
        .Q(LEDR[0])
    );

    MUXDFF mux_dff1(
        .clk(KEY[0]),
        .w(LEDR[2]),
        .R(SW[1]),
        .E(KEY[1]),
        .L(KEY[2]),
        .Q(LEDR[1])
    );

    MUXDFF mux_dff2(
        .clk(KEY[0]),
        .w(LEDR[3]),
        .R(SW[2]),
        .E(KEY[1]),
        .L(KEY[2]),
        .Q(LEDR[2])
    );

    MUXDFF mux_dff3(
        .clk(KEY[0]),
        .w(KEY[3]),
        .R(SW[3]),
        .E(KEY[1]),
        .L(KEY[2]),
        .Q(LEDR[3])
    );
endmodule
