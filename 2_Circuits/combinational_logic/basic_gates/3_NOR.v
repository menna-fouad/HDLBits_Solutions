module top_module(
    input in1,
    input in2,
    output out
);
    // Behaviourally:
    assign out = ~(in1 | in2);

    // Structurally:
    nor nor_gate(out, in1, in2);
endmodule