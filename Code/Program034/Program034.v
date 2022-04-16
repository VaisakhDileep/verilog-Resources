/*
Created by  : Vaisakh Dileep
Date        : 16, April, 2022
Description : This program helps to understand shift operators in verilog.
*/

module understand_shift_operators();

// The different shift operators available are: right-shift('>>'), left-shift('<<).

// Shift operators shift a vector operand to the left or to the right by a specified number of bits.

// Note: When the bits are shifted, the vacant bit positions are filled with zeroes.
// Note: Shift operations do not wrap around.

    reg[0:4] operand_1 = 'b10001;

    wire[0:4] operand_2 = 'b01010;

    initial begin
        $display("%b >> %1d = %b", operand_1, 3, operand_1 >> 3); // Notice that we lost the last '1'.
        $display("%b << %1d = %b\n", operand_1, 3, operand_1 << 3);

        $display("%b >> %1d = %b", operand_2, 1, operand_2 >> 1);
        $display("%b << %1d = %b", operand_2, 1, operand_2 << 1);
    end

endmodule