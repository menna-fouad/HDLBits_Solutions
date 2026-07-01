module top_module(
    input a, b,
    output out
);
    nor G(out, a, b);
    // Behaviourally: assign out = a ~| b;
    // Alternatively: assign out = ~(a | b);
endmodule