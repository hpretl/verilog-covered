module main;

reg  [127:0]  a;
reg  [127:0]  b;

always @(b)
  a = {b[123:120], b[127:124],
       b[115:112], b[119:116],
       b[107:104], b[111:108],
       b[ 99: 96], b[103:100],
       b[ 91: 88], b[ 95: 92],
       b[ 83: 80], b[ 87: 84],
       b[ 75: 72], b[ 79: 76],
       b[ 67: 64], b[ 71: 68],
       b[ 59: 56], b[ 63: 60],
       b[ 51: 48], b[ 55: 52],
       b[ 43: 40], b[ 47: 44],
       b[ 35: 32], b[ 39: 36],
       b[ 27: 24], b[ 31: 28],
       b[ 19: 16], b[ 23: 20],
       b[ 11:  8], b[ 15: 12],
       b[  3:  0], b[  7:  4]};

initial begin
	$dumpfile( "concat5.vcd" );
	$dumpvars( 0, main );
	b = 128'h0;
	#5;
	b = 128'h1;
	#5;
	$finish;
end

endmodule

/* HEADER
GROUPS concat5 all iv vcs vcd lxt
SIM    concat5 all iv vcd  : iverilog concat5.v; ./a.out                             : concat5.vcd
SIM    concat5 all iv lxt  : iverilog concat5.v; ./a.out -lxt2; mv concat5.vcd concat5.lxt : concat5.lxt
SIM    concat5 all vcs vcd : vcs concat5.v; ./simv                                   : concat5.vcd
SCORE  concat5.vcd     : -t main -vcd concat5.vcd -o concat5.cdd -v concat5.v : concat5.cdd
SCORE  concat5.lxt     : -t main -lxt concat5.lxt -o concat5.cdd -v concat5.v : concat5.cdd
REPORT concat5.cdd 1   : -d v -o concat5.rptM concat5.cdd                         : concat5.rptM
REPORT concat5.cdd 2   : -d v -w -o concat5.rptWM concat5.cdd                     : concat5.rptWM
REPORT concat5.cdd 3   : -d v -i -o concat5.rptI concat5.cdd                      : concat5.rptI
REPORT concat5.cdd 4   : -d v -w -i -o concat5.rptWI concat5.cdd                  : concat5.rptWI
*/

