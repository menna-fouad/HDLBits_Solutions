module top_module(
    input a, b, c, d;
    output out, out_n;
);
    wire aandb, candd;
    and G0(aandb, a, b);
    and G1(candd, c, d);
    or G2(out, aandb, candd);
    not G3(out_n, out);
endmodule