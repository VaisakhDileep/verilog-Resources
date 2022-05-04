/*
Created by  : Vaisakh Dileep
Date        : 4, May, 2022
Description : This program helps to understand while loop in verilog.
*/

/*
The looping statements available in verilog are:
1. while
2. for
3. repeat
4. forever
*/

// Note: All looping statements should appear inside an initial or always block.

module understand_while_loop();

// while loop: The keyword "while" is used to specify this loop. This loop will execute until the while-expression becomes false.

    integer counter = 10;

    initial begin
        while(counter > 0) begin
            $display("%-d", counter);

            counter = counter - 1;
        end
    end

endmodule