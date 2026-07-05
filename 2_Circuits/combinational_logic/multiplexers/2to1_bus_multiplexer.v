module top_module(
    input a, b, sel,
    output out
);
    // Behaviourally
    assign out = sel ? b : a;
    
    // Structurally
    wire not_sel, t1, t2;
    not NOT(not_sel, sel);
    and AND1(t1, not_sel, a);
    and AND2(t2, sel, b);
    or OR(out, t1, t2);
endmodule