/*
Created by  : Vaisakh Dileep
Date        : 5, May, 2022
Description : This program helps to understand forever loop in verilog.
*/

module understand_forever_loop();

// forever loop: The keyword "forever" is used to specify this type of loop. The forever loop executes forever until the "$finish" task is encountered.

// Note: forever loop is equivalent to while loop with an expression that always evaluates to true.
// Note: forever loop can be exited by the use of the disable statement.

    reg clock = 0;

    initial begin
        forever begin
            #1 clock = ~clock; // Removing '#1' will cause the program to pause here, the simulation will not progress.
        // Note: forever lope is typically used along with timing control constructs. If timing control construct is not present, the verilog simulator will execute this statement infinitely without advancing the simulation time(the rest of the design would never be executed).
        end
    end

    initial begin
        #1 $display("clock: %b", clock);
    end

endmodule