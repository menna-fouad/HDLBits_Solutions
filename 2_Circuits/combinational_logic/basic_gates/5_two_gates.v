module top_module(
    input in1, in2, in3,
    output out
);
    // Behaviourally:
    assign out = ~(in1 ^ in2) ^ in3;

    // Structurally
    wire t1;
    xnor G1(t1, in1, in2);
    xor G2(out, t1, in3);
endmodule