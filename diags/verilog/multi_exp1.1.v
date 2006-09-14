module main;

reg  b, c, d, e, f, g;

wire a0 = b &  c &  d;
wire a1 = b && c && d;
wire a2 = e |  f |  g;
wire a3 = e || f || g;

initial begin
	$dumpfile( "multi_exp1.1.vcd" );
	$dumpvars( 0, main );
	b = 1'b0;
	c = 1'b0;
	d = 1'b0;
	e = 1'b1;
	f = 1'b1;
	g = 1'b1;
	#10;
	$finish;
end

endmodule
