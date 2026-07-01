module mux4way(
    input[7:0] in0, in1, in2, in3,
    input[1:0] sel,
    output[7:0] out
);
    assign out = (sel == 2'b00) ? in0 :
                 (sel == 2'b01) ? in1 :
                 (sel == 2'b10) ? in2 : in3;
endmodule

module top_module(
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] q1, q2, q3;
    my_dff8 dff1(.clk(clk), .d(d), .q(q1));
    my_dff8 dff2(.clk(clk), .d(q1), .q(q2));
    my_dff8 dff3(.clk(clk), .d(q2), .q(q3));

    mux4way mux(.in0(d), .in1(q1), .in2(q2), .in3(q3), .sel(sel), .out(q));
endmodule