/* OUTPUT concat5.cdd
5 1 * 6 0 0 0 0
3 0 main main concat5.v 1 34
2 1 22 1b001b 1 0 20008 0 0 32 64 10 0 0 0 0 0 0 0
2 2 22 170017 2 0 20008 0 0 32 64 15 0 0 0 0 0 0 0
2 3 22 13001c 2 24 204 1 2 b
2 4 22 f000f 1 0 20004 0 0 32 64 0 0 0 0 0 0 0 0
2 5 22 b000b 2 0 20008 0 0 32 64 5 0 0 0 0 0 0 0
2 6 22 70010 2 24 10c 4 5 b
2 7 21 1a001b 1 0 20008 0 0 32 64 50 0 0 0 0 0 0 0
2 8 21 160017 2 0 20008 0 0 32 64 55 0 0 0 0 0 0 0
2 9 21 13001c 2 24 204 7 8 b
2 10 21 f000f 1 0 20008 0 0 32 64 40 0 0 0 0 0 0 0
2 11 21 a000b 2 0 20008 0 0 32 64 45 0 0 0 0 0 0 0
2 12 21 70010 2 24 204 10 11 b
2 13 20 1a001b 1 0 20008 0 0 32 64 10 1 0 0 0 0 0 0
2 14 20 160017 2 0 20008 0 0 32 64 15 1 0 0 0 0 0 0
2 15 20 13001c 2 24 204 13 14 b
2 16 20 e000f 1 0 20008 0 0 32 64 0 1 0 0 0 0 0 0
2 17 20 a000b 2 0 20008 0 0 32 64 5 1 0 0 0 0 0 0
2 18 20 70010 2 24 204 16 17 b
2 19 19 1a001b 1 0 20008 0 0 32 64 50 1 0 0 0 0 0 0
2 20 19 160017 2 0 20008 0 0 32 64 55 1 0 0 0 0 0 0
2 21 19 13001c 2 24 204 19 20 b
2 22 19 e000f 1 0 20008 0 0 32 64 40 1 0 0 0 0 0 0
2 23 19 a000b 2 0 20008 0 0 32 64 45 1 0 0 0 0 0 0
2 24 19 70010 2 24 204 22 23 b
2 25 18 1a001b 1 0 20008 0 0 32 64 10 4 0 0 0 0 0 0
2 26 18 160017 2 0 20008 0 0 32 64 15 4 0 0 0 0 0 0
2 27 18 13001c 2 24 204 25 26 b
2 28 18 e000f 1 0 20008 0 0 32 64 0 4 0 0 0 0 0 0
2 29 18 a000b 2 0 20008 0 0 32 64 5 4 0 0 0 0 0 0
2 30 18 70010 2 24 204 28 29 b
2 31 17 1a001b 1 0 20008 0 0 32 64 50 4 0 0 0 0 0 0
2 32 17 160017 2 0 20008 0 0 32 64 55 4 0 0 0 0 0 0
2 33 17 13001c 2 24 204 31 32 b
2 34 17 e000f 1 0 20008 0 0 32 64 40 4 0 0 0 0 0 0
2 35 17 a000b 2 0 20008 0 0 32 64 45 4 0 0 0 0 0 0
2 36 17 70010 2 24 204 34 35 b
2 37 16 1a001b 1 0 20008 0 0 32 64 10 5 0 0 0 0 0 0
2 38 16 160017 2 0 20008 0 0 32 64 15 5 0 0 0 0 0 0
2 39 16 13001c 2 24 204 37 38 b
2 40 16 e000f 1 0 20008 0 0 32 64 0 5 0 0 0 0 0 0
2 41 16 a000b 2 0 20008 0 0 32 64 5 5 0 0 0 0 0 0
2 42 16 70010 2 24 204 40 41 b
2 43 15 1a001b 1 0 20008 0 0 32 64 50 5 0 0 0 0 0 0
2 44 15 160017 2 0 20008 0 0 32 64 55 5 0 0 0 0 0 0
2 45 15 13001c 2 24 204 43 44 b
2 46 15 e000f 1 0 20008 0 0 32 64 40 5 0 0 0 0 0 0
2 47 15 a000b 2 0 20008 0 0 32 64 45 5 0 0 0 0 0 0
2 48 15 70010 2 24 204 46 47 b
2 49 14 1a001b 1 0 20008 0 0 32 64 10 10 0 0 0 0 0 0
2 50 14 160017 2 0 20008 0 0 32 64 15 10 0 0 0 0 0 0
2 51 14 13001c 2 24 204 49 50 b
2 52 14 e000f 1 0 20008 0 0 32 64 0 10 0 0 0 0 0 0
2 53 14 a000b 2 0 20008 0 0 32 64 5 10 0 0 0 0 0 0
2 54 14 70010 2 24 204 52 53 b
2 55 13 1a001b 1 0 20008 0 0 32 64 50 10 0 0 0 0 0 0
2 56 13 160017 2 0 20008 0 0 32 64 55 10 0 0 0 0 0 0
2 57 13 13001c 2 24 204 55 56 b
2 58 13 e000f 1 0 20008 0 0 32 64 40 10 0 0 0 0 0 0
2 59 13 a000b 2 0 20008 0 0 32 64 45 10 0 0 0 0 0 0
2 60 13 70010 2 24 204 58 59 b
2 61 12 1a001b 1 0 20008 0 0 32 64 10 11 0 0 0 0 0 0
2 62 12 160017 2 0 20008 0 0 32 64 15 11 0 0 0 0 0 0
2 63 12 13001c 2 24 204 61 62 b
2 64 12 e000f 1 0 20008 0 0 32 64 0 11 0 0 0 0 0 0
2 65 12 a000b 2 0 20008 0 0 32 64 5 11 0 0 0 0 0 0
2 66 12 70010 2 24 204 64 65 b
2 67 11 1a001b 1 0 20008 0 0 32 64 50 11 0 0 0 0 0 0
2 68 11 160017 2 0 20008 0 0 32 64 55 11 0 0 0 0 0 0
2 69 11 13001c 2 24 204 67 68 b
2 70 11 e000f 1 0 20008 0 0 32 64 40 11 0 0 0 0 0 0
2 71 11 a000b 2 0 20008 0 0 32 64 45 11 0 0 0 0 0 0
2 72 11 70010 2 24 204 70 71 b
2 73 10 19001b 1 0 20008 0 0 32 64 10 14 0 0 0 0 0 0
2 74 10 150017 2 0 20008 0 0 32 64 15 14 0 0 0 0 0 0
2 75 10 13001c 2 24 204 73 74 b
2 76 10 e000f 1 0 20008 0 0 32 64 0 14 0 0 0 0 0 0
2 77 10 a000b 2 0 20008 0 0 32 64 5 14 0 0 0 0 0 0
2 78 10 70010 2 24 204 76 77 b
2 79 9 19001b 1 0 20008 0 0 32 64 50 14 0 0 0 0 0 0
2 80 9 150017 2 0 20008 0 0 32 64 55 14 0 0 0 0 0 0
2 81 9 13001c 2 24 204 79 80 b
2 82 9 d000f 1 0 20008 0 0 32 64 40 14 0 0 0 0 0 0
2 83 9 9000b 2 0 20008 0 0 32 64 45 14 0 0 0 0 0 0
2 84 9 70010 2 24 204 82 83 b
2 85 8 19001b 1 0 20008 0 0 32 64 10 15 0 0 0 0 0 0
2 86 8 150017 2 0 20008 0 0 32 64 15 15 0 0 0 0 0 0
2 87 8 13001c 2 24 204 85 86 b
2 88 8 d000f 1 0 20008 0 0 32 64 0 15 0 0 0 0 0 0
2 89 8 9000b 2 0 20008 0 0 32 64 5 15 0 0 0 0 0 0
2 90 8 70010 2 24 204 88 89 b
2 91 7 19001b 1 0 20008 0 0 32 64 50 15 0 0 0 0 0 0
2 92 7 150017 2 0 20008 0 0 32 64 55 15 0 0 0 0 0 0
2 93 7 13001c 2 24 204 91 92 b
2 94 7 d000f 1 0 20008 0 0 32 64 40 15 0 0 0 0 0 0
2 95 7 9000b 2 0 20008 0 0 32 64 45 15 0 0 0 0 0 0
2 96 7 70010 2 24 204 94 95 b
2 97 7 7001c 2 31 20044 93 96 8 0 aa aa
2 98 7 70010 2 31 20044 90 97 12 0 aa aa aa
2 99 7 7001c 2 31 20044 87 98 16 0 aa aa aa aa
2 100 7 70010 2 31 20044 84 99 20 0 aa aa aa aa aa
2 101 7 7001c 2 31 20044 81 100 24 0 aa aa aa aa aa aa
2 102 7 70010 2 31 20044 78 101 28 0 aa aa aa aa aa aa aa
2 103 7 7001c 2 31 20044 75 102 32 0 aa aa aa aa aa aa aa aa
2 104 7 70010 2 31 20044 72 103 36 0 aa aa aa aa aa aa aa aa aa
2 105 7 7001c 2 31 20044 69 104 40 0 aa aa aa aa aa aa aa aa aa aa
2 106 7 70010 2 31 20044 66 105 44 0 aa aa aa aa aa aa aa aa aa aa aa
2 107 7 7001c 2 31 20044 63 106 48 0 aa aa aa aa aa aa aa aa aa aa aa aa
2 108 7 70010 2 31 20044 60 107 52 0 aa aa aa aa aa aa aa aa aa aa aa aa aa
2 109 7 7001c 2 31 20044 57 108 56 0 aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 110 7 70010 2 31 20044 54 109 60 0 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 111 7 7001c 2 31 20044 51 110 64 0 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 112 7 70010 2 31 20044 48 111 68 0 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 113 7 7001c 2 31 20044 45 112 72 0 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 114 7 70010 2 31 20044 42 113 76 0 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 115 7 7001c 2 31 20044 39 114 80 0 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 116 7 70010 2 31 20044 36 115 84 0 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 117 7 7001c 2 31 20044 33 116 88 0 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 118 7 70010 2 31 20044 30 117 92 0 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 119 7 7001c 2 31 20044 27 118 96 0 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 120 7 70010 2 31 20044 24 119 100 0 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 121 7 7001c 2 31 20044 21 120 104 0 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 122 7 70010 2 31 20044 18 121 108 0 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 123 7 7001c 2 31 20044 15 122 112 0 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 124 7 70010 2 31 20044 12 123 116 0 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 125 7 7001c 2 31 20044 9 124 120 0 aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 126 7 70010 2 31 200cc 6 125 124 0 1aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 127 7 7001c 2 31 2014c 3 126 128 0 aa 1aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 128 7 6001d 2 26 2000c 127 0 128 0 aa 1aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
2 129 7 20002 0 1 400 0 0 a
2 130 7 2001d 2 37 600e 128 129
2 131 6 90009 2 1 c 0 0 b
2 132 6 90009 0 2a 20000 0 0 129 0 1aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa 2
2 133 6 90009 5 29 2100a 131 132 1 0 2
1 a 0 3 3000e 128 16 aa 1aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
1 b 0 4 3000e 128 0 1aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa
4 130 133 133
4 133 130 0
*/

