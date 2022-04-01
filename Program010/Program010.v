/*
Created by  : Vaisakh Dileep
Date        : 1, April, 2022
Description : This program helps to understand how to model memories in verilog.
*/

module represent_memories();

// Memories are modeled in verilog simply as an array of registers. Each element of the array is known as word.

    reg memory_1_bit[0:1023]; // This models 1K 1-bit words.

    reg[7:0] memory_1_byte[0:1023]; // This models 1K 8-bit words.

    initial begin
        $display("memory_1_byte[100]: %-d", memory_1_byte[100]); // Fetches 1 byte word whose address is at 100.
    end

endmodule