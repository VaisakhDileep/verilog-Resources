/*
Created by  : Vaisakh Dileep
Date        : 2, April, 2022
Description : This program helps to understand 'define in verilog.
*/

module understand_define();

// Verilog provides compiler derivatives that are instructions to the verilog compiler.

// 'define: It is used to define text macros in verilog. It is similar to #define in C.
// Note: The defined constants or text macros are used in verilog code by preceding them with '`'.

    `define WORD_SIZE 32 // compiler derivatives do not terminate with ';'.

    `define S $stop; // We haven't terminated the compiler derivative with ';', but we have chosen the text to be substituted as "$stop;".

    `define WORD_REG reg[31:0]

    `WORD_REG word;

    initial begin
        $display("WORD_SIZE: ", `WORD_SIZE, "\n");

        `S // Notice here how we didn't use ';' at the end.

        word[0] = 1;

        $display();
        $display("WORD_REG: %b", word);
    end

endmodule