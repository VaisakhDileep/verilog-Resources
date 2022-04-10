/*
Created by  : Vaisakh Dileep
Date        : 10, April, 2022
Description : This program helps to understand implicit continuous assignment in verilog.
*/

module understand_implicit_continuous_assignment();

/*
Regular continuous assignment:
wire wire_1;
assign wire = input_1 & input_2;

Implicit continuous assignment:
wire wire_1 = input_1 & input_2;

Note: There can only be one implicit continuous assignment per net because net can only be declared once.
*/

    reg[0:15] _16_bit_memory_1, _16_bit_memory_2;

    wire[0:15] result_1 = _16_bit_memory_1[0:15] ^ _16_bit_memory_2[0:15];

    initial begin
        _16_bit_memory_1 = 'b1010001110001100;
        _16_bit_memory_2 = 'b0110001110010000;

        #0.001 $display("%b ^ %b: %b", _16_bit_memory_1, _16_bit_memory_2, result_1); // We need a small delay.
    end

endmodule