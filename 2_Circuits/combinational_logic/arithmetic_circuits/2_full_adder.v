module top_module( 
    input a, b, cin,
    output cout, sum
);
    // Behaviourally
    assign {cout, sum} = a + b + cin;

    // Structurally
    wire a_xor_b, a_and_b, c_and_a_xor_b;
    xor G1(a_xor_b, a, b);
    xor G2(sum, a_xor_b, cin);

    and G3(a_and_b, a, b);
    and G4(c_and_a_xor_b, cin, a_xor_b);

    or G5(cout, a_and_b, c_and_a_xor_b);
endmodule
