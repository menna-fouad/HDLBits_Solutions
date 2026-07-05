// Behaviourally
module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out
);
    assign out = in[sel];
endmodule

// Sturcturally
module mux16to1(
    input [15:0] in,
    input [3:0] s,
    output out
);
    wire not_s0, not_s1, not_s2, not_s3;
    wire t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15;

    not NOT0(not_s0, s[0]);
    not NOT1(not_s1, s[1]);
    not NOT2(not_s2, s[2]);
    not NOT3(not_s3, s[3]);

    and AND0(t0, not_s3, not_s2, not_s1, not_s0, in[0]);
    and AND1(t1, not_s3, not_s2, not_s1, s[0], in[1]);
    and AND2(t2, not_s3, not_s2, s[1], not_s0, in[2]);
    and AND3(t3, not_s3, not_s2, s[1], s[0], in[3]);
    and AND4(t4, not_s3, s[2], not_s1, not_s0, in[4]);
    and AND5(t5, not_s3, s[2], not_s1, s[0], in[5]);
    and AND6(t6, not_s3, s[2], s[1], not_s0, in[6]);
    and AND7(t7, not_s3, s[2], s[1], s[0], in[7]);
    and AND8(t8, s[3], not_s2, not_s1, not_s0, in[8]);
    and AND9(t9, s[3], not_s2, not_s1, s[0], in[9]);
    and AND10(t10, s[3], not_s2, s[1], not_s0, in[10]);
    and AND11(t11, s[3], not_s2, s[1], s[0], in[11]);
    and AND12(t12, s[3], s[2], not_s1, not_s0, in[12]);
    and AND13(t13, s[3], s[2], not_s1, s[0], in[13]);
    and AND14(t14, s[3], s[2], s[1], not_s0, in[14]);
    and AND15(t15, s[3], s[2], s[1], s[0], in[15]);

    or OR(out, t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15);
endmodule

module top_module(
    input [255:0] in,
    input [7:0] sel,
    output out
);
    wire [15:0] temp;
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : mux
            mux16to1 mux(.in(in[i*16 +: 16]), .s(sel[3:0]), .out(temp[i]));
        end
    endgenerate
    mux16to1 G(.in(temp), .s(sel[7:4]), .out(out));
endmodule
