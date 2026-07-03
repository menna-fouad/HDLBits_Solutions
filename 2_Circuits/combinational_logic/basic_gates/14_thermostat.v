module top_module (
    input too_cold, too_hot, mode, fan_on,
    output heater, aircon, fan
);
    // Behaviourally
    assign heater = mode & too_cold;
    assign aircon = ~mode & too_hot;
    assign fan = heater | aircon | fan_on;

    // Structurally
    wire not_mode;
    not NOT(not_mode, mode);
    and G1(heater, mode, too_cold);
    and G2(aircon, not_mode, too_hot);
    or G3(fan, heater, aircon, fan_on);
endmodule