/* OUTPUT concat5.rptM
                             ::::::::::::::::::::::::::::::::::::::::::::::::::
                             ::                                              ::
                             ::  Covered -- Verilog Coverage Verbose Report  ::
                             ::                                              ::
                             ::::::::::::::::::::::::::::::::::::::::::::::::::


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   GENERAL INFORMATION   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Report generated from CDD file : concat5.cdd

* Reported by                    : Module

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   LINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function      Filename                 Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    concat5.v                  2/    0/    2      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   TOGGLE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function      Filename                         Toggle 0 -> 1                       Toggle 1 -> 0
                                                   Hit/ Miss/Total    Percent hit      Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    concat5.v                  2/  254/  256        1%             0/  256/  256        0%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: concat5.v
    -------------------------------------------------------------------------------------------------------------
    Signals not getting 100% toggle coverage

      Signal                    Toggle
      ---------------------------------------------------------------------------------------------------------
      a                         0->1: 128'h0000_0000_0000_0000_0000_0000_0000_0010
      ......................... 1->0: 128'h0000_0000_0000_0000_0000_0000_0000_0000 ...
      b                         0->1: 128'h0000_0000_0000_0000_0000_0000_0000_0001
      ......................... 1->0: 128'h0000_0000_0000_0000_0000_0000_0000_0000 ...


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   COMBINATIONAL LOGIC COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function                Filename                                Logic Combinations
                                                                      Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                              concat5.v                           3/   0/   3      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   FINITE STATE MACHINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                               State                             Arc
Module/Task/Function      Filename                Hit/Miss/Total    Percent Hit    Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    concat5.v                 0/   0/   0      100%            0/   0/   0      100%


*/

