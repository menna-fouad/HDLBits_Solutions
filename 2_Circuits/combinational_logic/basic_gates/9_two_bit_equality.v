module top_module(
    input [1:0] A, B,
    output z
);
    // Behaviourally
    assign z = A == B;

    // Structurally
    wire t1, t2;
    xnor XNOR1(t1, A[0], B[0]); // t1 = 1 if A[0] == B[0]
    xnor XNOR2(t2, A[1], B[1]); // t1 = 2 if A[1] == B[1]
    and AND(z, t1, t2); // z = 1 if both A[0] == B[0] AND A[1] == B[1]
endmodule