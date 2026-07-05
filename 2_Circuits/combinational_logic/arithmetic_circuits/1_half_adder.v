module top_module( 
    input a, b,
    output cout, sum
);
    // Behaviourally
    assign sum = a ^ b;
    assign cout = a & b;

    // Structurally
    xor SUM(sum, a, b);
    and CARRY(cout, a, b);
endmodule
