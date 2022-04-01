/*
Created by  : Vaisakh Dileep
Date        : 1, April, 2022
Description : This program helps to understand how to declare strings in verilog.
*/

module represent_strings();

// Strings can be stored in reg. The width of the register must be large enough to hold the string. Each character in the string take up 8-bits(1-byte).

// Note: If the width of the register is greater than the size of the string, verilog fills bits to the left of the string with zeroes.
// Note: If the width of the register is smaller than string width, verilog truncates the leftmost bits of the string.
// Note: It is always safe to declare a string that is slightly wider than necessary.

    reg[8*15:1] string_1;
    reg[8*20:1] string_2;

    reg[1:8*15] string_3;
    reg[1:8*20] string_4;

    initial begin
        string_1 = "Vaisakh Dileep";
        string_2 = "Vaisakh Dileep";
        string_3 = "Vaisakh Dileep";
        string_4 = "Vaisakh Dileep";

        $display("string_1: %s", string_1);
        $display("string_2: %s", string_2); // Notice here that the left most part of the string is filled with the null character.
        $display("string_3: %s", string_3);
        $display("string_4: %s\n", string_4);
    // Notice here that "string_1" and "string_3" as well as "string_2" and "string_4" are same.

        string_1 = "";
        string_3 = "";

        string_1[8*1:1] = "~";
        string_3[1:8*1] = "~";

        $display("string_1: %s", string_1);
        $display("string_3: %s\n", string_3); // Notice here the outputs are different.

        string_1 = "Vaisakh Dileep Rocket League 2022";
        string_3 = "Vaisakh Dileep Rocket League 2022";

        $display("string_1: %s", string_1);
        $display("String_2: %s", string_3); // Notice here the string is truncated from the left.
    end
endmodule