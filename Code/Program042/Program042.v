/*
Created by  : Vaisakh Dileep
Date        : 29, April, 2022
Description : This program helps to understand delay-based timing control in verilog.
*/

/*
There are three methods of timing control available in verilog:
1. delay-based timing control
2. event-based timing control
3. level-sensitive timing control
*/

module understand_delay_based_timing_control();

// Delay-base timing control is an expression specifies the time duration between when the statement is encountered and when it is executed. Delays are specified by the symbol '#'.
// Delay-based timing control can be specified by a number, identifier or an mintypmax_expression("mintypmax" is short for "minimum typical maximum").

/*
There are three types of delay control for procedural assignments:
1. regular delay control
2. intra-assignment control
3. zero delay control
*/
    reg[0:1] delay_1 = 2;

    reg[0:1] delay_2 = 1;

    reg[0:4] reg_variable_1, reg_variable_2, reg_variable_3, temp_reg_variable;

    reg reg_value_1, reg_value_2, reg_value_3, reg_value_4;

    initial begin
    // Regular delay control: It is used when a non-zero delay is specified to the left of a procedural assignment.

        #1 $display("time: %-2d", $time);

        #(1:2:3) $display("time: %-2d", $time); // This delay is in "min/typ/max" format.

        #delay_1 $display("time: %-2d", $time); // Delay can also be expressed as an identifier.

        #(delay_1 + delay_2) $display("time: %-2d\n", $time); // Delay can also be expressed as an expression.
    
    // Intra-assignment delay control: Here we assign the delay in the right of the assignment operator('='). It's behavior is different from regular delay control.

        reg_variable_1 = #5 1 + 2; // Here "1 + 2"  will be evaluated first and then the simulator will wait 5 time-units before it is assigned to "reg_variable_1".

        $display("reg_variable_1: %d {time -> %-2d}", reg_variable_1, $time);

        #5 reg_variable_2 = 1 + 2; // Here the whole statement "reg_variable = 1 + 2" will be executed after 5 time-units.

        $display("reg_variable_2: %d {time -> %-2d}", reg_variable_2, $time);

        temp_reg_variable = 1 + 2;

        #5 reg_variable_3 = temp_reg_variable; // The above two statements work similar to the intra-assignment statement("reg_variable_1").

        $display("reg_variable_3: %d {time -> %-2d}\n", reg_variable_3, $time);
    end

    initial begin
        reg_value_1 = 1;
        reg_value_2 = 1;

        #100 $display("@1\nreg_value_1 = %d\nreg_value_2 = %d", reg_value_1, reg_value_2); // I have put delay as '100' so that this statement is executed at the end.
    end

    initial begin
        reg_value_1 = 0;
        reg_value_2 = 0;

        #100 $display("@2\nreg_value_1 = %d\nreg_value_2 = %d\n", reg_value_1, reg_value_2); // I have put delay as '100' so that this statement is executed at the end.
    end

// Notice how in the above two initial blocks there is a race condition and the second initial block gets executed first for '0th' time-unit.

// zero delay control: Zero delay control is a method to ensure that a statement is executed last, after all other statements in that simulation time are executed. It is mainly used to eliminated race condition.
// Note: If there are multiple zero delay statements, the order between them is non-deterministic.

    initial begin
        #0 reg_value_3 = 1; // Here adding "#0" at the right side of the equation will make the statement zero-delay, this means that in the same time-unit, this statement will be executed last.
        #0 reg_value_4 = 1;
    
        #101 $display("@1\nreg_value_3 = %d\nreg_value_4 = %d", reg_value_3, reg_value_4);
    end

    initial begin
        reg_value_3 = 0;
        reg_value_4 = 0;

        #101 $display("@2\nreg_value_3 = %d\nreg_value_4 = %d", reg_value_3, reg_value_4);
    end

endmodule