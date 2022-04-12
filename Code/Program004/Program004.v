/*
Created by  : Vaisakh Dileep
Date        : 30, March, 2022
Description : This program helps to understand value set in verilog.
*/

module understand_value_set();

/*
Verilog supports 4 values:
1. 0 -> Logic zero(false condition)
2. 1 -> Logic one(true condition)
3. x -> Unknown value
4. z -> high impedence value(floating state)
*/

    integer uninitialized_integer_variable; // uninitialized variables are usually initialized with 'x'.

    integer int_variable_1 = 32'dx;

    integer int_variable_2 = 3'b10x; // This is a 3-bit number with the least-significant bit unknown.

    integer int_variable_3 = 12'hFAx; // This is a 12-bit number with the 4 least-significant bits unknown.

    integer int_variable_4 = 2'bz;

// Note: 'x' or 'z' sets 4 bits for a hexadecimal number, 3 bits for an octal number, 1 bit for a binary number.

    initial begin

    $display("uninitialized_integer_variable: %-d\n", uninitialized_integer_variable);

    $display("int_variable_1: %d", int_variable_1);
    $display("int_variable_2: %d", int_variable_2);
    $display("int_variable_3: %d", int_variable_3);
    $display("int_variable_4: %d\n", int_variable_4);

    $display("int_variable_1: %b", int_variable_1);
    $display("int_variable_2: %b", int_variable_2);
    $display("int_variable_3: %b", int_variable_3);
    $display("int_variable_4: %b", int_variable_4); // Notice here how some bits are set while other are either 'x' or 'z'.

    $finish;

    end

endmodule