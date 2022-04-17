/*
Created by  : Vaisakh Dileep
Date        : 17, April, 2022
Description : This program helps to understand conditional operator in verilog.
*/

module understand_conditional_operator();

/*
Syntax for conditional operator: conditional_expression ? true_expression : false_expression;

Here "conditional_expression" is first evaluated. If the result is true then the "true_expression" is evaluated. If the result is false then the "false_expression" is evaluated.

Note: If "conditional_expression" is evaluated to 'x', then both "true_expression" and "false_expression" are evaluated and their results are compared bit by bit to return for each bit position an 'x' if the bits are different and value of the bits if they are same.
*/

    reg control_1 = 1;
    reg control_2;

    reg result_1;

    reg[0:4] result_2;

    initial begin
        result_1 = (control_1 == 1) ? 0 : 1;

        $display("(control_1 == 1) ? 0 : 1 = %b\n", result_1);

        result_2 = (control_2) ? 5'b01101 : 5'b10100;

        $display("(control_2) ? 5'b01101 : 5'b10100 = %b\n", result_2);

        control_2 = 0;

        result_2 = (control_2 == 1) ? 5'b00000 : ((control_1 == 1) ? 5'b11111 : 5'b01010);

        $display("(control_2 == 1) ? 5'b00000 : ((control_1 == 1) ? 5'b11111 : 5'b01010) = %b", result_2);
    end

endmodule