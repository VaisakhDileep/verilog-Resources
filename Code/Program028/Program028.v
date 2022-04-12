/*
Created by  : Vaisakh Dileep
Date        : 12, April, 2022
Description : This program helps to understand arithmetic operators in verilog.
*/

module understand_arithmetic_operators();

/*
Arithmetic operations in verilog can be divided into two types:
1. Binary operators: multiply('*'), divide('/'), add('+'), subtract('-'), modulus('%').
2. Unary operators : positive('+'), negative('-').

Note: Unary '+' and '-' have higher precedence over binary '+' and '-'.
*/

    reg[0:3] operand_1 = 11, operand_2 = 4;

    wire[0:3] addition_result = operand_1 + operand_2;

    wire[0:3] subtraction_result = operand_1 - operand_2;

    wire[0:5] multiplication_result = operand_1 * operand_2;

    wire[0:3] division_result = operand_1 / operand_2;

    wire[0:3] modulus_result = operand_1 % operand_2;

    wire[0:3] positive_operand_1 = +operand_1;

    wire[0:3] negative_operand_1 = -operand_1;

    reg[0:4] padded_operand_1 = 11;

    wire[0:4] negative_padded_operand_1 = -padded_operand_1;

    integer negative_integer_operand_1 = -11;

    initial begin
        #0.001 $display("%d + %d = %-d", operand_1, operand_2, addition_result);

        $display("%d - %d = %-d", operand_1, operand_2, subtraction_result);

        $display("%d * %d = %-d", operand_1, operand_2, multiplication_result);

        $display("%d / %d = %-d", operand_1, operand_2, division_result); // Division result will be truncated.

        $display("%d %% %d = %-d\n", operand_1, operand_2, modulus_result);

        $display("positive_operand_1: %-d\n", positive_operand_1);
        
        $display("negative_operand_1: %-d", negative_operand_1);
        $display("negative_operand_1: %b\n", negative_operand_1); // When using the unary '-' operator, verilog substitutes it with the 2's complement(unsigned 2's complement) as evident from the binary representation.

        $display("negative_padded_operand_1: %-d", negative_padded_operand_1);
        $display("negative_padded_operand_1: %b\n", negative_padded_operand_1); // Even padding a sign bit won't make a difference.

        $display("negative_integer_operand_1: %-d", negative_integer_operand_1); // It is advisable to use negative numbers only of the type integer or real in expressions.
        $display("negative_integer_operand_1: %b\n", negative_integer_operand_1);

        $display("-10 / 5   = %d", -10 / 5);
        $display("-32'd10 / 5 = %d", -32'd10 / 5); // This is not our expected result, since in the expression we used "<size>'<base format> <number>" format, "-32'd10" will be first converted into unsigned 2's complement representation making it a very huge number.
    end

endmodule