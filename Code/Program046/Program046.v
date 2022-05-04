/*
Created by  : Vaisakh Dileep
Date        : 3, May, 2022
Description : This program helps to understand multiway branching(case statement) in verilog.
*/

module understand_multiway_branching();

/*
Syntax for multiway branching(case statement):
case(<expression>)
    alternative_1: statement_1; // "statement_1" can be a single statement or a block of statements(in which case we have to group using "begin" and "end").
    alternative_2: statement_2;
                .
                .
                .
    alternative_n: statement_n;

    default: default_statement; // Only one default block is permitted.
endcase
*/

    reg[0:1] reg_variable;

    initial begin
        #1 reg_variable = 2'b01;
        #1 reg_variable = 2'b10;
        #1 reg_variable = 2'b0x;
        #1 reg_variable = 2'b1z; // Note: The case statement compares '1', '0', 'x', 'z' values in the expression bit by bit.
    end

    always @(reg_variable) begin
        case(reg_variable)
            2'b00: $display("2'b00");
            2'b01: $display("2'b01");
            2'b10: $display("2'b10");
            2'b11: $display("2'b11");

            2'bx0: $display("2'bx0");
            2'bx1: $display("2'bx1");
            2'b0x: $display("2'b0x");
            2'b1x: $display("2'b1x");
            2'bxx: $display("2'bxx");

            default: $display("Invalid input, one of the bits is 'z'.");
        endcase
    end

endmodule