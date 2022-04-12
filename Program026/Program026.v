/*
Created by  : Vaisakh Dileep
Date        : 11, April, 2022
Description : This program helps to understand operands in verilog.
*/

module understand_operands();

// Operand is any object that is capable of being manipulated.
// Operands can be of any data-types like constants, integers, real numbers, nets, registers, time, bit-select(one bit of a vector net or a vector register), par-select(selected bits of a vector net or vector register), memories or even function calls.

    reg operand_1, operand_2;

    wire result;

    assign result = A + B; // Here 'A' and 'B' are the operands.

endmodule