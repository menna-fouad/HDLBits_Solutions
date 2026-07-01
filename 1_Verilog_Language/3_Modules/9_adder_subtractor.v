module top_module(
    input [31:0] a, b,
    input sub,
    output [31:0] sum
);
    wire[31:0] minusb = b ^ {32{sub}};
    wire cout0, cout1;
    add16 add1(.a(a[15:0]), .b(minusb[15:0]), .cin(sub), .sum(sum[15:0]), .cout(cout0));
    add16 add2(.a(a[31:16]), .b(minusb[31:16]), .cin(cout0), .sum(sum[31:16]), .cout(cout1));
endmodule