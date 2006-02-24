module main;

wire [1:0]   a;
wire         b;
wire         c;
reg  [3:0]   d;

assign {a, b, c} = d;

initial begin
	$dumpfile( "concat3.vcd" );
	$dumpvars( 0, main );
	d = 4'h0;
	#5;
	d = 4'h1;
	#5;
	d = 4'h2;
	#5;
	d = 4'h4;
	#5;
	d = 4'h8;
	#5;
	$finish;
end

endmodule

/* HEADER
GROUPS concat3 all iv vcs vcd lxt
SIM    concat3 all iv vcd  : iverilog concat3.v; ./a.out                             : concat3.vcd
SIM    concat3 all iv lxt  : iverilog concat3.v; ./a.out -lxt2; mv concat3.vcd concat3.lxt : concat3.lxt
SIM    concat3 all vcs vcd : vcs concat3.v; ./simv                                   : concat3.vcd
SCORE  concat3.vcd     : -t main -vcd concat3.vcd -o concat3.cdd -v concat3.v : concat3.cdd
SCORE  concat3.lxt     : -t main -lxt concat3.lxt -o concat3.cdd -v concat3.v : concat3.cdd
REPORT concat3.cdd 1   : -d v -o concat3.rptM concat3.cdd                         : concat3.rptM
REPORT concat3.cdd 2   : -d v -w -o concat3.rptWM concat3.cdd                     : concat3.rptWM
REPORT concat3.cdd 3   : -d v -i -o concat3.rptI concat3.cdd                      : concat3.rptI
REPORT concat3.cdd 4   : -d v -w -i -o concat3.rptWI concat3.cdd                  : concat3.rptWI
*/

/* OUTPUT concat3.cdd
5 1 * 6 0 0 0 0
3 0 main main concat3.v 1 26
2 1 8 130013 5 1 c 0 0 d
2 2 8 e000e 0 1 400 0 0 c
2 3 8 b000b 0 1 400 0 0 b
2 4 8 80008 0 1 400 0 0 a
2 5 8 8000b 0 31 400 3 4
2 6 8 8000e 0 31 400 2 5
2 7 8 7000f 0 26 400 6 0
2 8 8 70013 5 35 f00e 1 7
1 a 0 3 3000d 2 0 130a
1 b 0 4 3000d 1 0 1102
1 c 0 5 3000d 1 0 1102
1 d 0 6 3000d 4 0 7faa
4 8 8 8
*/

/* OUTPUT concat3.rptM
                             ::::::::::::::::::::::::::::::::::::::::::::::::::
                             ::                                              ::
                             ::  Covered -- Verilog Coverage Verbose Report  ::
                             ::                                              ::
                             ::::::::::::::::::::::::::::::::::::::::::::::::::


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   GENERAL INFORMATION   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Report generated from CDD file : concat3.cdd

* Reported by                    : Module

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   LINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function      Filename                 Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    concat3.v                  1/    0/    1      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   TOGGLE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function      Filename                         Toggle 0 -> 1                       Toggle 1 -> 0
                                                   Hit/ Miss/Total    Percent hit      Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    concat3.v                  8/    0/    8      100%             6/    2/    8       75%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: concat3.v
    -------------------------------------------------------------------------------------------------------------
    Signals not getting 100% toggle coverage

      Signal                    Toggle
      ---------------------------------------------------------------------------------------------------------
      a                         0->1: 2'h3
      ......................... 1->0: 2'h1 ...
      d                         0->1: 4'hf
      ......................... 1->0: 4'h7 ...


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   COMBINATIONAL LOGIC COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function                Filename                                Logic Combinations
                                                                      Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                              concat3.v                           2/   0/   2      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   FINITE STATE MACHINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                               State                             Arc
Module/Task/Function      Filename                Hit/Miss/Total    Percent Hit    Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    concat3.v                 0/   0/   0      100%            0/   0/   0      100%


*/

