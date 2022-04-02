/*
Created by  : Vaisakh Dileep
Date        : 2, April, 2022
Description : This program helps to understand $stop and $finish in verilog.
*/

module understand_$stop_$finish_system_tasks();

    initial begin

    // $stop: It puts the simulation in an interactive mode. The designer can then debug the design from the interactive mode. Mainly used in debugging.

    // $finish: It terminates the simulation.

        $stop; // The program will pause here, we can use "cont" command to resume the program. 

        #10 $write("MURKOFF ");

        $finish; // Our program terminates here.

        #10 $write("Corporation"); // This will never be printed.
    end

endmodule