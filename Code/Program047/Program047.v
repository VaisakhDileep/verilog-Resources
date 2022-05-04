/*
Created by  : Vaisakh Dileep
Date        : 4, May, 2022
Description : This program helps to understand casex and casez statement in verilog.
*/

module understand_casex_and_casez_statement();

// casex: It treats all 'x' and 'z' values in the case alternatives or the case expression as "don't care".
// casez: It treats all 'z' values in the case alternatives or the case expression as "don't care".

    reg[0:1] reg_variable;

    initial begin
        #1 reg_variable = 2'b0x;
    
        #1 $display();
    
        #1 reg_variable = 2'b0z;
    end

    always @(reg_variable) begin
        casex(reg_variable)
            // 2'bxx: $display("This will catch anything.");
            // 2'bzz: $display("This will catch anything.");

            2'b00: $display("2'b00");
            2'b01: $display("2'b01");
            2'b10: $display("2'b10");
            2'b11: $display("2'b11");

            2'bx0: $display("2'bx0");
            2'bx1: $display("2'bx1");
            2'b0x: $display("2'b0x");
            2'b1x: $display("2'b1x");
            2'bxx: $display("2'bxx");

            2'bz0: $display("2'bz0");
            2'bz1: $display("2'bz1");
            2'b0z: $display("2'b0z");
            2'b1z: $display("2'b1z");
            2'bzz: $display("2'bzz");
        endcase
    end

    always @(reg_variable) begin
        casez(reg_variable)
            // 2'bzz: #0.1 $display("This will catch anything.");

            2'b00: #0.1 $display("2'b00");
            2'b01: #0.1 $display("2'b01");
            2'b10: #0.1 $display("2'b10");
            2'b11: #0.1 $display("2'b11");

            2'bx0: #0.1 $display("2'bx0");
            2'bx1: #0.1 $display("2'bx1");
            2'b0x: #0.1 $display("2'b0x");
            2'b1x: #0.1 $display("2'b1x");
            2'bxx: #0.1 $display("2'bxx");

            2'bz0: #0.1 $display("2'bz0");
            2'bz1: #0.1 $display("2'bz1");
            2'b0z: #0.1 $display("2'b0z");
            2'b1z: #0.1 $display("2'b1z");
            2'bzz: #0.1 $display("2'bzz");
        endcase
    end

endmodule