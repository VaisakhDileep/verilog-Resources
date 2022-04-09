/*
Created by  : Vaisakh Dileep
Date        : 8, April, 2022
Description : This program helps to understand gate-delays in verilog.
*/

module understand_gate_delays();

// In real circuits, logical gates have delays associated with them.

/*
There are three types of delays from inputs to output for a primitive gate:

1. Rise delay    : The rise delay is associated with a gate output transition to a '1' from another value('0', 'x', 'z').
2. Fall delay    : The fall delay is associated with a gate output transition to a '0' from another value('1', 'x', 'z').
3. Turn-off delay: The turn-off delay is associated with a gate output transition to the high impedance value('z') from another value.

// Note: If the value changes to 'x', the minimum of the three delays is considered.
*/

/*
Syntax for representing delays:
1. and #(delay_time) and_1(output_wire, input_wire_1, input_wire_2); // if only one delay is specified, this value is used for all transitions.
2. and #(rise_delay_value, fall_delay_value) and_1(output_wire, input_wire_1, input_wire_2) // if two delays are specified, they refer to the rise and the fall-delay values. The turn_off-delay value will be the minimum of the two delays.
3. and #(rise_delay_value, fall_delay_value, turn_off_delay_value) and_1(output_wire, input_wire_1, input_wire_2) // if all the three delays are specified, they refer to rise, fall and turn_off- delay values respectfully.
*/

    reg input_reg_1 = 1, input_reg_2 = 1;

    wire output_wire_1; // Do not initialize it to '0' or '1' as it might corrupt the "output_wire_1" value.

    and and_1(output_wire_1, input_reg_1, input_reg_2);

    reg input_reg_3 = 1, input_reg_4 = 1;

    wire output_wire_2;

    and #(5) and_2(output_wire_2, input_reg_3, input_reg_4); // Here all the delays will be '5'.

    reg input_reg_5 = 1, input_reg_6 = 0;

    wire output_wire_3;

    and #(6, 7) and_3(output_wire_3, input_reg_5, input_reg_6); // Here '6' is the rise-delay, '7' is the fall-delay.

    reg input_reg_7 = 1, control_reg = 1;

    wire output_wire_4;

    bufif1 #(9, 10, 11) bufif1_1(output_wire_4, input_reg_7, control_reg); // Here '9' is the rise-delay, '10' is the fall-delay, '11' is the turn_off-delay.

    time time_checkpoint_1;

    initial begin
        #0.001 $display("and_1(output_wire_1, 1, 1): output_wire_1->%-d    time-delay->%-d\n", output_wire_1, $time); // Notice that here since the delay is '0', it will get the "output_value" at the beginning itself.

        #1.001 $display("and_2(output_wire_2, 1, 1): output_wire_2->%-d    time-delay->%-d", output_wire_2, $time); // Notice here the "output_wire_2" is not updated, since there is a delay of '5' units.
        #1.001 $display("and_2(output_wire_2, 1, 1): output_wire_2->%-d    time-delay->%-d", output_wire_2, $time);
        #1.001 $display("and_2(output_wire_2, 1, 1): output_wire_2->%-d    time-delay->%-d", output_wire_2, $time);
        #1.001 $display("and_2(output_wire_2, 1, 1): output_wire_2->%-d    time-delay->%-d", output_wire_2, $time);
        #1.001 $display("and_2(output_wire_2, 1, 1): output_wire_2->%-d    time-delay->%-d\n", output_wire_2, $time); // "output_wire_2" is updated only after '5' time units(we transition from 'z' to 1, so it is a rise-delay).

        #1.001 $display("and_3(output_wire_3, 1, 0): output_wire_3->%-d    time-delay->%-d", output_wire_3, $time);
        #1.001 $display("and_3(output_wire_3, 1, 0): output_wire_3->%-d    time-delay->%-d\n", output_wire_3, $time); // "output_wire_3" is updated only after '7' time units(we transition from 'z' to 0, so it is a fall-delay).

        #1.001 $display("bufif_1(output_wire_4, 1, 0): output_wire_4->%-d    time-delay->%-d", output_wire_4, $time); // Notice how in the beginning "output_wire_4" has a value 'x' instead of 'z'. 'z' is asserted or de-asserted by the control signal.
        #1.001 $display("bufif_1(output_wire_4, 1, 0): output_wire_4->%-d    time-delay->%-d\n", output_wire_4, $time); // Notice here "output_wire_4" is updated only after '9' time units(we transition from 'x' to 1, so it is a rise-delay).

        control_reg = 0; // Note before this statement "output_wire_4" had value '1'.

        time_checkpoint_1 = $time; // Since we have the changed one of the input values, the circuit evaluation start over from the beginning.

        #1.001 $display("bufif_1(output_wire_4, 1, 0): output_wire_4->%-d    relative-time-delay->%-d", output_wire_4, $time - time_checkpoint_1);
        #1.001 $display("bufif_1(output_wire_4, 1, 0): output_wire_4->%-d    relative-time-delay->%-d", output_wire_4, $time - time_checkpoint_1);
        #1.001 $display("bufif_1(output_wire_4, 1, 0): output_wire_4->%-d    relative-time-delay->%-d", output_wire_4, $time - time_checkpoint_1);
        #1.001 $display("bufif_1(output_wire_4, 1, 0): output_wire_4->%-d    relative-time-delay->%-d", output_wire_4, $time - time_checkpoint_1);
        #1.001 $display("bufif_1(output_wire_4, 1, 0): output_wire_4->%-d    relative-time-delay->%-d", output_wire_4, $time - time_checkpoint_1);
        #1.001 $display("bufif_1(output_wire_4, 1, 0): output_wire_4->%-d    relative-time-delay->%-d", output_wire_4, $time - time_checkpoint_1);
        #1.001 $display("bufif_1(output_wire_4, 1, 0): output_wire_4->%-d    relative-time-delay->%-d", output_wire_4, $time - time_checkpoint_1);
        #1.001 $display("bufif_1(output_wire_4, 1, 0): output_wire_4->%-d    relative-time-delay->%-d", output_wire_4, $time - time_checkpoint_1);
        #1.001 $display("bufif_1(output_wire_4, 1, 0): output_wire_4->%-d    relative-time-delay->%-d", output_wire_4, $time - time_checkpoint_1);
        #1.001 $display("bufif_1(output_wire_4, 1, 0): output_wire_4->%-d    relative-time-delay->%-d", output_wire_4, $time - time_checkpoint_1);
        #1.001 $display("bufif_1(output_wire_4, 1, 0): output_wire_4->%-d    relative-time-delay->%-d\n", output_wire_4, $time - time_checkpoint_1); // Notice here "output_wire_4" is updated only after '11' time units(we transition from '1' to 'z', so it is a turn_off-delay).
    end

endmodule