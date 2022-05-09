/*
Created by  : Vaisakh Dileep
Date        : 7, May, 2022
Description : This program helps to understand disable keyword in verilog.
*/

module understand_disable_keyword();

// The keyword "disable" is used to terminate the execution of a block. It allows disabling any named block in the design.
// Note: Disabling a block causes the execution control to be passed to the statement immediately succeeding the block.

    integer counter = 0;

    initial begin
        begin: while_loop
            while(1) begin
                counter = counter + 1;

                $display("Incrementing counter");

                if(counter == 10) begin
                    disable while_loop;
                end
            end
        end

        $display("Finished incrementing counter");
    end

endmodule