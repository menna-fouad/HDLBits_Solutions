`default_nettype none

module add1(
    input a, b, cin,
    output sum, cout
);
    wire axorb, aandb, candaxorb;
    xor XOR1(axorb, a, b);
    xor XOR2(sum, axorb, cin);

    and AND1(aandb, a, b);
    and AND2(candaxorb, cin, axorb);
    or OR(cout, aandb, candaxorb);
endmodule

module top_module(
    input [31:0] a, b,
    output [31:0] sum
);
    wire cout1, cout2;
    add16 add1(.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum[15:0]), .cout(cout1));
    add16 add2(.a(a[31:16]), .b(b[31:16]), .cin(cout1), .sum(sum[31:16]), .cout(cout2));
endmodule