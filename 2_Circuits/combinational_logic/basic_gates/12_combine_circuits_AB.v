module circuit_A(
    input x, y,
    output z
);
    wire x_xor_y;
    xor G1(x_xor_y, x, y);
    and G2(z, x, x_xor_y);
endmodule

module circuit_B(
    input x, y,
    output z
);
    xnor G(z, x, y); // Behaviourally: assign z = ~(x ^ y);
endmodule

module top_module(
    input x, y,
    output z
);
    wire a1, a2, b1, b2;
    wire a1_or_b1, a2_and_b2;

    circuit_A IA1(.x(x), .y(y), .z(a1));
    circuit_B IB1(.x(x), .y(y), .z(b1));
    circuit_A IA2(.x(x), .y(y), .z(a2));
    circuit_B IB2(.x(x), .y(y), .z(b2));

    or OR(a1_or_b1, a1, b1);
    and AND(a2_and_b2, a2, b2);

    xor XOR(z, a1_or_b1, a2_and_b2);
endmodule
