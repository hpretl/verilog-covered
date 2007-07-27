/*
 Name:     afunc1.v
 Author:   Trevor Williams  (trevorw@charter.net)
 Date:     07/27/2007
 Purpose:  Simple test to verify functionality of automatic functions.
*/

module main;

reg [31:0] b;

initial begin
	b = 0;
	#5;
	b = div2( 32 );
end

initial begin
`ifndef VPI
        $dumpfile( "afunc1.vcd" );
        $dumpvars( 0, main );
`endif
        #10;
        $finish;
end

function automatic [31:0] div2;
  input [31:0] a;
  begin
    if( a > 0 )
      div2 = div2( a >> 1 ) + 1;
    else
      div2 = 0;
  end
endfunction

endmodule
