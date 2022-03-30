/*
Created by  : Vaisakh Dileep
Date        : 30, March, 2022
Description : This program helps to understand nets in verilog.
*/

module understand_nets();

// Nets represent connections between hardware elements. They have values continuously driven on them by the outputs of the devices that they are connected to. Nets are defaulty 1-bit with default value set to 'z'(except for "trireg" where it is set to 'z').

// Nets get the output value of their drivers. If the net has no driver, it gets the value 'z'.

// Note: Net is not a keyword but represents a class of data-types such as wire, wand, wor, tri, triand, trior, trireg, ... etc.

    wire wire_1;

    wire wire_2, wire_3; // We can declare multiple wires at a time.

    wire wire_4 = 1'b1; // This wire is fixed to logic value '1' at declaration.

    initial begin
        $finish;
    end

endmodule