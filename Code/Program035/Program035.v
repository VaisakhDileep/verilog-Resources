/*
Created by  : Vaisakh Dileep
Date        : 16, April, 2022
Description : This program helps to understand concatenation operator in verilog.
*/

module understand_concatenation_operator();

// The concatenation operator in verilog is: '{}'.

// Concatenations are expressed as operands withing braces, with commas separating the operands. Operands can be scalar nets or registers, vector nets or registers, bit-select, part-select or sized constants.

// Note: Un-sized operands are not allowed because the size of each operand must be known for computational of the size of the result.

    reg operand_reg_1 = 1;

    reg[0:4] operand_reg_vec_1 = 'b11000;

    wire operand_wire_1 = 0;

    wire[0:4] operand_wire_vec_1 = 'b00011;

    reg[0:5] concatenation_result_1;
    reg[0:9] concatenation_result_2;
    reg[0:6] concatenation_result_3;
    reg[0:7] concatenation_result_4;

    initial begin

        concatenation_result_1 = {operand_reg_1, operand_reg_vec_1};

        $display("{%b, %b} = %b", operand_reg_1, operand_reg_vec_1, concatenation_result_1);

        concatenation_result_1 = {operand_reg_vec_1, operand_reg_1};

        $display("{%b, %b} = %b\n", operand_reg_vec_1, operand_reg_1, concatenation_result_1);

        concatenation_result_1 = {operand_wire_vec_1, operand_wire_1}; // We can concatenate two wires to a register vector.

        $display("{%b, %b} = %b\n", operand_wire_vec_1, operand_wire_1, concatenation_result_1);

        concatenation_result_2 = {operand_wire_vec_1, operand_reg_vec_1};

        $display("{%b, %b} = %b\n", operand_wire_vec_1, operand_reg_vec_1, concatenation_result_2);

        // concatenation_result_3 = {2, operand_reg_vec_1}; // This will give an error since '2' is an un-sized constant.
        // concatenation_result_3 = {'b10, operand_reg_vec_1}; // This will give an error since "'b10" is an un-sized constant.
        concatenation_result_3 = {2'b10, operand_reg_vec_1};

        $display("{%b , %b} = %b\n", 2'b10, operand_reg_vec_1, concatenation_result_3);

        concatenation_result_4 = {operand_reg_vec_1, operand_wire_vec_1[2:4]};

        $display("{%b, %b} = %b\n", operand_reg_vec_1, operand_wire_vec_1[2:4], concatenation_result_4);

        concatenation_result_2 = {operand_reg_vec_1, operand_wire_vec_1[2:4], 2'b11}; // We can concatenate more than two operands at a time.

        $display("{%b, %b, %b} = %b", operand_reg_vec_1, operand_wire_vec_1[2:4], 2'b11, concatenation_result_2);
    end

endmodule