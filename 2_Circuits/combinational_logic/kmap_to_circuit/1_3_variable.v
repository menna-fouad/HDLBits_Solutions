module top_module(
    input a, b, c;
    output out
);
    assign out = a | b | c; // Behaviourally
    or G(out, a, b, c); // Structurally
endmodule