`default_nettype none
module top_module(
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    assign out_or_bitwise = a | b;
    // structurally:
    // or OR0(out_or_bitwise[0], a[0], b[0]);
    // or OR1(out_or_bitwise[1], a[1], b[1]);
    // or OR2(out_or_bitwise[2], a[2], b[2]);

    assign out_or_logical = |{a, b};
    // structually:
    // or OR3(
    //     out_or_logical,
    //     a[0],
    //     a[1],
    //     a[2],
    //     b[0],
    //     b[1],
    //     b[2],
    // );

    assign out_not = ~{b, a};
    // structurally:
    // not NOT0(out_not[0], a[0]);
    // not NOT1(out_not[1], a[1]);
    // not NOT2(out_not[2], a[2]);
    // not NOT3(out_not[3], b[0]);
    // not NOT4(out_not[4], b[1]);
    // not NOT5(out_not[5], b[2]);
endmodule