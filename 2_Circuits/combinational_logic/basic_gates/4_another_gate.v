module top_module(
    input in1,
    input in2,
    output out
);
    // Behaviourally:
    assign out = in1 & ~in2;

    // Structurally:
    wire not_in2;
    not NOT(not_in2, in2);
    and AND(out, in1, not_in2);
endmodule