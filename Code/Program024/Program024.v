/*
Created by  : Vaisakh Dileep
Date        : 10, April, 2022
Description : This program helps to understand delays in continuous assignment in verilog.
*/

module understand_delays_continuous_assignment();

// Delay values control the time between the changes in the RHS operand and when the new value is assigned to the LHS.

/*
There are three ways of specifying delays in continuos assignment statements:
1. Regular assignment delay
2. Implicit continuous assignment delay
3. Net declaration delay
*/

// General form of regular assignment delay: assign #10 wire_1 = input_1 & input_2;

    reg[0:1] _2_bit_memory_1, _2_bit_memory_2;

    wire[0:1] result_1;

    assign #10 result_1 = _2_bit_memory_1 & _2_bit_memory_2;

// General form of implicit continuous assignment delay: wire #10 wire_1 = input_1 & input_2;

    reg[0:1] _2_bit_memory_3, _2_bit_memory_4;

    wire[0:1] #10 result_2 = _2_bit_memory_3 | _2_bit_memory_4;

// General form of net declaration delay: wire #10 wire_1; assign wire_1 = input_1 & input_2;

    reg[0:1] _2_bit_memory_5, _2_bit_memory_6;

    wire[0:1] /*#10*/ result_3; // For some reason it does not work in icarus verilog simulator.

    assign result_3 = _2_bit_memory_5 ^ _2_bit_memory_6;

    initial begin
// Demonstrating regular assignment delay:
        _2_bit_memory_1 = 'b10;
        _2_bit_memory_2 = 'b11;

        #0.001 $display("%b & %b: %b [time: %-2d]", _2_bit_memory_1, _2_bit_memory_2, result_1, $time); // We don't get the result immediately since there is a '10' time units delay.

        #10 $display("%b & %b: %b [time: %-2d]\n", _2_bit_memory_1, _2_bit_memory_2, result_1, $time); // This is at time "10.001", that's why we don't need a small delay.

        _2_bit_memory_1 = 'b11;

        #2 $display("%b & %b: %b [time: %-2d]\n", _2_bit_memory_1, _2_bit_memory_2, result_1, $time); // Notice how the values are not changed. An input pulse that is shorter than the delay of the assignment statement does not propagate to the output, this is called inertial delay.

        _2_bit_memory_1 = 'b00;

        #8 $display("%b & %b: %b [time: %-2d]", _2_bit_memory_1, _2_bit_memory_2, result_1, $time); // Notice here the values are not changed.

        #2 $display("%b & %b: %b [time: %-2d]\n\n", _2_bit_memory_1, _2_bit_memory_2, result_1, $time); // Notice here the values are changed(It will take another '10' time units to update "result_1" even if there is inertial delay).

        #8; // So as to make time multiples of '10'.

// Demonstrating implicit continuous assignment delay:
        _2_bit_memory_3 = 'b10;
        _2_bit_memory_4 = 'b01;

        #0.001 $display("%b | %b: %b [time: %-2d]", _2_bit_memory_3, _2_bit_memory_4, result_2, $time); // We don't get the result immediately since there is a '10' time units delay.

        #10 $display("%b | %b: %b [time: %-2d]", _2_bit_memory_3, _2_bit_memory_4, result_2, $time); // This is at time "10.001", that's why we don't need a small delay.

        // Note: Instead of line '57' and '59', if we used "#10.001" it won't give the correct output.

// Demonstrating net declaration delay:
        _2_bit_memory_5 = 'b10;
        _2_bit_memory_6 = 'b00;

        #10 $display("%b ^ %b: %b [time: %-2d]", _2_bit_memory_5, _2_bit_memory_6, result_3, $time);
    end

endmodule