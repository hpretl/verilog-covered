`define VALUE0    1'b0

module main;

wire	a;
reg     b;

assign a = `VALUE0 | b;

initial begin
        $dumpfile( "define1.1.vcd" );
        $dumpvars( 0, main );
	b = 1'b0;
	#5;
	b = 1'b1;
        #20;
	$finish;
end

endmodule
