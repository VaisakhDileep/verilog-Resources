/*
Created by  : Vaisakh Dileep
Date        : 2, May, 2022
Description : This program helps to understand conditional statements in verilog.
*/

/*
The syntax for the different types of conditional statements are:
1. if format:
if(<expression>) begin // Note "<expression>" returns "true" if it is '1' or a non-zero value, "<expression>" returns "false" if it is '0' or any ambiguous value('x' or 'z').
    statement_1;
    statement_2;
         .
         .
         .
    statement_n;
end

2. if-else format:
if(<expression>) begin
    statement_1;
    statement_2;
         .
         .
         .
    statement_n;
end
else begin
    statement_1;
    statement_2;
         .
         .
         .
    statement_n;
end

3. if-"else if"- else format:
if(<expression>) begin
    statement_1;
    statement_2;
         .
         .
         .
    statement_n;
end
else if(<expression>) begin
    statement_1;
    statement_2;
         .
         .
         .
    statement_n;
end
else begin
    statement_1;
    statement_2;
         .
         .
         .
    statement_n;
end
*/

module understand_conditional_statements();

    integer integer_value = 5;

    initial begin
        if(integer_value > 5) // If there is only one statement we can ignore "begin" and "end".
            $display("\"integer_value\" is greater than 5.");
        else if(integer_value < 5)
            $display("\"integer_value\" is lesser than 5.");
        else
            $display("\"integer_value\" is equal to 5.");
    end

endmodule