module main;

event  a;
event  b, c;

reg    d, e, f;

always @(a)
  begin
   ->b;
   #5;
   ->c;
  end

always @(b) e = ~d;
always @(c) f = ~d;

initial begin
	d = 1'b0;
	#5;
	->a;
	#2;
	d = 1'b1;
end

initial begin
	$dumpfile( "event1.1.vcd" );
	$dumpvars( 0, main );
	d = 1'b0;
	#25;
	$finish;
end

endmodule

/* HEADER
GROUPS event1.1 all iv vcs vcd lxt
SIM    event1.1 all iv vcd  : iverilog event1.1.v; ./a.out                             : event1.1.vcd
SIM    event1.1 all iv lxt  : iverilog event1.1.v; ./a.out -lxt2; mv event1.1.vcd event1.1.lxt : event1.1.lxt
SIM    event1.1 all vcs vcd : vcs event1.1.v; ./simv                                   : event1.1.vcd
SCORE  event1.1.vcd     : -t main -vcd event1.1.vcd -o event1.1.cdd -v event1.1.v : event1.1.cdd
SCORE  event1.1.lxt     : -t main -lxt event1.1.lxt -o event1.1.cdd -v event1.1.v : event1.1.cdd
REPORT event1.1.cdd 1   : -d v -o event1.1.rptM event1.1.cdd                         : event1.1.rptM
REPORT event1.1.cdd 2   : -d v -w -o event1.1.rptWM event1.1.cdd                     : event1.1.rptWM
REPORT event1.1.cdd 3   : -d v -i -o event1.1.rptI event1.1.cdd                      : event1.1.rptI
REPORT event1.1.cdd 4   : -d v -w -i -o event1.1.rptWI event1.1.cdd                  : event1.1.rptWI
*/

/* OUTPUT event1.1.cdd
5 1 * 6 0 0 0 0
3 0 main main event1.1.v 1 34
2 1 10 30005 1 3c 1a 0 0 b
2 2 11 40004 1 0 20008 0 0 32 64 11 0 0 0 0 0 0 0
2 3 11 40004 1 0 20008 0 0 32 64 55 55 55 55 55 55 55 55
2 4 11 30004 3 2c 2000a 2 3 32 0 aa aa aa aa aa aa aa aa
2 5 12 30005 1 3c 601a 0 0 c
2 6 8 90009 1 1 8 0 0 a
2 7 8 90009 0 2a 20000 0 0 2 0 a
2 8 8 90009 3 29 2100a 6 7 1 0 2
2 9 15 110011 1 1 14 0 0 d
2 10 15 100010 1 1b 20028 9 0 1 0 2
2 11 15 c000c 0 1 400 0 0 e
2 12 15 c0011 1 37 602a 10 11
2 13 15 90009 1 1 8 0 0 b
2 14 15 90009 0 2a 20000 0 0 2 0 a
2 15 15 90009 3 29 2100a 13 14 1 0 2
2 16 16 110011 1 1 8 0 0 d
2 17 16 100010 1 1b 20004 16 0 1 0 2
2 18 16 c000c 0 1 400 0 0 f
2 19 16 c0011 1 37 6006 17 18
2 20 16 90009 1 1 8 0 0 c
2 21 16 90009 0 2a 20000 0 0 2 0 a
2 22 16 90009 3 29 2100a 20 21 1 0 2
2 23 19 50008 1 0 20004 0 0 1 1 0
2 24 19 10001 0 1 400 0 0 d
2 25 19 10008 1 37 1006 23 24
2 26 20 20002 1 0 20008 0 0 32 64 11 0 0 0 0 0 0 0
2 27 20 20002 1 0 20008 0 0 32 64 55 55 55 55 55 55 55 55
2 28 20 10002 2 2c 2000a 26 27 32 0 aa aa aa aa aa aa aa aa
2 29 21 10003 1 3c 1a 0 0 a
2 30 22 20002 1 0 20008 0 0 32 64 4 0 0 0 0 0 0 0
2 31 22 20002 1 0 20008 0 0 32 64 55 55 55 55 55 55 55 55
2 32 22 10002 2 2c 2000a 30 31 32 0 aa aa aa aa aa aa aa aa
2 33 23 50008 1 0 20008 0 0 1 1 1
2 34 23 10001 0 1 400 0 0 d
2 35 23 10008 1 37 a 33 34
1 a 0 3 40007 1 48 2
1 b 0 4 40007 1 48 2
1 c 0 4 4000a 1 48 2
1 d 0 6 30007 1 0 102
1 e 0 6 3000a 1 16 2
1 f 0 6 3000d 1 16 2
4 5 8 8
4 4 5 0
4 1 4 4
4 8 1 0
4 12 15 15
4 15 12 0
4 19 22 22
4 22 19 0
4 35 0 0
4 32 35 0
4 29 32 32
4 28 29 0
4 25 28 28
*/

