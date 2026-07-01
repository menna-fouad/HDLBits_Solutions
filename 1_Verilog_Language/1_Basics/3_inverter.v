module top_module(
    input in,
    output out
);
    not G(out, in); 
    
    // can also be done behaviourally:
    // assign out = ~in;
endmodule