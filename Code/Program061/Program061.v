/*
Created by  : Vaisakh Dileep
Date        : 30, May, 2022
Description : This program helps to understand parameter in verilog.
*/

module understand_parameter();
// Verilog allows constants to be defined in a module by using the keyword "parameter". "parameter" cannot be used as variables.

    // parameter size; // An uninitialized parameter will give a compiler error.

    parameter size = 8;

    reg[size - 1:0] reg_vector_1 = 0;

    initial begin
        // size = 4; // We cannot update a parameter value after declaration.

        reg_vector_1[0] = 1;

        $display("reg_vector_1: %b", reg_vector_1);
    end
endmodule