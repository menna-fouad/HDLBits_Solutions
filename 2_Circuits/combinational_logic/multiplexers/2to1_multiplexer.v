module top_module(
    input [99:0] a, b,
    input sel,
    output [99:0] out
);
    // Behaviourally
    assign out = sel ? b : a;
    
    // Structurally
    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : mux_2to1
            wire not_sel, t1, t2;
            not NOT(not_sel, sel);
            and AND1(t1, not_sel, a[i]);
            and AND2(t2, sel, b[i]);
            or OR(out[i], t1, t2);
        end
    endgenerate
endmodule