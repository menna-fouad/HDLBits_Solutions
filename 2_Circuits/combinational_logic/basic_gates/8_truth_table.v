module top_module(
    input x3, x2, x1,
    output f 
);
    // Behaviourally
    assign f = (~x3 & x2 & ~x1) +
               (~x3 & x2 & x1) +
               (x3 & ~x2 & x1) +
               (x3 & x2 & x1);
    
    // Structurally
    wire not_x3, not_x2, not_x1;
    wire sop1, sop2, sop3, sop4;

    not NOT1(not_x1, x1);
    not NOT2(not_x2, x2);
    not NOT3(not_x3, x3);

    and AND1(sop1, not_x3, x2, not_x1);
    and AND2(sop2, not_x3, x2, x1);
    and AND3(sop3, x3, not_x2, x1);
    and AND4(sop4, x3, x2, x1);

    or OR(f, sop1, sop2, sop3, sop4);

    // Simplified
    assign f = (~x3 & x2) + (x3 & x1);

    // Structurally
    wire not_x3, t1, t2;
    not NOT(not_x3, x3);
    and AND1(t1, not_x3, x2);
    and AND2(t2, x3, x1);
    or OR(f, t1, t2);
endmodule