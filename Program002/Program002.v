/*
Created by  : Vaisakh Dileep
Date        : 29, March, 2022
Description : This program helps to understand how to represent numbers in verilog.
*/

module represent_numbers();
/*
There are two ways to represent numbers in verilog:
1. Sized numbers
2. Un-sized numbers
*/

    integer number;

    initial begin
/*
Syntax for sized numbers:
    <size>'<base format> <number>
        <size> can only be defined in decimal. It describes the number of bits in the number.
        <base format> can be decimal('d' or 'D'), hexadecimal('h', 'H'), binary('b', 'B'), octal('o', 'O').
        <number> can be consecutive digits from 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, a(A), b(B), c(C), d(D), e(E), f(F).
*/

        number = 2'b11; // This is a 6-bit binary number.

        $display("number(decimal): %-d", number); // display in decimal format. '-' will left-align the output.
        $display("number(binary) : %b\n", number); // display in binary format.

        number = 6'o77; // This is a 6-bit octal number.

        $display("number(decimal): %-d", number);
        $display("number(octal)  : %o\n", number); // display in octal format.

        number = 8'hFF; // This is a 8-bit hexadecimal number.

        $display("number(decimal)    : %-d", number);
        $display("number(hexadecimal): %h\n", number); // display in hexadecimal format.

        number = 8'd255; // This is a 8-bit decimal number.

        $display("number(decimal): %-d\n", number);

/*
Syntax for unsized numbers:
    '<base format> <number>

Note: Numbers without "<size>" specification have a default number of bits that is simulator(machine) specific(usually 32 bits).
*/

        number = 2000; // defaultly it is treated as decimal.

        $display("number(decimal): %-d\n", number);

        number = 'b101;

        $display("number(binary): %b\n", number);

        number = 'o200;

        $display("number(octal): %o\n", number);

        number = 'ha0bdf;

        $display("number(hexadecimal): %h\n", number);

        number = -32'd2022; // Inorder to represent negative numbers we have to place '-' before "<size>" and not anywhere else.
        // number = 32'-d2022; // This will give an error.
        // number = 32'd-2022; // This will given an error.

        $display("number(decimal): %-d\n", number);

        number = 32-'d2022; // This will subtract '2022' from '32', which is not our desired output.

        $display("number(decimal): %-d\n", number);

        number = 32'd10_000; // We can add '_' anywhere in the number except the first character for better readability.

        $display("number(decimal): %-d", number);

        $finish;
    end
endmodule