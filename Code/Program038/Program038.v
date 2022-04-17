/*
Created by  : Vaisakh Dileep
Date        : 17, April, 2022
Description : This program helps to understand initial statement in verilog.
*/

module understand_initial_statement();

/*
There are two structured procedure statements in verilog:
1. always
2. initial

All other behavioral statements can appear only inside these structured procedure statements.

The statements "always" and "initial" cannot be nested.

Note: Verilog is a concurrent programming language unlike 'C' programming language. Each activity flow start at simulation time '0'.
*/

// Initial statement: An initial block starts at time '0', executes exactly once during the simulation and then does not execute again. If there are multiple initial blocks, each block starts to execute concurrently at time '0'.

// Note: Each block finishes execution independently of the other blocks.
// Note: If there are multiple statements inside the initial block, they are grouped using the keyword "begin" and "end". If there is only one statement, grouping is not necessary.

// The initial blocks are typically used for initialization, monitoring, waveforms and other processes that must be executed only once during the entire simulation run.

    initial
        $display("just 1 statement\n"); // We don't need to group here since there is only statement.

    initial begin
        $display("statement - 1");
        $display("statement - 2");
        $display("statement - 3");
    end

endmodule