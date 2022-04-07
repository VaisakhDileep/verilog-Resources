/*
Created by  : Vaisakh Dileep
Date        : 6, April, 2022
Description : This program helps to understand the buf/not gates available in verilog.
*/

module understand_buf_not_gate();

// buf/not gates: They have one scalar input and one or more scalar outputs. The last terminal in the port list is connected to the input.

/*
The different buf/not gates available are:
1. buf
2. not
*/

    wire output_wire_1, output_wire_2, input_wire_1;

    buf buf_1(output_wire_1, input_wire_1);

    not not_1(output_wire_1, input_wire_1);

    buf buf_2(output_wire_1, output_wire_2, input_wire_1); // Note here we have more than one output wires.

    buf(output_wire_2, input_wire_1); // instance name need not be specified for primitives.

    // In order to understand the truth-table for the different buf/not gates refer: "truth_table_buf_not_gates.png"

endmodule