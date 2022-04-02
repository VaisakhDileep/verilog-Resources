/*
Created by  : Vaisakh Dileep
Date        : 2, April, 2022
Description : This program helps to understand $monitor() and $display() in verilog.
*/

module understand_$monitor_$display_system_tasks();

// Verilog provides standard system tasks to do certain routine operations. All system tasks appear in the form $<keyword>.

    reg[1:8*15] string_1;

    integer dummy;

    initial begin

        string_1 = "Vaisakh Dileep";

    // $display: The format of $display() is very similar to printf() in C. $display() inserts a newline at the end of the string by default.

        $write("string_1: ");
        $display(string_1);

        $display("string_1: %d", string_1); // Notice here that without formatting, the value will displayed in decimal.

        $display("string_1: %s\n", string_1);
    // In order to understand the different format specifiers supported in $display refer: "format_specifiers_$_display".

    // $monitor: Verilog provides a mechanism to monitor a signal when its value changes.
    // Syntax of monitor: $monitor(p1, p2, p3, ..., pm); // p1, p1, p3 can be variables, signal names or quoted strings.

    // Note: $monitor() continuously monitors the value of the variables or signals specified in the parameter list and displays all hte parameters in the list whenever the value of any one variable or signal changes.
    // Note: Unlike $display(), $monitor() only needs to be invoked once.
    // Note: Only one monitoring function can be active at a time. If there is more than one $monitor() function, the last $monitor() function will be the active function.
    // Note: $monitor() starts executing from simulation time '0'.

        $monitor($time, " string_1: %s", string_1);

        #10 string_1 = "Vaisakh"; // Notice here that "string_1" value is changed at clock '10'.

        #15 dummy = 10; // Notice here that even though the time value is '15', $monitor() doesn't notice it since we passed "$time" to $monitor() which is not a parameter.

        $monitoroff; // "$monitoroff" will disable monitoring during a simulation.

        #20 string_1 = "Verilog"; // Notice this change didn't get monitored, this is because we used "$monitoroff".

        $monitoron; // "monitoron" will enable monitoring.

        #25 string_1 = "2022"; // Notice here this change get's monitored, this is because we used "$monitoron".

        $finish;
    end

endmodule