/*
Created by  : Vaisakh Dileep
Date        : 25, May, 2022
Description : This program helps to understand assign and deassign in verilog.
*/

module understand_assign_deassign_keywords();

// "assign" and "deassign" are used to express procedural continuous assignment. The left side of the procedural continuous assignments can only be a register or a concatenation of registers. It cannot be a part or bit select of a net or an array of registers.

    integer result = 0, counter = 0;

    integer one = 0;

    initial begin
        assign result = counter;

        while(1) begin
            #1 counter = counter + 1;
        end
    end

    initial begin
        #100 deassign result; // The value is one less that the "$time" value, since it is de-assigned in the last time-unit, therefore not updated.

        $display("%-3d {time -> %-3d}\n", result, $time);

        #1000 $finish; // To terminate the program.
    end

    initial begin
        #101; // So that this block will be displayed at the end.

        assign one = 1; // "one" will always be '1'.

        $display("one: %-d", one);

        #100 one = 0;

        $display("one: %-d", one);

        #100 one = 0;

        $display("one: %-d", one); // No matter what we do we cannot assign "one" to a different value.

        deassign one; // This will allow us to update "one".

        one = 0;

        $display("one: %-d", one);
    end

endmodule