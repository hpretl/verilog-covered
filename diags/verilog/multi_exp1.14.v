module main;

reg  b, c, d, e, f, g;

wire a0 = b &  c &  d;
wire a1 = b && c && d;
wire a2 = e |  f |  g;
wire a3 = e || f || g;

initial begin
	$dumpfile( "multi_exp1.14.vcd" );
	$dumpvars( 0, main );
	b = 1'b1;
	c = 1'b1;
	d = 1'b1;
	e = 1'b0;
	f = 1'b0;
	g = 1'b0;
	#10;
	c = 1'b0;
	d = 1'b0;
	f = 1'b1;
	g = 1'b1;
	#10;
	$finish;
end

endmodule

/* HEADER
GROUPS multi_exp1.14 all iv vcs vcd lxt
SIM    multi_exp1.14 all iv vcd  : iverilog multi_exp1.14.v; ./a.out                             : multi_exp1.14.vcd
SIM    multi_exp1.14 all iv lxt  : iverilog multi_exp1.14.v; ./a.out -lxt2; mv multi_exp1.14.vcd multi_exp1.14.lxt : multi_exp1.14.lxt
SIM    multi_exp1.14 all vcs vcd : vcs multi_exp1.14.v; ./simv                                   : multi_exp1.14.vcd
SCORE  multi_exp1.14.vcd     : -t main -vcd multi_exp1.14.vcd -o multi_exp1.14.cdd -v multi_exp1.14.v : multi_exp1.14.cdd
SCORE  multi_exp1.14.lxt     : -t main -lxt multi_exp1.14.lxt -o multi_exp1.14.cdd -v multi_exp1.14.v : multi_exp1.14.cdd
REPORT multi_exp1.14.cdd 1   : -d v -o multi_exp1.14.rptM multi_exp1.14.cdd                         : multi_exp1.14.rptM
REPORT multi_exp1.14.cdd 2   : -d v -w -o multi_exp1.14.rptWM multi_exp1.14.cdd                     : multi_exp1.14.rptWM
REPORT multi_exp1.14.cdd 3   : -d v -i -o multi_exp1.14.rptI multi_exp1.14.cdd                      : multi_exp1.14.rptI
REPORT multi_exp1.14.cdd 4   : -d v -w -i -o multi_exp1.14.rptWI multi_exp1.14.cdd                  : multi_exp1.14.rptWI
*/

/* OUTPUT multi_exp1.14.cdd
5 1 * 6 0 0 0 0
3 0 main main multi_exp1.14.v 1 28
2 1 5 140014 2 1 c 0 0 d
2 2 5 f000f 2 1 c 0 0 c
2 3 5 a000a 1 1 8 0 0 b
2 4 5 a000f 2 8 2030c 2 3 1 0 1002
2 5 5 a0014 2 8 2024c 1 4 1 0 1002
2 6 5 50006 0 1 400 0 0 a0
2 7 5 50014 2 36 f00e 5 6
2 8 6 140014 2 1 c 0 0 d
2 9 6 f000f 2 1 c 0 0 c
2 10 6 a000a 1 1 8 0 0 b
2 11 6 a000f 2 18 2030c 9 10 1 0 1002
2 12 6 a0014 2 18 2024c 8 11 1 0 1002
2 13 6 50006 0 1 400 0 0 a1
2 14 6 50014 2 36 f00e 12 13
2 15 7 140014 2 1 c 0 0 g
2 16 7 f000f 2 1 c 0 0 f
2 17 7 a000a 1 1 4 0 0 e
2 18 7 a000f 2 9 200cc 16 17 1 0 102
2 19 7 a0014 2 9 2024c 15 18 1 0 102
2 20 7 50006 0 1 400 0 0 a2
2 21 7 50014 2 36 f00e 19 20
2 22 8 140014 2 1 c 0 0 g
2 23 8 f000f 2 1 c 0 0 f
2 24 8 a000a 1 1 4 0 0 e
2 25 8 a000f 2 17 200cc 23 24 1 0 102
2 26 8 a0014 2 17 2024c 22 25 1 0 102
2 27 8 50006 0 1 400 0 0 a3
2 28 8 50014 2 36 f00e 26 27
1 b 0 3 30005 1 0 2
1 c 0 3 30008 1 0 1002
1 d 0 3 3000b 1 0 1002
1 e 0 3 3000e 1 0 2
1 f 0 3 30011 1 0 102
1 g 0 3 30014 1 0 102
1 a0 0 5 30005 1 0 1002
1 a1 0 6 30005 1 0 1002
1 a2 0 7 30005 1 0 102
1 a3 0 8 30005 1 0 102
4 7 7 7
4 14 14 14
4 21 21 21
4 28 28 28
*/

