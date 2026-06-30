module top_module(
    input a, b,
    output out
);
    xnor G(out, a, b);
    // Behaviourally: assign out = a ~^ b;
endmodule