/*
Created by  : Vaisakh Dileep
Date        : 2, June, 2022
Description : This program helps to understand how to override parameter values when the module is instantiated in verilog.
*/

module module_2();
    module_1 #(10, 20) m_1(); // parameters are initialized in "#()" in the same order they are defined in the module.

    module_1 #(100, 200) m_2();

    initial begin
        $display("m_1.parameter_1: %d", m_1.parameter_1);
        $display("m_1.parameter_2: %d\n", m_1.parameter_1);

        $display("m_2.parameter_1: %d", m_2.parameter_1);
        $display("m_2.parameter_2: %d", m_2.parameter_2);
    end
endmodule

module module_1();
    parameter parameter_1 = 1, parameter_2 = 2;

    initial begin
        $display("parameter_1: %d", parameter_1);
        $display("parameter_2: %d\n", parameter_2);
    end
endmodule

module override_parameter_in_module_instantiation();
// Parameter values can be overridden when the module is instantiated.

endmodule