/*
Created by  : Vaisakh Dileep
Date        : 2, April, 2022
Description : This program helps to understand ports in verilog.
*/

module understand_ports(A, B, C, D, E, F, G);

// Ports provide the interface by which a module can communicate with its environment. The environment can only interact with the module only through it's ports.
// Note: Ports are also known as terminals.
// Note: All the ports should be declared within the module, otherwise it will produce a compiler error.

/*
The different ways to declared ports are:
1. input  -> input port
2. output -> output port
3. inout  -> bidirectional port

Note: Assignment is based on the direction of the port signal.
*/

// Note: It is a common convention to include all the output ports before the input ports.

// Note: All ports are declared as wire in verilog. If the port is intended to be a wire, it is sufficient to declare it as "output", "input" or "inout".
// Note: Ports of the "input" and "inout" cannot be declared as "reg" because "reg" variables store values and input ports should not store value but simply reflect the changes in the external signals they are connected to.

    output A;
    reg A;

    output reg B; // We can do in one step too.

    output C;

    input D;
    wire D; // Not necessary, but no harm in doing so.

    // input reg E; // This will given an error, since input ports cannot be "reg".

    input E; // Not necessary, but we can do in one step too.

    input F;

    input G;

endmodule