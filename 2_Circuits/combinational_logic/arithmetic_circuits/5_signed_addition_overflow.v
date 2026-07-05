// Behaviourally
module top_module (
    input [7:0] a, b,
    output [7:0] s,
    output overflow
);
    assign s = a + b;
    assign overflow = s[7] & ~a[7] & ~b[7] | ~s[7] & a[7] & b[7];
endmodule

// Structurally
module full_adder( 
    input a, b, cin,
    output cout, sum
);
    wire a_xor_b, a_and_b, c_and_a_xor_b;
    xor G1(a_xor_b, a, b);
    xor G2(sum, a_xor_b, cin);

    and G3(a_and_b, a, b);
    and G4(c_and_a_xor_b, cin, a_xor_b);

    or G5(cout, a_and_b, c_and_a_xor_b);
endmodule

module top_module(
    input [7:0] a, b, 
    output [7:0] sum,
    output overflow
);
    wire cout0, cout1, cout2, cout3, cout4, cout5, cout6, cout7;
    full_adder FA0(.a(a[0]), .b(b[0]), .cin(1'b0), .cout(cout0), .sum(sum[0]));
    full_adder FA1(.a(a[1]), .b(b[1]), .cin(cout0), .cout(cout1), .sum(sum[1]));
    full_adder FA2(.a(a[2]), .b(b[2]), .cin(cout1), .cout(cout2), .sum(sum[2]));
    full_adder FA3(.a(a[3]), .b(b[3]), .cin(cout2), .cout(cout3), .sum(sum[3]));
    full_adder FA4(.a(a[4]), .b(b[4]), .cin(cout3), .cout(cout4), .sum(sum[4]));
    full_adder FA5(.a(a[5]), .b(b[5]), .cin(cout4), .cout(cout5), .sum(sum[5]));
    full_adder FA6(.a(a[6]), .b(b[6]), .cin(cout5), .cout(cout6), .sum(sum[6]));
    full_adder FA7(.a(a[7]), .b(b[7]), .cin(cout6), .cout(cout7), .sum(sum[7]));
    xor (overflow, cout7, cout6);
endmodule
