module top_module (
    input ring, input vibrate_mode,
    output ringer, motor
);
    assign ringer = (ring & ~vibrate_mode) ? 1'b1 : 1'b0;
    assign motor = (ring & vibrate_mode) ? 1'b1 : 1'b0;
endmodule