/* OUTPUT multi_exp1.14.rptM
                             ::::::::::::::::::::::::::::::::::::::::::::::::::
                             ::                                              ::
                             ::  Covered -- Verilog Coverage Verbose Report  ::
                             ::                                              ::
                             ::::::::::::::::::::::::::::::::::::::::::::::::::


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   GENERAL INFORMATION   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Report generated from CDD file : multi_exp1.14.cdd

* Reported by                    : Module

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   LINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function      Filename                 Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    multi_exp1.14.v            4/    0/    4      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   TOGGLE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function      Filename                         Toggle 0 -> 1                       Toggle 1 -> 0
                                                   Hit/ Miss/Total    Percent hit      Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    multi_exp1.14.v            4/    6/   10       40%             4/    6/   10       40%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: multi_exp1.14.v
    -------------------------------------------------------------------------------------------------------------
    Signals not getting 100% toggle coverage

      Signal                    Toggle
      ---------------------------------------------------------------------------------------------------------
      b                         0->1: 1'h0
      ......................... 1->0: 1'h0 ...
      c                         0->1: 1'h0
      ......................... 1->0: 1'h1 ...
      d                         0->1: 1'h0
      ......................... 1->0: 1'h1 ...
      e                         0->1: 1'h0
      ......................... 1->0: 1'h0 ...
      f                         0->1: 1'h1
      ......................... 1->0: 1'h0 ...
      g                         0->1: 1'h1
      ......................... 1->0: 1'h0 ...
      a0                        0->1: 1'h0
      ......................... 1->0: 1'h1 ...
      a1                        0->1: 1'h0
      ......................... 1->0: 1'h1 ...
      a2                        0->1: 1'h1
      ......................... 1->0: 1'h0 ...
      a3                        0->1: 1'h1
      ......................... 1->0: 1'h0 ...


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   COMBINATIONAL LOGIC COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function                Filename                                Logic Combinations
                                                                      Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                              multi_exp1.14.v                    12/   4/  16       75%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: multi_exp1.14.v
    -------------------------------------------------------------------------------------------------------------
    Missed Combinations  (* = missed value)

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
              5:     a0 = ( b  &  c  &  d )
                           |1|   |2|   |3| 
                          |-------4-------|

        Expression 4   (3/4)
        ^^^^^^^^^^^^^ - &
         1 | 2 | 3 | All
        =0=|=0=|=0=|==1==
         *               

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
              6:     a1 = ( b  &&  c  &&  d )
                           |1|    |2|    |3| 
                          |--------4--------|

        Expression 4   (3/4)
        ^^^^^^^^^^^^^ - &&
         1 | 2 | 3 | All
        =0=|=0=|=0=|==1==
         *               

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
              7:     a2 = ( e  |  f  |  g )
                           |1|   |2|   |3| 
                          |-------4-------|

        Expression 4   (3/4)
        ^^^^^^^^^^^^^ - |
         1 | 2 | 3 | All
        =1=|=1=|=1=|==0==
         *               

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
              8:     a3 = ( e  ||  f  ||  g )
                           |1|    |2|    |3| 
                          |--------4--------|

        Expression 4   (3/4)
        ^^^^^^^^^^^^^ - ||
         1 | 2 | 3 | All
        =1=|=1=|=1=|==0==
         *               



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   FINITE STATE MACHINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                               State                             Arc
Module/Task/Function      Filename                Hit/Miss/Total    Percent Hit    Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    multi_exp1.14.v           0/   0/   0      100%            0/   0/   0      100%


*/

