/*
Created by  : Vaisakh Dileep
Date        : 5, May, 2022
Description : This program helps to understand repeat loop in verilog.
*/

module understand_repeat_loop();

// repeat loop: The keyword "repeat" is used to specify this type of loop. The repeat loop executes the loop a fixed number of times.

// Note: The repeat loop cannot be used on logical expression, we have to provide a number, which can be a constant, variable or a signal value.
// Note: If the number is a variable or signal value, it is evaluated only when the loop starts and not during the loop execution.

    integer counter = 10;

    initial begin
        repeat(counter) begin
            $display("%-d", counter);

            counter = counter - 1;
        end
    end

endmodule