/*
Created by  : Vaisakh Dileep
Date        : 4, April, 2022
Description : This program helps to understand the and/or gates available in verilog.
*/

module understand_and_or_gate();

// Verilog supports basic logic gates as predefined primitives. These primitives are instantiated like modules except that they are predefined in verilog and do not need a module definition.

/*
There are two classes of basic gates:
1. and/or gates
2. buf/not gates
*/

// and/or gates: They have one scalar output and multiple scalar inputs. The first terminal in the list of gate terminals is the output and the other terminals are for input.

/*
The different and/or gate available are:
1. and      4. nand
2. or       5. nor
3. xor      6. xnor
*/

    wire output_wire, input_wire_1, input_wire_2, input_wire_3;

    and and_1(output_wire, input_wire_1, input_wire_2);

    nand nand_1(output_wire, input_wire_1, input_wire_2);

    or or_1(output_wire, input_wire_1, input_wire_2);

    nor nor_1(output_wire, input_wire_1, input_wire_2);

    xor xor_1(output_wire, input_wire_1, input_wire_2);

    xnor xnor_1(output_wire, input_wire_1, input_wire_2);

    and and_2(output_wire, input_wire_1, input_wire_2, input_wire_3); // Note here we have more than two input wires.

    and(output_wire, input_wire_2, input_wire_3); // instance name need not be specified for primitives.

    // In order to understand the truth-table for the different and/or gates refer: "truth_table_and_or_gates.png".

endmodule