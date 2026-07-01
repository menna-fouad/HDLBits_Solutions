module name(
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o0, o1, o2
);
    // This is a behavioural implementation
    assign outv = vec;
    assign o0 = vec[0];
    assign o1 = vec[1];
    assign o2 = vec[2];

    // To implemet this structurally, buffers (buf) can be used
    // buf b_out0(outv[0], vec[0]);
    // buf b_out1(outv[1], vec[1]);
    // buf b_out2(outv[2], vec[2]);

    // buf b_o0(o0, vec[0]);
    // buf b_o1(o1, vec[1]);
    // buf b_o2(o2, vec[2]);
endmodule