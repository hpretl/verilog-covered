/*!
 \file     codegen.c
 \author   Trevor Williams  (trevorw@charter.net)
 \date     4/11/2002
*/

#include <string.h>
#include <assert.h>

#include "defines.h"
#include "codegen.h"
#include "vector.h"


/*!
 \param expr     Pointer to root of expression tree to generate.
 \param line     Specifies last line number to generate.

 \return Returns a pointer to the generated Verilog string.

 Generates Verilog code from specified expression tree.  This Verilog
 snippet is used by the verbose coverage reporting functions for showing
 Verilog examples that were missed during simulation.  The line parameter
 specifies the last line number to generate for this expression tree.  If
 the value of line is -1, the entire expression tree is generated.
*/
char* codegen_gen_expr( expression* expr, int line ) {

  char* my_code = NULL;  /* Pointer to the code that is generated by the current expression           */
  char* right_code;      /* Pointer to the code that is generated by the right side of the expression */
  char* left_code;       /* Pointer to the code that is generated by the left side of the expression  */
  int   code_size;       /* Number of bytes wide my_code is                                           */
  char  code_format[12]; /* Format for creating my_code string                                        */
  bool  left;            /* Specifies if left expression should be used                               */
  bool  right;           /* Specifies if right expression should be used                              */

  if( (expr != NULL) && ((line == -1) || (expr->line == line)) ) {

    left_code  = codegen_gen_expr( expr->left,  line );
    right_code = codegen_gen_expr( expr->right, line );

    if( SUPPL_OP( expr->suppl ) == EXP_OP_NONE ) {

      my_code = vector_to_string( expr->value, HEXIDECIMAL );

    } else if( SUPPL_OP( expr->suppl ) == EXP_OP_SIG ) {

      assert( expr->sig != NULL );
      my_code = strdup( expr->sig->name );

    } else if( SUPPL_OP( expr->suppl ) == EXP_OP_SBIT_SEL ) {

      assert( expr->sig != NULL );
      my_code = (char*)malloc_safe( strlen( expr->sig->name ) + 13 );
      snprintf( code_format, (strlen( expr->sig->name ) + 13), "%s[%d]", expr->sig->name, right_code );

    } else if( SUPPL_OP( expr->suppl ) == EXP_OP_MBIT_SEL ) {

      assert( expr->sig != NULL );
      my_code = (char*)malloc_safe( strlen( expr->sig->name ) + 23 );
      snprintf( code_format, (strlen( expr->sig->name ) + 13), "%s[%d:%d]", expr->sig->name, left_code, right_code );

    } else {

      switch( SUPPL_OP( expr->suppl ) ) {
        case EXP_OP_XOR      :  code_size = 6;  strcpy( code_format, "(%s ^ %s)" );   left = TRUE;   right = TRUE;   break;
        case EXP_OP_MULTIPLY :  code_size = 6;  strcpy( code_format, "(%s * %s)" );   left = TRUE;   right = TRUE;   break;
        case EXP_OP_DIVIDE   :  code_size = 6;  strcpy( code_format, "(%s / %s)" );   left = TRUE;   right = TRUE;   break;
        case EXP_OP_MOD      :  code_size = 6;  strcpy( code_format, "(%s %% %s)" );  left = TRUE;   right = TRUE;   break;
        case EXP_OP_ADD      :  code_size = 6;  strcpy( code_format, "(%s + %s)" );   left = TRUE;   right = TRUE;   break;
        case EXP_OP_SUBTRACT :  code_size = 6;  strcpy( code_format, "(%s - %s)" );   left = TRUE;   right = TRUE;   break;
        case EXP_OP_AND      :  code_size = 6;  strcpy( code_format, "(%s & %s)" );   left = TRUE;   right = TRUE;   break;
        case EXP_OP_OR       :  code_size = 6;  strcpy( code_format, "(%s | %s)" );   left = TRUE;   right = TRUE;   break;
        case EXP_OP_NAND     :  code_size = 7;  strcpy( code_format, "(%s ~& %s)" );  left = TRUE;   right = TRUE;   break;
        case EXP_OP_NOR      :  code_size = 7;  strcpy( code_format, "(%s ~| %s)" );  left = TRUE;   right = TRUE;   break;
        case EXP_OP_NXOR     :  code_size = 7;  strcpy( code_format, "(%s ~^ %s)" );  left = TRUE;   right = TRUE;   break;
        case EXP_OP_LT       :  code_size = 6;  strcpy( code_format, "(%s < %s)" );   left = TRUE;   right = TRUE;   break;
        case EXP_OP_GT       :  code_size = 6;  strcpy( code_format, "(%s > %s)" );   left = TRUE;   right = TRUE;   break;
        case EXP_OP_LSHIFT   :  code_size = 7;  strcpy( code_format, "(%s << %s)" );  left = TRUE;   right = TRUE;   break;
        case EXP_OP_RSHIFT   :  code_size = 7;  strcpy( code_format, "(%s >> %s)" );  left = TRUE;   right = TRUE;   break;
        case EXP_OP_EQ       :  code_size = 7;  strcpy( code_format, "(%s == %s)" );  left = TRUE;   right = TRUE;   break;
        case EXP_OP_CEQ      :  code_size = 8;  strcpy( code_format, "(%s === %s)" ); left = TRUE;   right = TRUE;   break;
        case EXP_OP_LE       :  code_size = 7;  strcpy( code_format, "(%s <= %s)" );  left = TRUE;   right = TRUE;   break;
        case EXP_OP_GE       :  code_size = 7;  strcpy( code_format, "(%s >= %s)" );  left = TRUE;   right = TRUE;   break;
        case EXP_OP_NE       :  code_size = 7;  strcpy( code_format, "(%s != %s)" );  left = TRUE;   right = TRUE;   break;
        case EXP_OP_CNE      :  code_size = 8;  strcpy( code_format, "(%s !== %s)" ); left = TRUE;   right = TRUE;   break;
        case EXP_OP_LOR      :  code_size = 7;  strcpy( code_format, "(%s || %s)" );  left = TRUE;   right = TRUE;   break;
        case EXP_OP_LAND     :  code_size = 7;  strcpy( code_format, "(%s && %s)" );  left = TRUE;   right = TRUE;   break;
        case EXP_OP_COND     :  code_size = 4;  strcpy( code_format, "%s ? %s" );     left = TRUE;   right = TRUE ;  break;
        case EXP_OP_COND_SEL :  code_size = 4;  strcpy( code_format, "%s : %s" );     left = TRUE;   right = TRUE;   break;
        case EXP_OP_UINV     :  code_size = 3;  strcpy( code_format, "~%s " );        left = FALSE;  right = TRUE;   break;
        case EXP_OP_UAND     :  code_size = 3;  strcpy( code_format, "&%s " );        left = FALSE;  right = TRUE;   break;
        case EXP_OP_UNOT     :  code_size = 3;  strcpy( code_format, "!%s " );        left = FALSE;  right = TRUE;   break;
        case EXP_OP_UOR      :  code_size = 3;  strcpy( code_format, "|%s " );        left = FALSE;  right = TRUE;   break;
        case EXP_OP_UXOR     :  code_size = 3;  strcpy( code_format, "^%s " );        left = FALSE;  right = TRUE;   break;
        case EXP_OP_UNAND    :  code_size = 3;  strcpy( code_format, "~&%s" );        left = FALSE;  right = TRUE;   break;
        case EXP_OP_UNOR     :  code_size = 3;  strcpy( code_format, "~|%s" );        left = FALSE;  right = TRUE;   break;
        case EXP_OP_UNXOR    :  code_size = 3;  strcpy( code_format, "~^%s" );        left = FALSE;  right = TRUE;   break;
        case EXP_OP_EXPAND   :  break;   // Not sure how to handle
        case EXP_OP_CONCAT   :  break;   // Not sure how to handle
        case EXP_OP_PEDGE    :  break;   // Not sure how to handle
        case EXP_OP_NEDGE    :  break;   // Not sure how to handle
        case EXP_OP_AEDGE    :  break;   // Not sure how to handle
        default:  break;
      }

      if( left && right ) {
        code_size = strlen( right_code ) + strlen( left_code ) + code_size;
        my_code   = (char*)malloc_safe( strlen( right_code ) + strlen( left_code ) + code_size );
        snprintf( my_code, code_size, code_format, left_code, right_code );
      } else if( right ) {
        code_size = strlen( right_code ) + code_size;
        my_code   = (char*)malloc_safe( strlen( right_code ) + code_size );
        snprintf( my_code, code_size, code_format, right_code );
      } else if( left ) {
        code_size = strlen( left_code ) + code_size;
        my_code   = (char*)malloc_safe( strlen( left_code ) + code_size );
        snprintf( my_code, code_size, code_format, left_code );
      }

    }

    if( right_code != NULL ) {
      free_safe( right_code );
    }

    if( left_code != NULL ) {
      free_safe( left_code );
    }

  }

/*
  if( expr != NULL ) {
    printf( "%s, op: %d\n", my_code, SUPPL_OP( expr->suppl ) );
  }
*/

  return( my_code );

}


/* $Log$
/* Revision 1.8  2002/07/02 19:52:50  phase1geo
/* Removing unecessary diagnostics.  Cleaning up extraneous output and
/* generating new documentation from source.  Regression passes at the
/* current time.
/*
/* Revision 1.7  2002/07/02 18:42:18  phase1geo
/* Various bug fixes.  Added support for multiple signals sharing the same VCD
/* symbol.  Changed conditional support to allow proper simulation results.
/* Updated VCD parser to allow for symbols containing only alphanumeric characters.
/*
/* Revision 1.6  2002/06/27 21:18:48  phase1geo
/* Fixing report Verilog output.  simple.v verilog diagnostic now passes.
/*
/* Revision 1.5  2002/05/13 03:02:58  phase1geo
/* Adding lines back to expressions and removing them from statements (since the line
/* number range of an expression can be calculated by looking at the expression line
/* numbers).
/* */
