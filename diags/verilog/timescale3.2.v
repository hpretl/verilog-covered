/*
 Name:     timescale3.2.v
 Author:   Trevor Williams  (trevorw@charter.net)
 Date:     11/25/2006
 Purpose:  Verifies that an illegal value in the time precision
           measurement gets appropriately flagged.
*/

`timescale 1 s / 1 gs

module main;

initial begin
`ifndef VPI
        $dumpfile( "timescale3.2.vcd" );
        $dumpvars( 0, main );
`endif
        #10;
        $finish;
end

endmodule
