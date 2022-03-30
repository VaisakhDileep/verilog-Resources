/*
Created by  : Vaisakh Dileep
Date        : 30, March, 2022
Description : This program helps to understand escaped identifiers in verilog.
*/

/*
Identifier naming rule: Identifiers are made up of alphanumeric characters, underscore('_') and the dollar sign('$') and are case-sensitive. Identifiers should start with an alphabet or an underscore(should not start with '$').
*/

module represent_escaped_identifer();

    integer _one_; // This is valid.

    integer _two$; // This is valid.

    // integer $three_; // This will given an error since we shouldn't start with '$' sign.

    // integer _four_@; // This will given an error since we have used a special character('@').

    integer \$@**@$ = 5; // Escaped identifiers start with a backlash('\') and end with a whitespace(space, tab or newline).

    // integer \$@****@$= 6; // This will given an error since we haven't included whitespace after the identifier.

    integer \$@******@$    = 7; // This is valid(including tab after the identifier).

    integer \$@********@$
    = 8; // This is valid(including newline after the identifier).

    initial begin
        $finish;
    end

endmodule