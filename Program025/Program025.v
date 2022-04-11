/*
Created by  : Vaisakh Dileep
Date        : 11, April, 2022
Description : This program helps to understand expressions in verilog.
*/

module understand_expressions();

// Dataflow modeling describes the design in terms of expressions instead of primitive gates. Expressions, operators and operands form the basis of dataflow modeling.

// Expressions are constructs that combine operators and operands to produce a result.

    reg operand_1, operand_2;

    wire result;

    assign result = A + B; // Here "A + B" is the expression.

endmodule