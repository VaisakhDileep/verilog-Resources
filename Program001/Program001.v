/*
Created by  : Vaisakh Dileep
Date        : 28, March, 2022
Description : This program prints "Hello, World!" and helps to understand the general structure of a verilog program.
*/

// Module: A module is a basic building block in verilog. A module can be an element or a collection of lower-level design blocks.

/*
Syntax:
module <module_name> (<module_terminal_list>)
            .
            .
<module implementation>
            .
            .
end module

Note: <module_terminal_list> describes the input and output terminals of the module.
Note: We cannot nest modules. One module definition cannot contain another module definition within the "module" and "endmodule" statement. Module definition can incorporate copies of other modules by instantiating them.
*/

// Note: Multi-level comments cannot be nested.

module hello_world();
    initial begin
        $display("Hello, World!");
        $finish;
    end
endmodule