/* OUTPUT multi_exp1.14.rptWM
                             ::::::::::::::::::::::::::::::::::::::::::::::::::
                             ::                                              ::
                             ::  Covered -- Verilog Coverage Verbose Report  ::
                             ::                                              ::
                             ::::::::::::::::::::::::::::::::::::::::::::::::::


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   GENERAL INFORMATION   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Report generated from CDD file : multi_exp1.14.cdd

* Reported by                    : Module

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   LINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function      Filename                 Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    multi_exp1.14.v            4/    0/    4      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   TOGGLE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function      Filename                         Toggle 0 -> 1                       Toggle 1 -> 0
                                                   Hit/ Miss/Total    Percent hit      Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    multi_exp1.14.v            4/    6/   10       40%             4/    6/   10       40%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: multi_exp1.14.v
    -------------------------------------------------------------------------------------------------------------
    Signals not getting 100% toggle coverage

      Signal                    Toggle
      ---------------------------------------------------------------------------------------------------------
      b                         0->1: 1'h0
      ......................... 1->0: 1'h0 ...
      c                         0->1: 1'h0
      ......................... 1->0: 1'h1 ...
      d                         0->1: 1'h0
      ......................... 1->0: 1'h1 ...
      e                         0->1: 1'h0
      ......................... 1->0: 1'h0 ...
      f                         0->1: 1'h1
      ......................... 1->0: 1'h0 ...
      g                         0->1: 1'h1
      ......................... 1->0: 1'h0 ...
      a0                        0->1: 1'h0
      ......................... 1->0: 1'h1 ...
      a1                        0->1: 1'h0
      ......................... 1->0: 1'h1 ...
      a2                        0->1: 1'h1
      ......................... 1->0: 1'h0 ...
      a3                        0->1: 1'h1
      ......................... 1->0: 1'h0 ...


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   COMBINATIONAL LOGIC COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function                Filename                                Logic Combinations
                                                                      Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                              multi_exp1.14.v                    12/   4/  16       75%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: multi_exp1.14.v
    -------------------------------------------------------------------------------------------------------------
    Missed Combinations  (* = missed value)

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
              5:     a0 = ( b  &  c  &  d )
                           |1|   |2|   |3| 
                          |-------4-------|

        Expression 4   (3/4)
        ^^^^^^^^^^^^^ - &
         1 | 2 | 3 | All
        =0=|=0=|=0=|==1==
         *               

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
              6:     a1 = ( b  &&  c  &&  d )
                           |1|    |2|    |3| 
                          |--------4--------|

        Expression 4   (3/4)
        ^^^^^^^^^^^^^ - &&
         1 | 2 | 3 | All
        =0=|=0=|=0=|==1==
         *               

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
              7:     a2 = ( e  |  f  |  g )
                           |1|   |2|   |3| 
                          |-------4-------|

        Expression 4   (3/4)
        ^^^^^^^^^^^^^ - |
         1 | 2 | 3 | All
        =1=|=1=|=1=|==0==
         *               

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
              8:     a3 = ( e  ||  f  ||  g )
                           |1|    |2|    |3| 
                          |--------4--------|

        Expression 4   (3/4)
        ^^^^^^^^^^^^^ - ||
         1 | 2 | 3 | All
        =1=|=1=|=1=|==0==
         *               



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   FINITE STATE MACHINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                               State                             Arc
Module/Task/Function      Filename                Hit/Miss/Total    Percent Hit    Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    multi_exp1.14.v           0/   0/   0      100%            0/   0/   0      100%


*/

/* OUTPUT multi_exp1.14.rptI
                             ::::::::::::::::::::::::::::::::::::::::::::::::::
                             ::                                              ::
                             ::  Covered -- Verilog Coverage Verbose Report  ::
                             ::                                              ::
                             ::::::::::::::::::::::::::::::::::::::::::::::::::


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   GENERAL INFORMATION   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Report generated from CDD file : multi_exp1.14.cdd

* Reported by                    : Instance

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   LINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                           Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                          4/    0/    4      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   TOGGLE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                                   Toggle 0 -> 1                       Toggle 1 -> 0
                                                   Hit/ Miss/Total    Percent hit      Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                          4/    6/   10       40%             4/    6/   10       40%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: multi_exp1.14.v, Instance: <NA>.main
    -------------------------------------------------------------------------------------------------------------
    Signals not getting 100% toggle coverage

      Signal                    Toggle
      ---------------------------------------------------------------------------------------------------------
      b                         0->1: 1'h0
      ......................... 1->0: 1'h0 ...
      c                         0->1: 1'h0
      ......................... 1->0: 1'h1 ...
      d                         0->1: 1'h0
      ......................... 1->0: 1'h1 ...
      e                         0->1: 1'h0
      ......................... 1->0: 1'h0 ...
      f                         0->1: 1'h1
      ......................... 1->0: 1'h0 ...
      g                         0->1: 1'h1
      ......................... 1->0: 1'h0 ...
      a0                        0->1: 1'h0
      ......................... 1->0: 1'h1 ...
      a1                        0->1: 1'h0
      ......................... 1->0: 1'h1 ...
      a2                        0->1: 1'h1
      ......................... 1->0: 1'h0 ...
      a3                        0->1: 1'h1
      ......................... 1->0: 1'h0 ...


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   COMBINATIONAL LOGIC COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                                                    Logic Combinations
                                                                      Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                                            12/   4/  16       75%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: multi_exp1.14.v, Instance: <NA>.main
    -------------------------------------------------------------------------------------------------------------
    Missed Combinations  (* = missed value)

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
              5:     a0 = ( b  &  c  &  d )
                           |1|   |2|   |3| 
                          |-------4-------|

        Expression 4   (3/4)
        ^^^^^^^^^^^^^ - &
         1 | 2 | 3 | All
        =0=|=0=|=0=|==1==
         *               

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
              6:     a1 = ( b  &&  c  &&  d )
                           |1|    |2|    |3| 
                          |--------4--------|

        Expression 4   (3/4)
        ^^^^^^^^^^^^^ - &&
         1 | 2 | 3 | All
        =0=|=0=|=0=|==1==
         *               

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
              7:     a2 = ( e  |  f  |  g )
                           |1|   |2|   |3| 
                          |-------4-------|

        Expression 4   (3/4)
        ^^^^^^^^^^^^^ - |
         1 | 2 | 3 | All
        =1=|=1=|=1=|==0==
         *               

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
              8:     a3 = ( e  ||  f  ||  g )
                           |1|    |2|    |3| 
                          |--------4--------|

        Expression 4   (3/4)
        ^^^^^^^^^^^^^ - ||
         1 | 2 | 3 | All
        =1=|=1=|=1=|==0==
         *               



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   FINITE STATE MACHINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                               State                             Arc
Instance                                          Hit/Miss/Total    Percent hit    Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                         0/   0/   0      100%            0/   0/   0      100%


*/

