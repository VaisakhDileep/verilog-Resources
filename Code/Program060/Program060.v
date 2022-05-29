/*
Created by  : Vaisakh Dileep
Date        : 26, May, 2022
Description : This program helps to understand force and release in verilog.
*/

module demo_register_stimulus();
    demo_register d_r();

    initial begin
        force d_r.register_1 = 0; // We force "register_1" to have value '0'.

        #2 $display("d_r.register_1: %b\n", d_r.register_1); // Even though "register_2" changes to '1' at '1' time unit, "register_1" is not updated.

        release d_r.register_1;

        #1 $display("d_r.register_1: %b\n", d_r.register_1); // Even though we have released "register_2", it will still hold the forced value.

        #5 $display("d_r.register_1: %b\n", d_r.register_1); // The changes in the outer module is reflected at the end of the '7'th time step.
    end
endmodule

module demo_register();
    reg register_1 = 0, register_2 = 0;

    initial begin
        assign register_1 = register_2; // "register_1" is updated whenever "register_2" values is changed.

        #1 register_2 = 1;

        $display("register_1    : %b", register_1);

        #5 register_2 = 0;
        #1 register_2 = 1; // Here in order to change the forced value, we have to re-apply '1' to "register_2".

        $display("register_1    : %b", register_2); // The changes in the internal module is reflected at the beginning of the '7'th time step.
    end
endmodule

module demo_net_stimulus();
    demo_net d_n();

    initial begin
        #50; // So as to output at the end.

        force d_n.wire_1 = 0; // We force "wire_1" to have value '0'.

        #2 $display("d_n.wire_1: %b\n", d_n.wire_1);

        release d_n.wire_1;

        #4 $display("d_n.wire_1: %b", d_n.wire_1); // Notice here that releasing "wire_1", the forced value is released without changing "register_1".
    end
endmodule

module demo_net();
    wire wire_1;

    reg register_1 = 0;

    assign wire_1 = register_1;

    initial begin
        #50; // So as to output at the end.

        #1 register_1 = 1;
    end
endmodule

// Note: Using "force" on register variable will continue to store the forced value after being release. Using "force" on nets will immediately return to its normal driven value when it's released.

module understand_force_release_keywords();

// "force" and "release" are used to override assignment on both registers and nets. They can be used to override assignments on both registers and nets.

// Note: "force" and "release" are typically used in the interactive debugging process, where certain registers or nets are forced to a value and the effects of other registers and nets is noted.
// Note: It is advised not to use "force" and "release" inside the design blocks, but in stimulus or debug statements.
endmodule