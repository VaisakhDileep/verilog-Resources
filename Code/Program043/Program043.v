/*
Created by  : Vaisakh Dileep
Date        : 29, April, 2022
Description : This program helps to understand min/typ/max values in gate-delays in verilog.
*/

module understand_min_typ_max_values_gate_delays();

// Verilog provides an additional level of control for each type of delay(rise, fall and turn-off), the values are "min", "typ" and "max".
// min/typ/max values are used to model devices whose delays vary withing a maximum and minimum range because of the IC fabrication process variations.

// min: The min value is the minimum delay value that the designer expects the gate to have.
// typ: The typ value is the typical delay value that the designer expects the gate to have.
// max: The max value is the maximum delay value that the designer expects the gate to have.

// Note: min/typ/max values can be chose at verilog run-time.
// If no option is specified at run-time, then the typical delay value is chosen.

/*
Since I am using iVerilog the following commands can be used to compile and run the program.
For using min -> iverilog -Tmin -o Program043 Program043.v; vvp Program043;
For using typ -> iverilog -Ttyp -o Program043 Program043.v; vvp Program043;
For using max -> iverilog -Tmax -o Program043 Program043.v; vvp Program043;
*/

    reg input_reg_1 = 1, input_reg_2 = 1;

    wire output_wire_1;

    and #(2:4:8) and_1(output_wire_1, input_reg_1, input_reg_2);

    reg input_reg_3 = 1, input_reg_4 = 0;

    wire output_wire_2;

    and #(1:2:4, 2:4:8) and_2(output_wire_2, input_reg_3, input_reg_4); // They refer to rise and fall-delay values.

    reg input_reg_5 = 0, input_reg_6 = 1;

    wire output_wire_3;

    and #(1:2:4, 2:4:8, 3:6:12) and_3(output_wire_3, input_reg_5, input_reg_6); // They refer to rise, fall and turn_off-delay values.

    initial begin
        #0.001 $display("and_1(output_wire_1, 1, 1): output_wire->%-d    time-delay->%-d\n", output_wire_1, $time);

        #1 $display("and_1(output_wire_1, 1, 1): output_wire->%-d    time-delay->%-d", output_wire_1, $time);
        #1 $display("and_1(output_wire_1, 1, 1): output_wire->%-d    time-delay->%-d", output_wire_1, $time);
        #1 $display("and_1(output_wire_1, 1, 1): output_wire->%-d    time-delay->%-d", output_wire_1, $time);
        #1 $display("and_1(output_wire_1, 1, 1): output_wire->%-d    time-delay->%-d", output_wire_1, $time);
        #1 $display("and_1(output_wire_1, 1, 1): output_wire->%-d    time-delay->%-d", output_wire_1, $time);
        #1 $display("and_1(output_wire_1, 1, 1): output_wire->%-d    time-delay->%-d", output_wire_1, $time);
        #1 $display("and_1(output_wire_1, 1, 1): output_wire->%-d    time-delay->%-d", output_wire_1, $time);
        #1 $display("and_1(output_wire_1, 1, 1): output_wire->%-d    time-delay->%-d\n", output_wire_1, $time); // Trying running the program using all the flags.
    end

endmodule