/*
 Name:        real6.2.v
 Author:      Trevor Williams  (phase1geo@gmail.com)
 Date:        10/23/2008
 Purpose:     Verify multiplication for real-binary operations
*/

module main;

real a;
reg  b;

initial begin
	a = (3.6 * 4'b1001);
	b = 1'b0;
	#5;
        b = $bitstoreal( fabs( $realtobits(a), $realtobits(32.4)) ) < 0.00001;
end

initial begin
`ifdef DUMP
        $dumpfile( "real6.2.vcd" );
        $dumpvars( 0, main );
`endif
        #10;
        $finish;
end

function [63:0] fabs;
  input [63:0] a;
  input [63:0] b;
  real x, y;
  begin
    x = $bitstoreal( a );
    y = $bitstoreal( b );
    if( x > y ) 
      fabs = $realtobits( x - y );
    else
      fabs = $realtobits( y - x );
  end 
endfunction

endmodule
