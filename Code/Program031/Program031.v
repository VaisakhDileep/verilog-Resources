/*
Created by  : Vaisakh Dileep
Date        : 14, April, 2022
Description : This program helps to understand equality operators in verilog.
*/

module understand_equality_operators();

// The different equality operators available in verilog are: logical-equality('=='), logical-inequality('!='), case-equality('==='), case-inequality('!==').

// These operators compare the two operands bit by bit, with zero filling if the operands are of unequal length.

/*
1. '==' operator -> possible logical value {0, 1, x}.
    result is unknown('x'), if 'x' or 'z' is present in one of the operands.

2. '!=' operator -> possible logical value {0, 1, x}.
    result is unknown('x'), if 'x' or 'z' is present in one of the operands.

3. '===' operator -> possible logical value {0, 1}.
    it will compare even 'x' and 'z'.

4. '!==' operator -> possible logical value {0, 1}.
    it will compare even 'x' and 'z'.
*/

    reg[0:2] operand_1 = 'b101, operand_2 = 'b101;

    reg[0:2] operand_3 = 'b1xz, operand_4 = 'b1xz;

    initial begin

        $display("%b == %b = %b", operand_1, operand_2, operand_1 == operand_2);
        $display("%b != %b = %b\n", operand_1, operand_2, operand_1 != operand_2);

        $display("%b === %b = %b", operand_1, operand_2, operand_1 === operand_2);
        $display("%b !== %b = %b\n", operand_1, operand_2, operand_1 !== operand_2);

        $display("%b == %b = %b", operand_3, operand_4, operand_3 == operand_4);
        $display("%b != %b = %b\n", operand_3, operand_4, operand_3 != operand_4);

        $display("%b === %b = %b", operand_3, operand_4, operand_3 === operand_4);
        $display("%b !== %b = %b", operand_3, operand_4, operand_3 !== operand_4);
    end

endmodule