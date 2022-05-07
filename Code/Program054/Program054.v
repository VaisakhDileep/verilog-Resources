/*
Created by  : Vaisakh Dileep
Date        : 6, May, 2022
Description : This program helps to understand nested blocks in verilog.
*/

module understand_nested_blocks();

// Blocks can be nested in verilog.
// Note: Sequential and parallel blocks can be mixed when nesting.

    initial begin
        $display("1");
        $display("2");
        $display("3");

        fork // Notice here that the fork block will be executed sequentially in the sequential block, but the statements inside the fork block is executed parallel.
            $display("3.1");
            $display("3.2");
            $display("3.3");
            $display("3.4");
        join

        $display("4");
        $display("5");
        $display("6");
    end

endmodule