/* OUTPUT concat5.rptWM
                             ::::::::::::::::::::::::::::::::::::::::::::::::::
                             ::                                              ::
                             ::  Covered -- Verilog Coverage Verbose Report  ::
                             ::                                              ::
                             ::::::::::::::::::::::::::::::::::::::::::::::::::


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   GENERAL INFORMATION   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Report generated from CDD file : concat5.cdd

* Reported by                    : Module

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   LINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function      Filename                 Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    concat5.v                  2/    0/    2      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   TOGGLE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function      Filename                         Toggle 0 -> 1                       Toggle 1 -> 0
                                                   Hit/ Miss/Total    Percent hit      Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    concat5.v                  2/  254/  256        1%             0/  256/  256        0%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: concat5.v
    -------------------------------------------------------------------------------------------------------------
    Signals not getting 100% toggle coverage

      Signal                    Toggle
      ---------------------------------------------------------------------------------------------------------
      a                         0->1: 128'h0000_0000_0000_0000_0000_0000_0000_0010
      ......................... 1->0: 128'h0000_0000_0000_0000_0000_0000_0000_0000 ...
      b                         0->1: 128'h0000_0000_0000_0000_0000_0000_0000_0001
      ......................... 1->0: 128'h0000_0000_0000_0000_0000_0000_0000_0000 ...


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   COMBINATIONAL LOGIC COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function                Filename                                Logic Combinations
                                                                      Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                              concat5.v                           3/   0/   3      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   FINITE STATE MACHINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                               State                             Arc
Module/Task/Function      Filename                Hit/Miss/Total    Percent Hit    Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    concat5.v                 0/   0/   0      100%            0/   0/   0      100%


*/

