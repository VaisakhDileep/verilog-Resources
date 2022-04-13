/*
Created by  : Vaisakh Dileep
Date        : 30, March, 2022
Description : This program helps to understand registers in verilog.
*/

module understand_registers();

// Registers represent data storage elements. Registers retain value until another value is placed on it. Unlike a net, registers do not need a driver. The default value of a register is 'x'.

// Note: Unlike in real-circuits, the term register merely means a variable that can hold a value. Verilog registers do not need a clock as hardware registers do.

    reg register_1;

    // reg register_2 = x; // Even though registers are by default assigned to 'x', we cannot manually initialize to 'x'.

    // reg register_3 = z; // We cannot initialize register to 'z'.

    initial begin
        $display("register_1: %d", register_1); // By default registers have value 'x'.

        register_1 = 1'b1;

        // register_1 = x; // We cannot assign 'x' to a register variable.

        // register_1 = z; // We cannot assign 'z' to a register variable.

        $display("register_1: %d", register_1);

        register_1 = 1'b0;

        $display("register: %d", register_1);
    end

endmodule