module top_module(
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y
);
    wire p1and1, p1and2, p2and1, p2and2;

    and G1(p1and1, p1a, p1b, p1c);
    and G2(p1and2, p1d, p1e, p1f);
    or G3 (p1y, p1and1, p1and2);

    and G4(p2and1, p2a, p2b);
    and G5(p2and2, p2c, p2d);
    or G6(p2y, p2and1, p2and2);
endmodule