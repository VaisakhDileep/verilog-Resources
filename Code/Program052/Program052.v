/*
Created by  : Vaisakh Dileep
Date        : 6, May, 2022
Description : This program helps to understand sequential block in verilog.
*/

module understand_sequential_block();

// The statements in a sequential block are executed one after the other.
// The keywords "begin" and "end" are used to group statements into a sequential block.

/*
Properties of sequential blocks:
1. The statements in the sequential block are processed in the order they are specified. A statement is executed only after it's preceding statements complete execution(non-blocking assignment is an exception).
2. Delay is relative to the simulation time when the previous statement in the block finishes it's execution.
*/

    initial begin
        $display("1st");

        $display("2nd");

        #1 $display("3rd");

        $display("4th");
    end

endmodule