/*
Created by  : Vaisakh Dileep
Date        : 17, April, 2022
Description : This program helps to understand always statement in verilog.
*/

module understand_always_statement();

// The always statement starts at time '0' and executes the statements in the always block continuously in a looping fashion. This statement is used to model a block of activity that is repeated continuously in a digital circuit.

// The always block will be active as long as the circuit is powered on.

    always
        #1 $display($time);

    initial
        #10 $finish; // This will terminate the simulation. If there is no "$stop" or "$finish" statement, the program will run forever.

endmodule