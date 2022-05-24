/*
Created by  : Vaisakh Dileep
Date        : 13, May, 2022
Description : This program helps to understand functions in verilog.
*/

module understand_functions();

// Functions are declared with the keyword "function" and "endfunction".

/*
The properties of functions are:
1. A function can enable other function but not another task.
2. Functions always execute in '0' simulation time.
3. Functions must not contain any delay, event or timing control statements.
4. Functions must have at least one input argument.
5. Functions always return a single value. They cannot have output or inout arguments.
6. Functions cannot have wires.
7. Functions contain behavioral statements only.
*/

// Note: Functions must be defined in a module and are local to the module.
// Note: Functions are used when common verilog code is purely combinational, executes in zero simulation time and provides exactly one output.
// Note: Functions do not contain always or initial statements but can be called from always or initial blocks or even from other tasks and functions.

// When a function is declared, a register with the name of the function is declared implicitly inside Verilog. The output of the function is passed back by setting the value of the this register. There are no output arguments for functions because the implicit register contains the output value.
// We can include an optional range or type specifier to determine the width of this internal register, if no range or type is specified, the default bit width is '1'.

/*
Functions are generally used when:
1. There are no delay, timing, or even control constructs in the procedure.
2. The procedure returns a single value.
3. There is at least one input argument.
*/

    reg[15:1] A, B;
    reg[15:1] A_or_B;

    initial begin
        A = 'b011010100101011;
        B = 'b100111001101010;

        A_or_B = or_calculator(A, B); // The order of the elements should be same as they are declared in the function.

        $display("%b", A);
        $display("%b", B);
        $display("---------------(or)");
        $display("%b", A_or_B);
    end

    function[15:1] or_calculator; // Here the output should be of size '15' bits, so we have to manually set the range of the internal register.
        input[15:1] input_1, input_2;

        begin
            or_calculator = input_1 | input_2;
        end
    endfunction

endmodule