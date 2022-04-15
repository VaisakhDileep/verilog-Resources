/*
Created by  : Vaisakh Dileep
Date        : 15, April, 2022
Description : This program helps to understand bitwise operators in verilog.
*/

module understand_bitwise_operators();

// The different bitwise operators available are: negation('~'), and('&'), or('|'), xor('^'), xnor('^~' or '~^').

// Bitwise operators perform bit-by-bit operation on two operands or single operand in case of negation('~').

// Note: If one of the operand is shorter than the other one it is bit extended.
// Note: 'z' is treated as 'x' in bitwise operation.

// In order to understand the truth table of the different bitwise operators refer: "truth_table_bitwise_operators.png".

    reg[0:4] operand_1 = 'b1011z, operand_2 = 'b110zx;

    initial begin
        $display("~%b = %b", operand_1, ~operand_1);
        $display("~%b = %b\n", operand_2, ~operand_2);

        $display("%b  & %b = %b", operand_1, operand_2, operand_1 & operand_2);
        $display("%b  | %b = %b", operand_1, operand_2, operand_1 | operand_2);
        $display("%b  ^ %b = %b", operand_1, operand_2, operand_1 ^ operand_2);
        $display("%b ~^ %b = %b", operand_1, operand_2, operand_1 ~^ operand_2);
        $display("%b ^~ %b = %b", operand_1, operand_2, operand_1 ^~ operand_2);
    end

endmodule