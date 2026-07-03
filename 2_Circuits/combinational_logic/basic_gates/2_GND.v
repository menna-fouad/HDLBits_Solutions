module top_module(
    output out
);
    assign out = 1'b0;
    // structurally:
    buf buffer(out, 1'b0);
endmodule