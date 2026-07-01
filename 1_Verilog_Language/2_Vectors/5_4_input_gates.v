`default_nettype none
module top_module(
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    // Behaviourally:
    assign out_and = &in;
    assign out_or = |in;
    assign out_xor = ^in;

    // Structurally:
    and AND(out_and, in[0], in[1], in[2], in[3]);
    or OR(out_or, in[0], in[1], in[2], in[3]);
    xor XOR(out_xor, in[0], in[1], in[2], in[3]);
endmodule