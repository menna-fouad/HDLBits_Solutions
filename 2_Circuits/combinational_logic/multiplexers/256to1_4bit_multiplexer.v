// Behaviourally
module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out
);
    assign out = in[sel * 4 +:4];
endmodule

// Structurally
module mux16to1(
    input [63:0] in,
    input [3:0] s,
    output [3:0] out
);
    wire not_s0, not_s1, not_s2, not_s3;

    not NOT0(not_s0, s[0]);
    not NOT1(not_s1, s[1]);
    not NOT2(not_s2, s[2]);
    not NOT3(not_s3, s[3]);

    genvar i;
    generate
        for (i=0; i < 4; i = i + 1) begin : mux
            wire t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15;
            and AND0(t0, not_s3, not_s2, not_s1, not_s0, in[i]);
            and AND1(t1, not_s3, not_s2, not_s1, s[0], in[4 + i]);
            and AND2(t2, not_s3, not_s2, s[1], not_s0, in[2*4 + i]);
            and AND3(t3, not_s3, not_s2, s[1], s[0], in[3*4 + i]);
            and AND4(t4, not_s3, s[2], not_s1, not_s0, in[4*4 + i]);
            and AND5(t5, not_s3, s[2], not_s1, s[0], in[5*4 + i]);
            and AND6(t6, not_s3, s[2], s[1], not_s0, in[6*4 + i]);
            and AND7(t7, not_s3, s[2], s[1], s[0], in[7*4 + i]);
            and AND8(t8, s[3], not_s2, not_s1, not_s0, in[8*4 + i]);
            and AND9(t9, s[3], not_s2, not_s1, s[0], in[9*4 + i]);
            and AND10(t10, s[3], not_s2, s[1], not_s0, in[10*4 + i]);
            and AND11(t11, s[3], not_s2, s[1], s[0], in[11*4 + i]);
            and AND12(t12, s[3], s[2], not_s1, not_s0, in[12*4 + i]);
            and AND13(t13, s[3], s[2], not_s1, s[0], in[13*4 + i]);
            and AND14(t14, s[3], s[2], s[1], not_s0, in[14*4 + i]);
            and AND15(t15, s[3], s[2], s[1], s[0], in[15*4 + i]);

            or OR(out[i], t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15);
        end
    endgenerate
endmodule

module top_module(
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out
);
    // 64 bits that encompass the 4-bit outputs of 16 x mux16to1
    wire [63:0] temp;
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : mux
            mux16to1 mux(.in(in[i*64 +: 64]), .s(sel[3:0]), .out(temp[i*4 +: 4]));
        end
    endgenerate
    mux16to1 G(.in(temp), .s(sel[7:4]), .out(out));
endmodule