/* OUTPUT event1.1.rptM
                             ::::::::::::::::::::::::::::::::::::::::::::::::::
                             ::                                              ::
                             ::  Covered -- Verilog Coverage Verbose Report  ::
                             ::                                              ::
                             ::::::::::::::::::::::::::::::::::::::::::::::::::


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   GENERAL INFORMATION   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Report generated from CDD file : event1.1.cdd

* Reported by                    : Module

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   LINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function      Filename                 Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    event1.1.v                10/    0/   10      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   TOGGLE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function      Filename                         Toggle 0 -> 1                       Toggle 1 -> 0
                                                   Hit/ Miss/Total    Percent hit      Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    event1.1.v                 1/    2/    3       33%             0/    3/    3        0%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: event1.1.v
    -------------------------------------------------------------------------------------------------------------
    Signals not getting 100% toggle coverage

      Signal                    Toggle
      ---------------------------------------------------------------------------------------------------------
      d                         0->1: 1'h1
      ......................... 1->0: 1'h0 ...
      e                         0->1: 1'h0
      ......................... 1->0: 1'h0 ...
      f                         0->1: 1'h0
      ......................... 1->0: 1'h0 ...


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   COMBINATIONAL LOGIC COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function                Filename                                Logic Combinations
                                                                      Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                              event1.1.v                          5/   2/   7       71%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: event1.1.v
    -------------------------------------------------------------------------------------------------------------
    Missed Combinations  (* = missed value)

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
             15:     e  = ~ d 
                          |1-|

        Expression 1   (1/2)
        ^^^^^^^^^^^^^ - ~
         E | E
        =0=|=1=
         *    

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
             16:     f  = ~ d 
                          |1-|

        Expression 1   (1/2)
        ^^^^^^^^^^^^^ - ~
         E | E
        =0=|=1=
             *



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   FINITE STATE MACHINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                               State                             Arc
Module/Task/Function      Filename                Hit/Miss/Total    Percent Hit    Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    event1.1.v                0/   0/   0      100%            0/   0/   0      100%


*/

/* OUTPUT event1.1.rptWM
                             ::::::::::::::::::::::::::::::::::::::::::::::::::
                             ::                                              ::
                             ::  Covered -- Verilog Coverage Verbose Report  ::
                             ::                                              ::
                             ::::::::::::::::::::::::::::::::::::::::::::::::::


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   GENERAL INFORMATION   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Report generated from CDD file : event1.1.cdd

* Reported by                    : Module

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   LINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function      Filename                 Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    event1.1.v                10/    0/   10      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   TOGGLE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function      Filename                         Toggle 0 -> 1                       Toggle 1 -> 0
                                                   Hit/ Miss/Total    Percent hit      Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    event1.1.v                 1/    2/    3       33%             0/    3/    3        0%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: event1.1.v
    -------------------------------------------------------------------------------------------------------------
    Signals not getting 100% toggle coverage

      Signal                    Toggle
      ---------------------------------------------------------------------------------------------------------
      d                         0->1: 1'h1
      ......................... 1->0: 1'h0 ...
      e                         0->1: 1'h0
      ......................... 1->0: 1'h0 ...
      f                         0->1: 1'h0
      ......................... 1->0: 1'h0 ...


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   COMBINATIONAL LOGIC COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Module/Task/Function                Filename                                Logic Combinations
                                                                      Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                              event1.1.v                          5/   2/   7       71%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: event1.1.v
    -------------------------------------------------------------------------------------------------------------
    Missed Combinations  (* = missed value)

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
             15:     e  = ~ d 
                          |1-|

        Expression 1   (1/2)
        ^^^^^^^^^^^^^ - ~
         E | E
        =0=|=1=
         *    

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
             16:     f  = ~ d 
                          |1-|

        Expression 1   (1/2)
        ^^^^^^^^^^^^^ - ~
         E | E
        =0=|=1=
             *



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   FINITE STATE MACHINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                               State                             Arc
Module/Task/Function      Filename                Hit/Miss/Total    Percent Hit    Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  main                    event1.1.v                0/   0/   0      100%            0/   0/   0      100%


*/

