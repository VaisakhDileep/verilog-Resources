/*
Created by  : Vaisakh Dileep
Date        : 31, March, 2022
Description : This program helps to understand arrays in verilog.
*/

module understand_arrays();

// Arrays are supported in verilog for reg, integer, time and vector register data types. Arrays are not allowed for real data types.
// Note: Multi-dimensional arrays are not permitted in verilog.

// Difference between vectors and arrays: A vector is a single element that is n-bit wide. Arrays are multiple elements that are 1-bit or n-bit wide.

    integer integer_array_variable_1[0:7]; // An array of 8 integer variables.

    integer integer_array_variable_2[7:0]; // Behaves exactly like the code above.

    reg reg_array_variable[0:31]; // Array of 32 1-bit register variables.

    reg[4:0] reg_vector_array_variable[0:7]; // Array of 8 registers with width of 8-bits.

    time time_array_variable[0:8]; // Array of 9 time checkpoints.

    integer i;

    initial begin
        integer_array_variable_1[0] = 1;
        integer_array_variable_2[0] = 1;

        reg_array_variable[0] = 1;

        $write("integer_array_variable_1: ");
        for(i = 0; i < 8; i = i + 1)
        begin
            $write("%-d", integer_array_variable_1[i]);
        end
        $write("\n");

        $write("integer_array_variable_2: ");
        for(i = 0; i < 8; i = i + 1)
        begin
            $write("%-d", integer_array_variable_2[i]);
        end
        $write("\n\n");

        $write("reg_array_variable: ");
        for(i = 0; i < 32; i = i + 1)
        begin
            $write("%-d", reg_array_variable[i]);
        end
        $write("\n");
    end

endmodule