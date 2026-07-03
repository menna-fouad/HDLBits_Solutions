module top_module(
    input a, b,
    output out_and,
    output out_or,
    output out_xor,
    output out_nand,
    output out_nor,
    output out_xnor,
    output out_anotb
);
    // Behaviourally
    assign out_and = a & b;
    assign out_or = a | b;
    assign out_xor = a ^ b;
    assign out_nand = ~(a & b);
    assign out_nor = ~(a | b);
    assign out_xnor = ~(a ^ b);
    assign out_anotb = a & ~b;

    // Structurally
    wire not_b;
    and G1(out_and, a, b);
    or G2(out_or, a, b);
    xor G3(out_xor, a, b);
    nand G4(out_nand, a, b);
    nor G5(out_nor, a, b);
    xnor G6(out_xnor, a, b);
    not NOT(not_b, b);
    and G7(out_anotb, a, not_b);
endmodule