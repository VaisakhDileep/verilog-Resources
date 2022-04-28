/*
Created by  : Vaisakh Dileep
Date        : 26, April, 2022
Description : This program demonstrates the different applications of blocking and non-blocking procedural assignment in verilog.
*/

module blocking_vs_non_blocking_procedural_assignment();

    reg a_1 = 1, a_2 = 0, b_1 = 0, b_2 = 1;

    reg clock = 0;

    always @(posedge clock) begin
        $display("a = b");

        a_1 = b_1;
    end

    always @(posedge clock) begin
        $display("b = a");

        b_1 = a_1;
    end // The above two "always @" block tries to swap 'a_1' and 'b_1'(Here we used blocking procedural assignment).

    reg a_3 = 1, b_3 = 0, a_3_temp, b_3_temp;

    always @(negedge clock) begin // This will work even though we are using blocking assignment.
        a_3_temp = a_3;
        b_3_temp = b_3;

        a_3 = b_3_temp;
        b_3 = a_3_temp;
    end

    always @(posedge clock) begin
        $display("a <= b");

        a_2 <= b_2;
    end

    always @(posedge clock) begin
        $display("b <= a");

        b_2 <= a_2;
    end // The above two "always @" block tries to swap 'a_2' and 'b_2'(Here we used non-blocking procedural assignment).

    initial begin
        clock = 1;

        #0.01 $display("a_1: %b\t b_1: %b", a_1, b_1); // Here we are not getting the desired output, since there is a race condition happening between "a_1 = b_1" and "b_1 = a_1", one of these will get executed first and other will be executed after it(previous value is not preserved).
        #1 $display("a_2: %b\t b_2: %b", a_2, b_2); // Here we get the desired output since the race condition is avoided as first the RHS expression is evaluated and stored in a temporary variable. The temporary variable is only populated to the LHS variable at the end of the time-step(previous value is preserved).

// Note: For viewing the updated value for a non-blocking, I have to skip to next time-step, my guess is that since it is non-blocking the LHS gets updated at the last moment in the previous time-step. This might be by why I have to skip to the beginning of the next-time step.
        clock = 0;

        #0.01 $display("a_3: %b\t b_3: %b", a_3, b_3);
    end

endmodule