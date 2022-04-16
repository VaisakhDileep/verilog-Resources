/*
Created by  : Vaisakh Dileep
Date        : 15, April, 2022
Description : This program helps to understand reduction operators in verilog.
*/

module understand_reduction_operators();

// The different reduction operators available in verilog are: and('&'), nand('~&'), or('|'), nor('~|'), xnor('^'), xnor('~^' or '^~').

// Reduction operators take only one operand. Reduction operators perform a bitwise operation on a single vector operand and yield a 1-bit result.

// Note: Reductions operators work bit by bit from right to left.
// Note: reduction-nand, reduction-nor and reduction-xnor are computed by inverting the result of reduction-and, reduction-or and reduction-xor respectively.

    reg[0:4] operand_1 = 'b10010;

    wire[0:4] operand_2 = 'b0111;

    initial begin
        $display("&%b = %b", operand_1, &operand_1); // Result is computed as "0 & 1 & 0 & 0 & 1".
        $display("|%b = %b", operand_1, |operand_1);
        $display("^%b = %b\n", operand_1, ^operand_1);

        $display("~&%b = %b", operand_1, ~&operand_1);
        $display("~|%b = %b", operand_1, ~|operand_1);
        $display("~^%b = %b", operand_1, ~^operand_1);
        $display("^~%b = %b\n", operand_1, ^~operand_1);

        $display("&%b = %b", operand_2, &operand_2); // Any vector value can be computer using reduction operators.
        $display("|%b = %b", operand_2, |operand_2);
        $display("^%b = %b\n", operand_2, ^operand_2);

        $display("~&%b = %b", operand_2, ~&operand_2);
        $display("~|%b = %b", operand_2, ~|operand_2);
        $display("~^%b = %b", operand_2, ~^operand_2);
        $display("^~%b = %b", operand_2, ^~operand_2);
    end

endmodule