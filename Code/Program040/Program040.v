/*
Created by  : Vaisakh Dileep
Date        : 17, April, 2022
Description : This program helps to understand procedural assignment in verilog.
*/

module understand_procedural_assignment();

// Procedural assignment updates value of reg, integer, real or time variables. The value placed on the variable will remain unchanged until another procedural assignment updates the variable with a different value.

/*
The left-hand side of a procedural assignment can be one of the following:
1. A reg, integer, real or time register variable or a memory element.
2. A bit select of these variables.
3. A part select of these variables.
4. A concatenation of any of the above.
*/

    reg reg_variable;

    reg[0:4] reg_vector_part_1;
    reg[0:4] reg_vector_part_2;

    reg variable_1;
    reg variable_2;
    reg variable_3;
    reg variable_4;

    time current_time;

    initial begin
        reg_variable = 1;

        $display("reg_variable = %b\n", reg_variable); // This is a procedural assignment.

        {reg_vector_part_1, reg_vector_part_2} = 'b1011001111; // See here we concatenated the two reg vectors in the procedural assignment.

        $display("{reg_vector_part_1, reg_vector_part_2} = %b\n", {reg_vector_part_1, reg_vector_part_2});

    /*
    Procedural assignments can be divided into:
    1. Blocking assignments: Blocking assignment statements are executed in the order they are specified in a sequential block. '=' operator is used to specify blocking assignments.
        Note: Blocking assignments do not block execution of statements that follow in a parallel block.

    2. Non-Blocking assignments: Non-Blocking assignments allow scheduling of assignments without blocking execution of statements that follow in a sequential block. '<=' operator is used to specify non-blocking assignments.
    */

    // Demonstrating blocking assignment
        #1 variable_1 = 1;

        $display("variable_1 = %b {time -> %-3d}", variable_1, $time);

        #1 variable_2 = 1;

        $display("variable_2 = %b {time -> %-3d}", variable_2, $time);

        variable_3 = 1; // Notice how this statement is blocked until time '2'.

        $display("variable_3 = %b {time -> %-3d}", variable_3, $time);

        variable_4 = 'b10; // Notice here the width exceeds the size of "variable_4", the MSB part will be skimmed off.

        $display("variable_4 = %b {time -> %-3d}\n", variable_4, $time);
    // Demonstrating non-blocking assignment
// Note: Typically non-blocking statements are execute last in the given time step they are scheduled(after all the blocking statements in the time step are completed).
        current_time = $time;

        variable_1 <= #1 0;

        $display("variable_1 = %b {time -> %-3d}", variable_1, $time - current_time);

        variable_2 <= #1 0; // Notice here that "variable_1" and "variable_2" gets updated at the same time-step, but the statement in between them gets executed in a different time-step.

        $display("variable_2 = %b {time -> %-3d}", variable_2, $time - current_time);

        variable_3 = 0; // Notice here there is no delay.

        $display("variable_3 = %b {time -> %-3d}", variable_3, $time - current_time);
        //$monitor("%d %d", variable_3, $time);

        variable_4 = 1; // Notice here there is no delay.

        $display("variable_4 = %b {time -> %-3d}\n", variable_4, $time - current_time);

        #1 $display("variable_1 = %b\n", variable_1); // Notice here this is not updated, this is because "variable_1" is updated by a non-blocking assignment statement and this will be executed only after all the blocking statements in the time-step gets executed(in this case "$display()").

        $monitor("variable_1 = %b {time -> %-3d}", variable_1, $time);
    end

endmodule