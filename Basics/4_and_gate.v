module top_module(
    input a, b,
    output out
);
    and G(out, a, b);

    // behavioural implementation: assign out = a & b;
endmodule