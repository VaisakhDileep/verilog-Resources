/*
Created by  : Vaisakh Dileep
Date        : 16, April, 2022
Description : This program helps to understand replication operator in verilog.
*/

module understand_replication_operator();

// Repetitive concatenation of the same number can be expressed by using the replication constant. The replication constant specifies how many times to replicate the number inside the braces('{}').

    reg[0:2] operand_reg_1 = 3'b101;

    reg[0:4] replication_result_1;
    reg[0:5] replication_result_2;
    reg[0:7] replication_result_3;

    initial begin
        replication_result_1 = {5{1'b1}}; // This will repeat "1'b1" '5' times.

        $display("{5{1'b1}} = %b\n", replication_result_1);

        replication_result_2 = {2{operand_reg_1}}; // This will repeat "operand_reg_1" '2' times.

        $display("{2{%b}} = %b", operand_reg_1, replication_result_2);

        replication_result_3 = {2'b11, {2{operand_reg_1}}}; // When using multiple operands, enclose the replication operator by braces('{}').

        $display("{%b, 2{%b}} = %b", 2'b11, operand_reg_1, replication_result_3);
    end

endmodule