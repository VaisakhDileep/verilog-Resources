/*
Created by  : Vaisakh Dileep
Date        : 3, April, 2022
Description : This program helps to understand how to display hierarchial names in verilog.
*/

// Hierarchial name referencing allows us to denote every identifier in the design hierarchy with a unique name.
// Hierarchial name is a list of identifiers separated by dots('.') for unique names.

module root_level();

    level_1 l_1();

    initial begin
        $display("Hierarchial level[root_level]        : %m"); // "%m"(we can also use "%M") is used to display the level of hierarchy.
    end

endmodule

module level_1();

    level_2 l_2();

    initial begin
        $display("Hierarchial level[level_1]           : %m");
    end

endmodule

module level_2();

    level_3 l_3();

    initial begin
        $display("Hierarchial level[level_2]           : %m");
    end

endmodule

module level_3();

    initial begin
        $display("Hierarchial level[level_3]           : %m");
    end

endmodule

module disconnected_level();

    level_3 l_3();

    initial begin
        $display("Hierarchial level[disconnected_level]: %m");
    end

endmodule

// Notice here that "level_3" has two hierarchial levels.