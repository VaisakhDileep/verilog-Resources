/*
Created by  : Vaisakh Dileep
Date        : 14, April, 2022
Description : This program helps to understand relational operators in verilog.
*/

module understand_relational_operators();

// The different relational operators available in verilog are: greater-than('>'), less-than('<'), greater-than-or-equal-to('>='), lesser-than-or-equal-to('<=).

    reg[0:2] operand_1, operand_2;

    reg operand_3, operand_4;

    initial begin
// If relational operators are used in an expression, the expression returns a logical value of '1' if the expression is true and a logical value of '0' if the expression is false.
        operand_1 = 7;
        operand_2 = 3;

        $display("%b > %b = %b", operand_1, operand_2, operand_1 > operand_2);
        $display("%b < %b = %b\n", operand_1, operand_2, operand_1 < operand_2);

        $display("%b >= %b = %b", operand_1, operand_2, operand_1 >= operand_2);
        $display("%b <= %b = %b\n", operand_1, operand_2, operand_1 <= operand_2);

        operand_2 = 7;

        $display("%b >= %b = %b", operand_1, operand_2, operand_1 >= operand_2);
        $display("%b <= %b = %b\n", operand_1, operand_2, operand_1 <= operand_2);

        operand_3 = 1;
// If there any 'x' or 'z' bits in the operand, the expression take the value 'x'.

        $display("%b > %b = %b", operand_3, operand_4, operand_3 > operand_4);
        $display("%b < %b = %b\n", operand_3, operand_4, operand_3 > operand_4);

        $display("%b >= %b = %b", operand_3, operand_4, operand_3 > operand_4);
        $display("%b <= %b = %b", operand_3, operand_4, operand_3 > operand_4);
    end

endmodule