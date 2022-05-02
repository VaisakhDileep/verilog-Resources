/*
Created by  : Vaisakh Dileep
Date        : 1, May, 2022
Description : This program helps to understand event-based timing control in verilog.
*/

module understand_event_based_timing_control();

// An event is the change in the value of a register or a net. Events can be utilized to trigger execution of a statement or a block of statements.

/*
There are four types of event-based timing control:
1. regular event control
2. named event control
3. event OR control
4. level-sensitive timing control
*/

// Regular event control: Here the statements are executed on changes in signal value or at a positive or negative transition of the signal value. The '@' symbol is used to specify an event control.
// Note: "posedge" keyword is used for positive transition.
// Note: "negedge" keyword is used for negative transition.

    reg signal;

    always @(signal) begin // This block will be executed every time "signal" value changes.
        $display("\"signal\" - value changed.");
    end

    always @(posedge signal) begin // This block will be executed every time "signal" undergoes a positive transition('0' to '1' or 'x' or 'z', 'x' to '1', 'z' to '1').
        $display("\"signal\" - positive transition.\n");
    end

    always @(negedge signal) begin // This block will be executed every time "signal" undergoes a negative transition('1' to '0' or 'x' or 'z', 'x' to '0', 'z' to '0').
        $display("\"signal\" - negative transition.\n");
    end

    initial begin
        signal = 1;
        #0.01 signal = 0; // A small delay is required otherwise it will create a race-condition.
        #0.01 signal = 1;
    end

// Named event control: We can declare an event and then trigger and recognize the occurrence of that event. The named event is declared by the keyword event. The event is triggered by '->' symbol. The triggering of the event is recognized by '@' symbol.
// Note: The declared event does not hold any data.

    event event_1;

    reg clock;

    initial begin
        #10 -> event_1;
    end

    always @(event_1) begin
        $display("triggering event_1.\n");
    end

// Event OR control: Event OR control is used when the transition of one of multiple signals or events can trigger the execution of a statement or a block of statements. The list of events or signals expressed as an OR is also known as sensitivity list.

    reg switch_1, switch_2, switch_3;

    always @(switch_1 or switch_2 or switch_3) begin // If any one of the "reg" variable changes, then this bock will be executed.
        $display("switch_1 or switch_2 or switch_3 was changed.");
    end

    initial begin
        #20 switch_1 = 1;
        #0.01 switch_2 = 0; // A small delay is required otherwise it will create a race-condition.
        #0.01 switch_3 = 1;
    end

// Level-Sensitive timing control: Level-Sensitive timing control will wait for a certain condition to be true before a statement or block of statement is executed.
// Note: The keyword "wait" is used for level-sensitive constructs.

    reg bit_condition = 0;

    always wait(bit_condition) begin // This line will be monitored continuously. If "bit_condition" is '0', the block is not executed. If "bit_condition" is '1', the block is executed continuously.
        // $display("\"bit_condition\" has transitioned to '1'"); // I commented this out, since it will be executed continuously, uncomment it to understand the behavior.
    end

    initial begin
        #30 bit_condition = 1;
    end

endmodule