/* OUTPUT multi_exp1.14.rptWI
                             ::::::::::::::::::::::::::::::::::::::::::::::::::
                             ::                                              ::
                             ::  Covered -- Verilog Coverage Verbose Report  ::
                             ::                                              ::
                             ::::::::::::::::::::::::::::::::::::::::::::::::::


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   GENERAL INFORMATION   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Report generated from CDD file : multi_exp1.14.cdd

* Reported by                    : Instance

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   LINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                           Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                          4/    0/    4      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   TOGGLE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                                   Toggle 0 -> 1                       Toggle 1 -> 0
                                                   Hit/ Miss/Total    Percent hit      Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                          4/    6/   10       40%             4/    6/   10       40%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: multi_exp1.14.v, Instance: <NA>.main
    -------------------------------------------------------------------------------------------------------------
    Signals not getting 100% toggle coverage

      Signal                    Toggle
      ---------------------------------------------------------------------------------------------------------
      b                         0->1: 1'h0
      ......................... 1->0: 1'h0 ...
      c                         0->1: 1'h0
      ......................... 1->0: 1'h1 ...
      d                         0->1: 1'h0
      ......................... 1->0: 1'h1 ...
      e                         0->1: 1'h0
      ......................... 1->0: 1'h0 ...
      f                         0->1: 1'h1
      ......................... 1->0: 1'h0 ...
      g                         0->1: 1'h1
      ......................... 1->0: 1'h0 ...
      a0                        0->1: 1'h0
      ......................... 1->0: 1'h1 ...
      a1                        0->1: 1'h0
      ......................... 1->0: 1'h1 ...
      a2                        0->1: 1'h1
      ......................... 1->0: 1'h0 ...
      a3                        0->1: 1'h1
      ......................... 1->0: 1'h0 ...


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   COMBINATIONAL LOGIC COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                                                    Logic Combinations
                                                                      Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                                            12/   4/  16       75%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: multi_exp1.14.v, Instance: <NA>.main
    -------------------------------------------------------------------------------------------------------------
    Missed Combinations  (* = missed value)

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
              5:     a0 = ( b  &  c  &  d )
                           |1|   |2|   |3| 
                          |-------4-------|

        Expression 4   (3/4)
        ^^^^^^^^^^^^^ - &
         1 | 2 | 3 | All
        =0=|=0=|=0=|==1==
         *               

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
              6:     a1 = ( b  &&  c  &&  d )
                           |1|    |2|    |3| 
                          |--------4--------|

        Expression 4   (3/4)
        ^^^^^^^^^^^^^ - &&
         1 | 2 | 3 | All
        =0=|=0=|=0=|==1==
         *               

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
              7:     a2 = ( e  |  f  |  g )
                           |1|   |2|   |3| 
                          |-------4-------|

        Expression 4   (3/4)
        ^^^^^^^^^^^^^ - |
         1 | 2 | 3 | All
        =1=|=1=|=1=|==0==
         *               

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
              8:     a3 = ( e  ||  f  ||  g )
                           |1|    |2|    |3| 
                          |--------4--------|

        Expression 4   (3/4)
        ^^^^^^^^^^^^^ - ||
         1 | 2 | 3 | All
        =1=|=1=|=1=|==0==
         *               



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   FINITE STATE MACHINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                               State                             Arc
Instance                                          Hit/Miss/Total    Percent hit    Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                         0/   0/   0      100%            0/   0/   0      100%


*/
