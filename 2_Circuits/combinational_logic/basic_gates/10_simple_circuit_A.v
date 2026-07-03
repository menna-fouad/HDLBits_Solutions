module top_module(
    input x, y,
    output z
);
    wire x_xor_y;
    xor G1(x_xor_y, x, y);
    and G2(z, x, x_xor_y);
endmodule