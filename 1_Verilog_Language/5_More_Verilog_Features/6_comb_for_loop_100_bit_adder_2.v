`default_nettype none
module full_adder(
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
    input [99:0] a, b,
    input cin,
    output [99:0] cout, sum
);
    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : gen_full_adder
            full_adder FA (
                .a(a[i]),
                .b(b[i]),
                .cin(i == 0 ? cin : cout[i-1]),
                .sum(sum[i]),
                .cout(cout[i])
            );
        end
    endgenerate
endmodule