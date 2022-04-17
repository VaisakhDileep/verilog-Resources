/*
Created by  : Vaisakh Dileep
Date        : 12, April, 2022
Description : This program helps to understand operators in verilog.
*/

module understand_operators();

// Operators act on operands to produce desired results.

/*
The different types of operators are:
1. Arithmetic operator
2. Logical operator
3. Relational operator
4. Equality operator
5. Bitwise operator
6. Reduction operator
7. Shift operator
8. Concatenation operator
9. Conditional operator
*/

// In order to understand the different operators refer: "different_types_of_operators.png".

// In order to understand the precedence of the different operators refer: "operator_precedence.png".

    reg operand_1, operand_2;

    wire result;

    assign result = A + B; // Here '+' is the operator.

endmodule