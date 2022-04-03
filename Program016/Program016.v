/*
Created by  : Vaisakh Dileep
Date        : 3, April, 2022
Description : This program helps to understand how to connect ports to external signals.
*/

module internal_module(A, B, C, D);

    output A;

    output reg B;

    input C;

    input D;

endmodule

module external_module();

// Inputs in the inner-module are treated as outputs in the outer-module and outputs in the inner-module are treated as inputs in the outer-module.

// Note: Internally output ports can be "reg" or "net". Externally, outputs must always be connected to net.
// Note: Internally input ports must always be of the type "net". Externally, input ports can be connected to a "reg" or "net".
// Note: Internally inout ports must always be of the type "net". Externally, inout ports must always be connected to "net".

    wire a;

    reg c, d;

    internal_module i_m_0(a, , c, d); // When instantiating a module, we don't necessarily need to provide all the ports. Some ports might be for debugging process, so we can skip them.
                                      // When instantiating like this we need know the order properly(we have to preserve the order by adding empty ports).

    internal_module i_m_1(.D(d), .C(c), .A(a)); // We can specify the ports in any order, as long as we link it to ports in the internal module(This is a better approach since we don't have to learn the order).

    initial begin
        $display("i_m_0.A: %b", i_m_0.A); // Every identifier(module_name, variable, ..., etc) can be identified uniquely in the design hierarchy(like in C-programming).
        $display("i_m_0.B: %b", i_m_0.B);
        $display("i_m_0.C: %b", i_m_0.C);
        $display("i_m_0.D: %b\n", i_m_0.D);

        d = 1;
        c = 1;

        $display("i_m_0.A: %b", i_m_0.A);
        $display("i_m_0.B: %b", i_m_0.B);
        $display("i_m_0.C: %b", i_m_0.C);
        $display("i_m_0.D: %b\n", i_m_0.D); // Notice how the change in the value of 'd' and 'c' gets reflected in the inner module.

        $display("i_m_1.A: %b", i_m_1.A);
        $display("i_m_1.B: %b", i_m_1.B);
        $display("i_m_1.C: %b", i_m_1.C);
        $display("i_m_1.D: %b", i_m_1.D);
    end

endmodule