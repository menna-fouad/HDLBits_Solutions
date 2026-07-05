module full_adder( 
    input a, b, cin,
    output cout, sum
);
    assign {cout, sum} = a + b + cin;
endmodule

module top_module(
    input [3:0] x, y, 
    output [4:0] sum
);
    wire cout0, cout1, cout2;
    full_adder FA0(.a(x[0]), .b(y[0]), .cin(1'b0), .cout(cout0), .sum(sum[0]));
    full_adder FA1(.a(x[1]), .b(y[1]), .cin(cout0), .cout(cout1), .sum(sum[1]));
    full_adder FA2(.a(x[2]), .b(y[2]), .cin(cout1), .cout(cout2), .sum(sum[2]));
    full_adder FA3(.a(x[3]), .b(y[3]), .cin(cout2), .cout(sum[4]), .sum(sum[3]));
endmodule
