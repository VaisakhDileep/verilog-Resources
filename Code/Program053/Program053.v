/*
Created by  : Vaisakh Dileep
Date        : 6, May, 2022
Description : This program helps to understand parallel block in verilog.
*/

module understand_parallel_block();

// Parallel blocks are specified by the keyword "fork" and "join"

// Note: Unlike sequential blocks, all statements in the parallel block start at the same time when the block is entered. Thus the order in which the statements are written in the block are not important.
// Note: The keyword "fork" can be viewed as splitting a single flow into independent flows.
// Note: The keyword "join" can be seen as joining the independent flows back into a single flow.

/*
Properties of parallel blocks:
1. Statements in a parallel block are executed concurrently.
2. Ordering of the statements is controlled by the delay or event control assigned to each statement.
3. If delay or event control is specified, it is relative to the time the block was entered.
*/

    initial fork
        $display("1st {time -> %-2d}", $time); // The statements are not executed in order, since there is a race-condition occurring as all the statements arrive at the 0th time-cycle.

        $display("2nd {time -> %-2d}", $time);

        #1 $display("3rd {time -> %-2d}", $time);

        $display("4th {time -> %-2d}", $time); // Notice this is executed in the 0th time-cycle.
    join

endmodule