module top_module(
    input x, y,
    output z
);
    xnor G(z, x, y); // Behaviourally: assign z = ~(x ^ y);
endmodule