/* OUTPUT concat5.rptI
                             ::::::::::::::::::::::::::::::::::::::::::::::::::
                             ::                                              ::
                             ::  Covered -- Verilog Coverage Verbose Report  ::
                             ::                                              ::
                             ::::::::::::::::::::::::::::::::::::::::::::::::::


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   GENERAL INFORMATION   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Report generated from CDD file : concat5.cdd

* Reported by                    : Instance

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   LINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                           Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                          2/    0/    2      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   TOGGLE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                                   Toggle 0 -> 1                       Toggle 1 -> 0
                                                   Hit/ Miss/Total    Percent hit      Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                          2/  254/  256        1%             0/  256/  256        0%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: concat5.v, Instance: <NA>.main
    -------------------------------------------------------------------------------------------------------------
    Signals not getting 100% toggle coverage

      Signal                    Toggle
      ---------------------------------------------------------------------------------------------------------
      a                         0->1: 128'h0000_0000_0000_0000_0000_0000_0000_0010
      ......................... 1->0: 128'h0000_0000_0000_0000_0000_0000_0000_0000 ...
      b                         0->1: 128'h0000_0000_0000_0000_0000_0000_0000_0001
      ......................... 1->0: 128'h0000_0000_0000_0000_0000_0000_0000_0000 ...


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   COMBINATIONAL LOGIC COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                                                    Logic Combinations
                                                                      Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                                             3/   0/   3      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   FINITE STATE MACHINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                               State                             Arc
Instance                                          Hit/Miss/Total    Percent hit    Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                         0/   0/   0      100%            0/   0/   0      100%


*/

/* OUTPUT concat5.rptWI
                             ::::::::::::::::::::::::::::::::::::::::::::::::::
                             ::                                              ::
                             ::  Covered -- Verilog Coverage Verbose Report  ::
                             ::                                              ::
                             ::::::::::::::::::::::::::::::::::::::::::::::::::


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   GENERAL INFORMATION   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Report generated from CDD file : concat5.cdd

* Reported by                    : Instance

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   LINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                           Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                          2/    0/    2      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   TOGGLE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                                   Toggle 0 -> 1                       Toggle 1 -> 0
                                                   Hit/ Miss/Total    Percent hit      Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                          2/  254/  256        1%             0/  256/  256        0%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: concat5.v, Instance: <NA>.main
    -------------------------------------------------------------------------------------------------------------
    Signals not getting 100% toggle coverage

      Signal                    Toggle
      ---------------------------------------------------------------------------------------------------------
      a                         0->1: 128'h0000_0000_0000_0000_0000_0000_0000_0010
      ......................... 1->0: 128'h0000_0000_0000_0000_0000_0000_0000_0000 ...
      b                         0->1: 128'h0000_0000_0000_0000_0000_0000_0000_0001
      ......................... 1->0: 128'h0000_0000_0000_0000_0000_0000_0000_0000 ...


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   COMBINATIONAL LOGIC COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                                                    Logic Combinations
                                                                      Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                                             3/   0/   3      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   FINITE STATE MACHINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                               State                             Arc
Instance                                          Hit/Miss/Total    Percent hit    Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                         0/   0/   0      100%            0/   0/   0      100%


*/
