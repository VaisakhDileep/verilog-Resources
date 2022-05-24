/*
Created by  : Vaisakh Dileep
Date        : 9, May, 2022
Description : This program helps to understand tasks in verilog.
*/

module understand_tasks();

// Tasks are declared with the keyword "task" and "endtask".

/*
The properties of tasks are:
1. A task can enable other tasks and functions.
2. Tasks can contain delay, event or timing control statements.
3. Tasks can have zero or more arguments of type input, output or inout.
4. Tasks do not return with a value but can pass multiple values through output and inout arguments.
5. Tasks cannot have wires.
6. Tasks contain behavioral statements only.
7. Tasks can invoke other tasks or functions.
*/

// Note: Tasks must be defined in a module and are local to the module.
// Note: Tasks are used when common verilog code contains delays, timing, event constructs or multiple output arguments.
// Note: Tasks do not contain always or initial statements but can be called from always or initial blocks or even from other tasks and functions.

// Note: Unlike in modules "input", "output", "inout" are used to pass values to and from the task.

// Input and inout arguments are passed into the task. Input arguments are processed in the task statements.
// Output and inout arguments values are passed back to the variables in the task invocation statement when the task is completed.

/*
Tasks are generally used when:
1. There are delay, timing or even control constructs in the procedure.
2. The procedure has zero or more than one output arguments.
3. The procedure has no input arguments.
*/

    integer delay = 5;

    reg[15:1] A, B;
    reg[15:1] A_and_B, A_or_B, A_xor_B;

    initial begin
        A = 'b011010100101011;
        B = 'b100111001101010;

        $display("time(before invoking compute_bitwise_and_or_xor_1): %-d", $time);

        // Here we are invoking the task.
        compute_bitwise_and_or_xor_1(A_and_B, A_or_B, A_xor_B, A, B); // The order of the elements should be same as they are declared in the task.

        $display("time(after invoking compute_bitwise_and_or_xor_1) : %-d\n", $time);

        $display("%b", A);
        $display("%b", B);
        $display("---------------(or)");
        $display("%b\n", A_or_B);

        $display("%b", A);
        $display("%b", B);
        $display("---------------(and)");
        $display("%b\n", A_and_B);

        $display("%b", A);
        $display("%b", B);
        $display("---------------(xor)");
        $display("%b\n", A_xor_B);

        A_and_B = 0;
        A_or_B = 0;
        A_xor_B = 0; // resetting result values.

        $display("time(before invoking compute_bitwise_and_or_xor_2): %-d", $time);
        $display("counter(before invoking compute_bitwise_and_or_xor_2): %-d\n", counter);

        compute_bitwise_and_or_xor_2; // We don't have to put parenthesis if there are no input, output, inout arguments to be passed.

        $display("time(after invoking compute_bitwise_and_or_xor_2): %-d", $time);
        $display("counter(after invoking compute_bitwise_and_or_xor_2): %-d\n", counter);

        $display("%b", A);
        $display("%b", B);
        $display("---------------(or)");
        $display("%b\n", A_or_B);

        $display("%b", A);
        $display("%b", B);
        $display("---------------(and)");
        $display("%b\n", A_and_B);

        $display("%b", A);
        $display("%b", B);
        $display("---------------(xor)");
        $display("%b", A_xor_B);
    end

    task compute_bitwise_and_or_xor_1;
    /*
    We have to include all declarations at the beginning, the declarations could be:
    1. parameter declaration
    2. input declaration
    3. output declaration
    4. inout declaration
    5. reg declaration
    6. time declaration
    7. integer declaration
    8. real declaration
    9. event declaration
    */
        output[15:1] and_result, or_result, xor_result;

        input[15:1] input_1, input_2;

        begin
            #delay and_result = input_1 & input_2; // We can have delays in task.
            #delay or_result = input_1 | input_2;
            #delay xor_result = input_1 ^ input_2;
        end
    endtask

    task compute_bitwise_and_or_xor_2;
        begin
            #delay A_and_B = A & B; // We can even use and change identifiers from anywhere in the module(even after the task is declared).
            #delay A_or_B = A | B;
            #delay A_xor_B = A ^ B;

            counter = counter + 1;
        end
    endtask

    integer counter = 0;

endmodule