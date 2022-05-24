/*
Created by  : Vaisakh Dileep
Date        : 31, March, 2022
Description : This program helps to understand integer, real and time register data type in verilog.
*/

module understand_integer_real_time_register_data_type();

// An integer is a general purpose register data-type used for manipulating quantities. The default width of an integer is host-machine word size(at least 32 bit). "reg" stores value as unsigned quantities, whereas integers store values as signed quantities.

    integer counter; // counting is one of the application of "integer".

// Real numbers constants and real register data types are declared with the keyword real. They can be specified in decimal notation or in scientific notation. Their default value is '0'.

    real real_value_1 = 1.2;
    real real_value_2 = 1.8;
    real real_value_3 = 4e10;

    integer real_value_1_to_integer;
    integer real_value_2_to_integer;

// Verilog simulation is done with respect to simulation time. A special time register data type is used in verilog to store simulation time. A time variable is declared with the keyword time. The width of the time register data type is implementation specific(at least 64 bits).
// Note: Simulation time is measured in terms of simulation seconds.

    time current_time;

    initial begin
        counter = -1; // We can store negative values in integers.

        $display("real_value_1: %f", real_value_1);
        $display("real_value_2: %f", real_value_2);
        $display("real_value_3: %f\n", real_value_3);

        real_value_1_to_integer = real_value_1;
        real_value_2_to_integer = real_value_2;

        $display("real_value_1_to_integer: %d", real_value_1_to_integer);
        $display("real_value_2_to_integer: %d\n", real_value_2_to_integer);

        #10 current_time = $time; // "$time" is invoked to get the current simulation time.

        $display("current_time: %t", current_time);

        $finish;
    end
endmodule