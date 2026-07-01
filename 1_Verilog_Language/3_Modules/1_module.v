module top_module(
    input a, b,
    output out
);
    mod_a mod(.in1(a), .in2(b), .out(out));
endmodule