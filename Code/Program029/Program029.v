/*
Created by  : Vaisakh Dileep
Date        : 12, April, 2022
Description : This program helps to understand logical operators in verilog.
*/

module understand_logical_operators();

/*
Logical operators in verilog can be divided into two types:
1. Binary operators: logical-and('&&'), logical-or('||').
2. Unary operators : logical-not('!').
*/

/*
Properties of logical operators are:
1. Logical operators always evaluate to a 1-bit value, '0'(false), '1'(true) or 'x'(ambiguous).
2. If an operand bit is 'x' or 'z', it is equivalent to 'x'(ambiguous) and is normally treated by the simulator as false condition.
3. Logical operators can take variables or expressions as operands.
*/

    reg operand_1, operand_2;

    reg operand_3;

    reg[0:1] operand_4, operand_5;

    initial begin
        operand_1 = 1;
        operand_2 = 0;

        $display("%b && %b = %b", operand_1, operand_2, operand_1 && operand_2);

        $display("%b || %b = %b\n", operand_1, operand_2, operand_1 || operand_2);

        $display("%b && %b = %b", operand_1, operand_3, operand_1 && operand_3);

        $display("%b || %b = %b\n", operand_1, operand_3, operand_1 || operand_3);

        if(operand_1 && operand_3) // As evident above "operand_1 && operand_2" will be evaluated to 'x'. Verilog simulator internally treats 'x' as '0'(false).
        begin
            $display("This will never be printed.");
        end

        operand_4 = 2; // When evaluating any number other than '0' will be considered '1'.
        operand_5 = 0;

        $display("%b && %b = %b", operand_4, operand_5, operand_4 && operand_5);

        $display("%b || %b = %b", operand_4, operand_5, operand_4 || operand_5);
    end

endmodule