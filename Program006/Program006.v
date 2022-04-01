/*
Created by  : Vaisakh Dileep
Date        : 30, March, 2022
Description : This program helps to understand registers in verilog.
*/

module understand_registers();

// Registers represent data storage elements. Registers retain value until another value is placed on it. Unlike a net, registers do not need a driver. The default value of a register is 'x'.

// Note: Unlike in real-circuits, the term register merely means a variable that can hold a value. Verilog registers do not need a clock as hardware registers do.

    reg register;

    initial begin
        $display("register: %d", register); // By default registers have value 'x'.

        register = 1'b1;

        $display("register: %d", register);

        register = 1'b0;

        $display("register: %d", register);
    end

endmodule