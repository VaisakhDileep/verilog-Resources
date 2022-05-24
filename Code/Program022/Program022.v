/*
Created by  : Vaisakh Dileep
Date        : 10, April, 2022
Description : This program helps to understand continuous assignment in verilog.
*/

// Dataflow modeling: It makes use of the function that define the working of the circuit instead of its gate structure. It focuses on optimizing the circuit in terms of the flow of data. It is mainly used to describe combinational circuits.

module understand_continuous_assignment();

// continuous assignment is the most basic statement in dataflow modeling, used to drive a value onto a net.

/*
Syntax for continuous assignment:
    assign <drive_strength> <delay> <list_of_arguments> = RHS_expression;
Here,
    <drive_strength> and <delay> are optional. <drive_strength> by default is "strong1" or "strong0".
*/

/*
Properties of continuous assignment:
1. The left hand side of the assignment must always be a scalar or vector net or a concatenation of scalar and vector nets. It cannot be a scalar or vector register.
2. Continuous assignments are always active. The assignment expression is evaluated as soon as one of the right hand side operands changes and the value is assigned to the left hand side net.
3. The operands on the right hand side can be registers, nets or function calls. Registers or nets can be scalar or vectors.
4. Delay values can be specified for assignments in terms of time units. Delay values are used to control the time when a net is assigned the evaluated value.
*/

    reg[0:15] _16_bit_memory_1, _16_bit_memory_2;

    wire[0:15] result_1;

    assign result_1[0:15] = _16_bit_memory_1[0:15] ^ _16_bit_memory_2[0:15];

    reg _1_bit_memory_1, _1_bit_memory_2;

    wire result_2;

    assign result_2 = _1_bit_memory_1 ^ _1_bit_memory_2;

    reg[0:2] sum_operand_1, sum_operand_2;

    wire[0:2] sum;

    wire carry;

    assign {carry, sum[0:2]} = sum_operand_1[0:2] + sum_operand_2[0:2]; // "{}" is the concatenation operator in verilog. It only makes sense to put carry before the MSB(MSB is always the left parameter in the square brackets).

    initial begin
        _16_bit_memory_1 = 'b1010001110001100;
        _16_bit_memory_2 = 'b0110001110010000;

        #0.001 $display("%b ^ %b: %b", _16_bit_memory_1, _16_bit_memory_2, result_1); // We need a small delay.

        _16_bit_memory_1 = 'b0110001110010011;

        #0.001 $display("%b ^ %b: %b\n", _16_bit_memory_1, _16_bit_memory_2, result_1); // "result_1" will be updated if one of the operands in the RHS changes.

        _1_bit_memory_1 = 1;
        _1_bit_memory_2 = 0;

        #0.001 $display("%b ^ %b: %b", _1_bit_memory_1, _1_bit_memory_2, result_2);

        _1_bit_memory_1 = 0;

        #0.001 $display("%b ^ %b: %b\n", _1_bit_memory_1, _1_bit_memory_2, result_2);

        sum_operand_1 = 'b111;
        sum_operand_2 = 'b1;

        #0.001 $display("%b + %b = %b {carry = %b}", sum_operand_1, sum_operand_2, sum, carry);
    end

endmodule