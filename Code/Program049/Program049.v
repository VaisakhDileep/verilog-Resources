/*
Created by  : Vaisakh Dileep
Date        : 4, May, 2022
Description : This program helps to understand for loop in verilog.
*/

module understand_for_loop();

// for loop: The keyword "for" is used to specify this type of loop.

/*
The for loop has three parts:
1. The initial condition.
2. Terminating condition.
3. Procedural assignment to change 
*/

    integer counter;

    reg[0:49] memory;

    initial begin
        for(counter = 10; counter > 0; counter = counter - 1) begin
            $display("%-d", counter);
        end

        $display("memory: %b", memory);

        for(counter = 0; counter < 50; counter = counter + 1) begin
            memory[counter] = 1;
        end

        $display("memory: %b", memory);
    end

endmodule