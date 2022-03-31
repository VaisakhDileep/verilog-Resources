/*
Created by  : Vaisakh Dileep
Date        : 30, March, 2022
Description : This program helps to understand vectors in verilog.
*/

module understand_vectors();
// Nets or reg data-types can be declared as vectors(multiple bit widths). If width is not specified, the default is scalar(1-bit).

// vectors can be declared as [high#:low#] or [low#:high#] format, the left number in the squared brackets is always the most significant bit of the vector.

    wire wire_1; // wire data-type with width 1-bit(scalar value).

    wire[0:10] wire_2; // wire data-type with width of 11-bits(bus). Here MSB is wire_2[0] and LSB is wire_2[10].

    wire[10:0] wire_3; // wire data-type with width of 11-bits(bus). Here MSB is wire_3[10] and LSB is wire_1[0].

    reg[0:10] register_1; // register data-type with width of 11 bits. Here MSB is register_1[0] and LSB is register_1[10].

    reg[10:0] register_2; // register data-type with width of 11 bits. Here MSB is register_2[10] and LSB is register_2[0].

    initial begin
        $finish;
    end

endmodule