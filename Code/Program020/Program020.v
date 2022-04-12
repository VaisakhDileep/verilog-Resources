/*
Created by  : Vaisakh Dileep
Date        : 6, April, 2022
Description : This program helps to understand bufif/notif gates available in verilog.
*/

module understand_bufif_notif_gate();

// bufif/notif: They are buf or not gates with an additional control signal. These gates propagate only if their control signal is asserted. They propagate 'z' if their control signal is de-asserted.

/*
The different bufif/notif gates available are:
1. bufif1 -> behaves as buf gate if control signal is 1.
2. bufif0 -> behaves as buf gate if control signal is 0.
3. notif1 -> behaves as not gate if control signal is 1.
4. notif0 -> behaves as not gate if control signal is 0.
*/

    wire output_wire_1, output_wire_2, input_wire_1, control_wire;

    bufif0 bufif0_1(output_wire_1, input_wire_1, control_wire);

    bufif1 bufif1_1(output_wire_1, input_wire_1, control_wire);

    notif0 notif0_1(output_wire_1, input_wire_1, control_wire);

    notif1 notif1_1(output_wire_1, input_wire_1, control_wire);

    // bufif0 bufif0_2(output_wire_1, output_wire_2, input_wire_1, control_wire); // "bufif/notif" gates should have exactly three inputs(output, input, control).

    bufif0(output_wire_2, input_wire_1, control_wire); // instance names need not be specified for primitives.

    // In order to understand the truth-table for the different bufif/notif gates refer: "truth_table_bufif_notif_gates.png"
    // In the truth-table 'L' stands for output having either '0' or 'z' value.
    // In the truth-table 'H' stands for output having either '1' or 'z' value.

endmodule