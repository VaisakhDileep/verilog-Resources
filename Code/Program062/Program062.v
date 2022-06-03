/*
Created by  : Vaisakh Dileep
Date        : 1, June, 2022
Description : This program helps to understand how to override parameter values using defparam statement in verilog.
*/

module module_2();

    defparam m_1.parameter_1 = 10; // We can even use "defparam" before initializing the module.

    module_1 m_1(); // Notice how the parameter values inside "module_1" has been changed.

    defparam m_1.parameter_2 = 20; // We can also use "defparam" after initializing the module.

    defparam m_2.parameter_1 = 100;
    defparam m_2.parameter_2 = 200;

    module_1 m_2(); // Notice how the parameter values inside "module_1" has been changed.

    initial begin
        $display("m_1.parameter_1: %d", m_1.parameter_1);
        $display("m_1.parameter_2: %d\n", m_1.parameter_2);

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

module understand_defparam();
// Parameter values can be changed in any module instance in the design with the keyword defparam.

endmodule