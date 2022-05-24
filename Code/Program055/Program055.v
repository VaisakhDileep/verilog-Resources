/*
Created by  : Vaisakh Dileep
Date        : 7, May, 2022
Description : This program helps to understand named blocks in verilog.
*/

module understand_named_blocks();
// Blocks can be named in verilog.

/*
Features of named blocks:
1. Local variables can be declared for the named block.
2. Named blocks are part of the design hierarchy. Variables in the named block can be accessed by using hierarchial name referencing.
3. Named blocks can be disabled(their execution can be stopped). Refer "Program056.Program056.v".
*/

    initial begin: block_1
        // integer integer_variable = 10; // in iverilog we are not allowed to use variable declaration assignment at module level.

        integer integer_variable;

        integer_variable = 10;

        #5 $display("integer_variable: %-d", integer_variable);
    end

    initial begin
        #2 block_1.integer_variable = 20; // We can access the lock variable in "block_1" by using hierarchial name referencing.
    end

endmodule