/* OUTPUT event1.1.rptI
                             ::::::::::::::::::::::::::::::::::::::::::::::::::
                             ::                                              ::
                             ::  Covered -- Verilog Coverage Verbose Report  ::
                             ::                                              ::
                             ::::::::::::::::::::::::::::::::::::::::::::::::::


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   GENERAL INFORMATION   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Report generated from CDD file : event1.1.cdd

* Reported by                    : Instance

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   LINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                           Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                         10/    0/   10      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   TOGGLE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                                   Toggle 0 -> 1                       Toggle 1 -> 0
                                                   Hit/ Miss/Total    Percent hit      Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                          1/    2/    3       33%             0/    3/    3        0%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: event1.1.v, Instance: <NA>.main
    -------------------------------------------------------------------------------------------------------------
    Signals not getting 100% toggle coverage

      Signal                    Toggle
      ---------------------------------------------------------------------------------------------------------
      d                         0->1: 1'h1
      ......................... 1->0: 1'h0 ...
      e                         0->1: 1'h0
      ......................... 1->0: 1'h0 ...
      f                         0->1: 1'h0
      ......................... 1->0: 1'h0 ...


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   COMBINATIONAL LOGIC COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                                                    Logic Combinations
                                                                      Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                                             5/   2/   7       71%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: event1.1.v, Instance: <NA>.main
    -------------------------------------------------------------------------------------------------------------
    Missed Combinations  (* = missed value)

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
             15:     e  = ~ d 
                          |1-|

        Expression 1   (1/2)
        ^^^^^^^^^^^^^ - ~
         E | E
        =0=|=1=
         *    

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
             16:     f  = ~ d 
                          |1-|

        Expression 1   (1/2)
        ^^^^^^^^^^^^^ - ~
         E | E
        =0=|=1=
             *



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   FINITE STATE MACHINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                               State                             Arc
Instance                                          Hit/Miss/Total    Percent hit    Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                         0/   0/   0      100%            0/   0/   0      100%


*/

/* OUTPUT event1.1.rptWI
                             ::::::::::::::::::::::::::::::::::::::::::::::::::
                             ::                                              ::
                             ::  Covered -- Verilog Coverage Verbose Report  ::
                             ::                                              ::
                             ::::::::::::::::::::::::::::::::::::::::::::::::::


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   GENERAL INFORMATION   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Report generated from CDD file : event1.1.cdd

* Reported by                    : Instance

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   LINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                           Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                         10/    0/   10      100%


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   TOGGLE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                                   Toggle 0 -> 1                       Toggle 1 -> 0
                                                   Hit/ Miss/Total    Percent hit      Hit/ Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                          1/    2/    3       33%             0/    3/    3        0%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: event1.1.v, Instance: <NA>.main
    -------------------------------------------------------------------------------------------------------------
    Signals not getting 100% toggle coverage

      Signal                    Toggle
      ---------------------------------------------------------------------------------------------------------
      d                         0->1: 1'h1
      ......................... 1->0: 1'h0 ...
      e                         0->1: 1'h0
      ......................... 1->0: 1'h0 ...
      f                         0->1: 1'h0
      ......................... 1->0: 1'h0 ...


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   COMBINATIONAL LOGIC COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Instance                                                                    Logic Combinations
                                                                      Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                                             5/   2/   7       71%
---------------------------------------------------------------------------------------------------------------------

    Module: main, File: event1.1.v, Instance: <NA>.main
    -------------------------------------------------------------------------------------------------------------
    Missed Combinations  (* = missed value)

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
             15:     e  = ~ d 
                          |1-|

        Expression 1   (1/2)
        ^^^^^^^^^^^^^ - ~
         E | E
        =0=|=1=
         *    

      =========================================================================================================
       Line #     Expression
      =========================================================================================================
             16:     f  = ~ d 
                          |1-|

        Expression 1   (1/2)
        ^^^^^^^^^^^^^ - ~
         E | E
        =0=|=1=
             *



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   FINITE STATE MACHINE COVERAGE RESULTS   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                               State                             Arc
Instance                                          Hit/Miss/Total    Percent hit    Hit/Miss/Total    Percent hit
---------------------------------------------------------------------------------------------------------------------
  <NA>.main                                         0/   0/   0      100%            0/   0/   0      100%


*/
