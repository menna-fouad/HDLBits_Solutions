module top_module(
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum
);
    wire [99:0] intermediate_carry;
    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : bcd_adder
            bcd_fadd (
                .a(a[i * 4 + 3 : i * 4]),
                .b(b[i * 4 + 3 : i * 4]),
                .cin(i == 0 ? cin : intermediate_carry[i - 1]),
                .cout(intermediate_carry[i]),
                .sum(sum[i * 4 + 3 : i * 4])
            );
        end
    endgenerate
    assign cout = intermediate_carry[99];
endmodule
