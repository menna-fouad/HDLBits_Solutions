`default_nettype none
module top_module(
    input [7:0] in,
    output [7:0] out
);
    assign out[0] = in[7];
    assign out[1] = in[6];
    assign out[2] = in[5];
    assign out[3] = in[4];
    assign out[4] = in[3];
    assign out[5] = in[2];
    assign out[6] = in[1];
    assign out[7] = in[0];

    // alternatively:
    assign out = {in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]};

    // structurally:
    buf BUF0(out[0], in[7]);
    buf BUF1(out[1], in[6]);
    buf BUF2(out[2], in[5]);
    buf BUF3(out[3], in[4]);
    buf BUF4(out[4], in[3]);
    buf BUF5(out[5], in[2]);
    buf BUF6(out[6], in[1]);
    buf BUF7(out[7], in[0]);
endmodule