/* OUTPUT concat3.rptWM
                             ::::::::::::::::::::::::::::::::::::::::::::::::::
                             ::                                              ::
                             ::  Covered -- Verilog Coverage Verbose Report  ::
                             ::                                              ::
                             ::::::::::::::::::::::::::::::::::::::::::::::::::


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   GENERAL INFORMATION   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Report generated from CDD file : concat3.cdd

* Reported by                    : Module

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   LINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function      Filename                 Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    concat3.v                  1/    0/    1      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   TOGGLE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function      Filename                         Toggle 0 -> 1                       Toggle 1 -> 0
                                                   Hit/ Miss/Total    Percent hit      Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    concat3.v                  8/    0/    8      100%             6/    2/    8       75%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: concat3.v
    -------------------------------------------------------------------------------------------------------------
    Signals not getting 100% toggle coverage

      Signal                    Toggle
      ---------------------------------------------------------------------------------------------------------
      a                         0->1: 2'h3
      ......................... 1->0: 2'h1 ...
      d                         0->1: 4'hf
      ......................... 1->0: 4'h7 ...


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   COMBINATIONAL LOGIC COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function                Filename                                Logic Combinations
                                                                      Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                              concat3.v                           2/   0/   2      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   FINITE STATE MACHINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                               State                             Arc
Module/Task/Function      Filename                Hit/Miss/Total    Percent Hit    Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    concat3.v                 0/   0/   0      100%            0/   0/   0      100%


*/

/* OUTPUT concat3.rptI
                             ::::::::::::::::::::::::::::::::::::::::::::::::::
                             ::                                              ::
                             ::  Covered -- Verilog Coverage Verbose Report  ::
                             ::                                              ::
                             ::::::::::::::::::::::::::::::::::::::::::::::::::


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   GENERAL INFORMATION   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Report generated from CDD file : concat3.cdd

* Reported by                    : Instance

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   LINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                           Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                          1/    0/    1      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   TOGGLE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                                   Toggle 0 -> 1                       Toggle 1 -> 0
                                                   Hit/ Miss/Total    Percent hit      Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                          8/    0/    8      100%             6/    2/    8       75%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: concat3.v, Instance: <NA>.main
    -------------------------------------------------------------------------------------------------------------
    Signals not getting 100% toggle coverage

      Signal                    Toggle
      ---------------------------------------------------------------------------------------------------------
      a                         0->1: 2'h3
      ......................... 1->0: 2'h1 ...
      d                         0->1: 4'hf
      ......................... 1->0: 4'h7 ...


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   COMBINATIONAL LOGIC COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                                                    Logic Combinations
                                                                      Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                                             2/   0/   2      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   FINITE STATE MACHINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                               State                             Arc
Instance                                          Hit/Miss/Total    Percent hit    Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                         0/   0/   0      100%            0/   0/   0      100%


*/

/* OUTPUT concat3.rptWI
                             ::::::::::::::::::::::::::::::::::::::::::::::::::
                             ::                                              ::
                             ::  Covered -- Verilog Coverage Verbose Report  ::
                             ::                                              ::
                             ::::::::::::::::::::::::::::::::::::::::::::::::::


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   GENERAL INFORMATION   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Report generated from CDD file : concat3.cdd

* Reported by                    : Instance

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   LINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                           Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                          1/    0/    1      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   TOGGLE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                                   Toggle 0 -> 1                       Toggle 1 -> 0
                                                   Hit/ Miss/Total    Percent hit      Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                          8/    0/    8      100%             6/    2/    8       75%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: concat3.v, Instance: <NA>.main
    -------------------------------------------------------------------------------------------------------------
    Signals not getting 100% toggle coverage

      Signal                    Toggle
      ---------------------------------------------------------------------------------------------------------
      a                         0->1: 2'h3
      ......................... 1->0: 2'h1 ...
      d                         0->1: 4'hf
      ......................... 1->0: 4'h7 ...


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   COMBINATIONAL LOGIC COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                                                    Logic Combinations
                                                                      Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                                             2/   0/   2      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   FINITE STATE MACHINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                               State                             Arc
Instance                                          Hit/Miss/Total    Percent hit    Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                         0/   0/   0      100%            0/   0/   0      100%


*/
