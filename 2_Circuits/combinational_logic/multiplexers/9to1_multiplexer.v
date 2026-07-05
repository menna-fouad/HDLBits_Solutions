// Behaviourally
module top_module(
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out
);
    always @(*) begin
        case (sel)
            4'b0000 : out = a;
            4'b0001 : out = b;
            4'b0010 : out = c;
            4'b0011 : out = d;
            4'b0100 : out = e;
            4'b0101 : out = f;
            4'b0110 : out = g;
            4'b0111 : out = h;
            4'b1000 : out = i;
            default : out = 4'hFFFF;
        endcase
    end
endmodule

// Structurally

module mux4to1(
    input [15:0] in0, in1, in2, in3,
    input[1:0] sel,
    output [15:0] out
);
    wire not_s0, not_s1;

    not NOT0(not_s0, sel[0]);
    not NOT1(not_s1, sel[1]);

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : mux4to1
            wire t0, t1, t2, t3;
            and AND0(t0, not_s1, not_s0, in0[i]);
            and AND1(t1, not_s1, sel[0], in1[i]);
            and AND2(t2, sel[1], not_s0, in2[i]);
            and AND3(t3, sel[1], sel[0], in3[i]);

            or OR(out[i], t0, t1, t2, t3);
        end
    endgenerate
endmodule

module top_module (
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out
);
    wire[15:0] out0, out1, out2;
    mux4to1 MUX0(.in0(a), .in1(b), .in2(c), .in3(d), .sel(sel[1:0]), .out(out0));
    mux4to1 MUX1(.in0(e), .in1(f), .in2(g), .in3(h), .sel(sel[1:0]), .out(out1));
    mux4to1 MUX2(.in0(i), .in1(16'hFFFF), .in2(16'hFFFF), .in3(16'hFFFF), .sel(sel[1:0]), .out(out2));

    mux4to1 MUX(.in0(out0), .in1(out1), .in2(out2), .in3(16'hFFFF), .sel(sel[3:2]), .out(out));
endmodule
