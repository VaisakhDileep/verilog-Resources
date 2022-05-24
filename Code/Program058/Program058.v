/*
Created by  : Vaisakh Dileep
Date        : 13, May, 2022
Description : This program helps to understand functions in verilog.
*/

module understand_functions();

/*
The properties of functions are:
1. A function can enable other function but not another task.
2. Functions always execute at '0' simulation time.
3. Functions must not contain any delay, event or timing control statements.
4. Functions must have at least one input argument.
5. Functions always return a single value. They cannot have output or inout arguments.
6. Functions cannot have wires.
7. Functions contain behavioral statements only.
*/

// Note: Functions must be defined in a module and are local to the module.
// Note: Functions are used when common verilog code is purely combinational, executes in zero simulation time and provides exactly one output.
// Note: Functions do not contain always or initial statements but can be called from always or initial blocks or even from other tasks and functions.

endmodule