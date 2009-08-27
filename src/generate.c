/*
 Copyright (c) 2006-2009 Trevor Williams

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by the Free Software
 Foundation; either version 2 of the License, or (at your option) any later version.

 This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 See the GNU General Public License for more details.

 You should have received a copy of the GNU General Public License along with this program;
 if not, write to the Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
*/

/*!
 \file     generate.c
 \author   Trevor Williams  (phase1geo@gmail.com)
 \date     8/9/2009
*/

#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "info.h"
#include "link.h"
#include "profiler.h"
#include "search.h"
#include "util.h"


/*! Name of top-level module to score */
char* top_module = NULL;

/*! Name of top-level instance name */
char* top_instance = NULL;

/*! Name of the coverage pragma to parse for */
char* pragma_coverage_name = NULL;

/*! Name of output score database file to generate */
static char* output_db = NULL;

/*! Specifies if -i option was specified */
bool instance_specified = FALSE;

/*! Specifies the user-supplied timescale information for VPI */
static char* timescale = NULL;

/*! Name of dumpvars output file to write contents to */
char* dumpvars_file = NULL;

/*! Name of preprocessor filename to use */
char* ppfilename = NULL;

/*! Name of VPI output file to write contents to */
static char* vpi_file = NULL;

/*! Value to use when a delay expression with min:typ:max */
int delay_expr_type = DELAY_EXPR_DEFAULT;

/*! Specifies if simulation performance information should be output */
static bool flag_display_sim_stats = FALSE;

/*! Specifies the supported global generation value */
unsigned int flag_global_generation = GENERATION_SV;

/*! Pointer to the head of the generation module list */
str_link* gen_mod_head = NULL;

/*! Pointer to the tail of the generation module list */
static str_link* gen_mod_tail = NULL;

/*!
 Holds the name of the file specified in a `line or \#line preprocessor directive.
*/
char* directive_filename = NULL;

/*!
 Specifies the depth that inlined combinational logic will be generated for.
*/
unsigned int inline_comb_depth = 0xffffffff;


/*!
 Displays usage information for score command.
*/
static void generate_usage() {

  printf( "\n" );
  printf( "Usage:  covered generate (-h | -t <top-level_module_name> [<options>])\n" );
  printf( "\n" );
  printf( "   -h                              Displays this help information.\n" );
  printf( "\n" );
  printf( "   Options:\n" );
  printf( "      -vpi (<name>)                Generates Verilog module called <name> which contains code to\n" );
  printf( "                                     allow Covered to run as a VPI during simulation.  If <name>\n" );
  printf( "                                     is not specified, the module file is called %s\n", DFLT_VPI_NAME );
  printf( "                                     If the -vcd option is specified along with this option, this\n" );
  printf( "                                     option will not be used.\n" );
  printf( "      -dumpvars (<name>)           Generates Verilog module called <name> which contains code to\n" );
  printf( "                                     dump only the signals in the design that are necessary for coverage\n" );
  printf( "                                     purposes.  If compiled as a top-module along with your design and no\n" );
  printf( "                                     other $dumpfile/$dumpvars calls are made, this dump module will provide\n" );
  printf( "                                     additional performance gains.  The name of the dumpfile created is called\n" );
  printf( "                                     <name>.vcd\n" );
  printf( "      -top_ts <timescale>          This option is only valid when the -vpi or -dumpvars options have been specified.\n" );
  printf( "                                     This option allows the user to specify a timescale for the generated\n" );
  printf( "                                     Verilog module.  If this option is not specified, no timescale will\n" );
  printf( "                                     be created for the generated module.  The value of <timescale> is\n" );
  printf( "                                     specified as follows:\n" );
  printf( "                                       (1|10|100)(s|ms|us|ns|ps|fs)/(1|10|100)(s|ms|us|ns|ps|fs)\n" );
  printf( "                                     If whitespace is needed between the various values, place the\n" );
  printf( "                                     entire contents of <timescale> in double quotes.\n" );
  printf( "      -i <instance_name>           Verilog hierarchical scope of top-level module to score.\n" );
  printf( "                                     Necessary if module to verify coverage is not the top-level\n" );
  printf( "                                     module in the design.  If not specified, -t value is used.\n" );
  printf( "      -o <database_filename>       Name of database to write coverage information to.\n" );
  printf( "      -I <directory>               Directory to find included Verilog files.\n" );
  printf( "      -f <filename>                Name of file containing additional arguments to parse.\n" );
  printf( "      -F <module>=(<ivar>,)<ovar>  Module, input state variable and output state variable of\n" );
  printf( "                                     an FSM state variable.  If input variable (ivar) is not specified,\n" );
  printf( "                                     the output variable (ovar) is also used as the input variable.\n" );
  printf( "      -A ovl                       Specifies that any OVL assertion found in the design should be\n" );
  printf( "                                     automatically included for assertion coverage.\n" );
  printf( "      -y <directory>               Directory to find unspecified Verilog files.\n" );
  printf( "      -v <filename>                Name of specific Verilog file to score.\n" );
  printf( "      -D <define_name>(=<value>)   Defines the specified name to 1 or the specified value.\n" );
  printf( "      -p <filename>                Specifies name of file to use for preprocessor output.\n" );
  printf( "      -P <parameter_scope>=<value> Performs a defparam on the specified parameter with value.\n" );
  printf( "      -T min|typ|max               Specifies value to use in delay expressions of the form min:typ:max.\n" );
  printf( "      -ts <number>                 If design is being scored, specifying this option will output\n" );
  printf( "                                     the current timestep (by increments of <number>) to standard output.\n" );
  printf( "      -S                           Outputs simulation performance information after scoring has completed.  This\n" );
  printf( "                                     information is currently only useful for the developers of Covered.\n" );
  printf( "      -g (<module>=)[1|2|3]        Selects generation of Verilog syntax that the parser will handle.  If\n" );
  printf( "                                     <module>= is present, only the specified module will use the provided\n" );
  printf( "                                     generation.  If <module>= is not specified, the entire design will use\n" );
  printf( "                                     the provided generation.  1=Verilog-1995, 2=Verilog-2001, 3=SystemVerilog\n" );
  printf( "                                     By default, the latest generation is parsed.\n" );
  printf( "      -cli (<filename>)            Causes the command-line debugger to be used during VCD/LXT dumpfile scoring.\n" );
  printf( "                                     If <filename> is specified, this file contains information saved in a previous\n" );
  printf( "                                     call to savehist on the CLI and causes the history contained in this file to be\n" );
  printf( "                                     replayed prior to the CLI command prompt.  If <filename> is not specified, the\n" );
  printf( "                                     CLI prompt will be immediately available at the start of simulation.  This option\n" );
  printf( "                                     is only available when Covered is configured with the --enable-debug option.\n" );
  printf( "      -Wignore                     Suppress the output of warnings during code parsing and simulation.\n" );
  printf( "\n" );
  printf( "      +libext+.<extension>(+.<extension>)+\n" );
  printf( "                                   Extensions of Verilog files to allow in scoring\n" );
  printf( "\n" );
  printf( "      -inline-metrics [l][t][m][e][c][f][a]  Specifies which coverage metrics should be inlined for scoring purposes.  Only these metrics\n" );
  printf( "                                               will be available for reporting and ranking.  l=line, t=toggle, m=memory, e=logic events,\n" );
  printf( "                                               c=combinational logic, f=FSM, a=assertions.  Default is ltmecfa.\n" );
  printf( "      -inline-comb-depth <value>             Specifies the depth in an expression tree that combinational logic coverage will be scored for.\n" );
  printf( "                                               By default, combinational logic depth is infinite.\n" );
  printf( "\n" );
  printf( "   Optimization Options:\n" );
  printf( "      -e <block_name>              Name of module, task, function or named begin/end block to not score.\n" );
  printf( "      -ec                          Exclude continuous assignment blocks from coverage.\n" );
  printf( "      -ea                          Exclude always blocks from coverage.\n" );
  printf( "      -ei                          Exclude initial blocks from coverage.\n" );
  printf( "      -ef                          Exclude final blocks from coverage.\n" );
  printf( "      -ep [<name>]                 Exclude all code enclosed by pragmas.  By default, the pragmas are of\n" );
  printf( "                                     the format '// coverage (on|off)'; however, if <name> is specified for\n" );
  printf( "                                     this option, the pragma keyword 'coverage' will be replaced with that value.\n" );
  printf( "\n" );
  printf( "    Note:\n" );
  printf( "      The top-level module specifies the module to begin scoring.  All\n" );
  printf( "      modules beneath this module in the hierarchy will also be scored\n" );
  printf( "      unless these modules are explicitly stated to not be scored using\n" );
  printf( "      the -e flag.\n" );
  printf( "\n" );

}

/*!
 Creates a directory.
*/
static void generate_create_dir(
  const char* dirname  /*!< Name of directory to create */
) { PROFILE(GENERATE_CREATE_DIR);

  /* Create the initial directory */
  /*@-shiftimplementation@*/
  if( mkdir( dirname, (S_IRWXU | S_IRWXG | S_IRWXO) ) != 0 ) {
  /*@=shiftimplementation@*/
    unsigned int rv = snprintf( user_msg, USER_MSG_LENGTH, "Unable to create \"%s\" directory", dirname );
    assert( rv < USER_MSG_LENGTH );
    print_output( user_msg, FATAL, __FILE__, __LINE__ );
    Throw 0;
  }

  PROFILE_END;

}

/*!
 Deletes the specified directory.
*/
static void generate_delete_dir(
  const char* dirname  /*!< Name of directory to delete */
) { PROFILE(GENERATE_DELETE_DIR);

  unsigned int rv = snprintf( user_msg, USER_MSG_LENGTH, "rm -rf %s", dirname );
  assert( rv < USER_MSG_LENGTH );

  if( system( user_msg ) != 0 ) {
    rv = snprintf( user_msg, USER_MSG_LENGTH, "Unable to remove \"%s\" directory", dirname );
    assert( rv < USER_MSG_LENGTH );
    print_output( user_msg, FATAL, __FILE__, __LINE__ );
    Throw 0;
  }

  PROFILE_END;

}

/*!
 Creates the base file system used to hold the database files.
*/
static void generate_create_file_system(
  const char* dirname  /*!< Base directory name */
) { PROFILE(GENERATE_CREATE_FILE_SYSTEM);

  unsigned int rv;

  /* Delete the coverage directory */
  if( directory_exists( dirname ) ) {
    generate_delete_dir( dirname );
  }

  Try {

    /* Create the initial directory */
    generate_create_dir( dirname );

    /* Create "verilog" directory */
    rv = snprintf( user_msg, USER_MSG_LENGTH, "%s/verilog", dirname );
    assert( rv < USER_MSG_LENGTH );
    generate_create_dir( user_msg );

    /* Create "db" directory */
    rv = snprintf( user_msg, USER_MSG_LENGTH, "%s/db", dirname );
    assert( rv < USER_MSG_LENGTH );
    generate_create_dir( user_msg );

    /* Create "cov" directory */
    rv = snprintf( user_msg, USER_MSG_LENGTH, "%s/cov", dirname );
    assert( rv < USER_MSG_LENGTH );
    generate_create_dir( user_msg );

    /* Create "cov/merged" directory */
    rv = snprintf( user_msg, USER_MSG_LENGTH, "%s/cov/merged", dirname );
    assert( rv < USER_MSG_LENGTH );
    generate_create_dir( user_msg );
  
    /* Create "cov/tests" directory */
    rv = snprintf( user_msg, USER_MSG_LENGTH, "%s/cov/tests", dirname );
    assert( rv < USER_MSG_LENGTH );
    generate_create_dir( user_msg );

  } Catch_anonymous {

    generate_delete_dir( dirname );
    Throw 0;

  }

  PROFILE_END;

}

/*!
 \throws anonymous Throw

 Creates a Verilog file that calls the Covered VPI system task.
*/
static void generate_top_vpi_module(
  const char* vpi_file,   /*!< Name of VPI module to create */
  const char* output_db,  /*!< Name of output CDD database file */
  const char* top_inst    /*!< Name of top-level instance */
) { PROFILE(GENERATE_TOP_VPI_MODULE);

  FILE* vfile;     /* File handle to VPI top-level module */
  char* mod_name;  /* Name of VPI module */
  char* ext;       /* Extension of VPI module */

  /* Extract the name of the module from the given filename */
  mod_name = strdup_safe( vpi_file );
  ext      = strdup_safe( vpi_file );
  scope_extract_front( vpi_file, mod_name, ext );

  Try {

    if( ext[0] != '\0' ) {

      if( (vfile = fopen( vpi_file, "w" )) != NULL ) {
 
        unsigned int rv;
        if( timescale != NULL ) {
          fprintf( vfile, "`timescale %s\n", timescale );
        }
        fprintf( vfile, "module %s;\ninitial $covered_sim( \"%s\", %s );\nendmodule\n", mod_name, output_db, top_inst );
        rv = fclose( vfile );
        assert( rv == 0 );

      } else {
 
        unsigned int rv = snprintf( user_msg, USER_MSG_LENGTH, "Unable to open %s for writing", vpi_file );
        assert( rv < USER_MSG_LENGTH );
        print_output( user_msg, FATAL, __FILE__, __LINE__ );
        Throw 0;

      }

    } else {

      print_output( "Specified -vpi filename did not contain a file extension", FATAL, __FILE__, __LINE__ );
      Throw 0;

    }

  } Catch_anonymous {
    free_safe( mod_name, (strlen( mod_name ) + 1) );
    free_safe( ext, (strlen( ext ) + 1) );
    Throw 0;
  }

  /* Deallocate memory */
  free_safe( mod_name, (strlen( vpi_file ) + 1) );
  free_safe( ext, (strlen( vpi_file ) + 1) );

  PROFILE_END;

}

/*!
 Parses the specified string containing the metrics to test.  If
 a legal metric character is found, its corresponding flag is set
 to TRUE.  If a character is found that does not correspond to a
 metric, an error message is flagged to the user (a warning).
*/
static void generate_parse_metrics(
  const char* metrics  /*!< Specified metrics to calculate coverage for */
) { PROFILE(GENERATE_PARSE_METRICS);

  const char* ptr;  /* Pointer to current character being evaluated */

  /* Set all flags to FALSE */
  info_suppl.part.scored_line   = 0;
  info_suppl.part.scored_toggle = 0;
  info_suppl.part.scored_memory = 0;
  info_suppl.part.scored_comb   = 0;
  info_suppl.part.scored_fsm    = 0;
  info_suppl.part.scored_assert = 0;
  info_suppl.part.scored_events = 0;

  for( ptr=metrics; ptr<(metrics + strlen( metrics )); ptr++ ) {

    switch( *ptr ) {
      case 'l' :
      case 'L' :  info_suppl.part.scored_line   = 1;  break;
      case 't' :
      case 'T' :  info_suppl.part.scored_toggle = 1;  break;
      case 'm' :
      case 'M' :  info_suppl.part.scored_memory = 1;  break;
      case 'c' :
      case 'C' :  info_suppl.part.scored_comb   = 1;  break;
      case 'f' :
      case 'F' :  info_suppl.part.scored_fsm    = 1;  break;
      case 'a' :
      case 'A' :  info_suppl.part.scored_assert = 1;  break;
      case 'e' :
      case 'E' :  info_suppl.part.scored_events = 1;  break;
      default  :
        {
          unsigned int rv = snprintf( user_msg, USER_MSG_LENGTH, "Unknown metric specified '%c'...  Ignoring.", *ptr );
          assert( rv < USER_MSG_LENGTH );
          print_output( user_msg, WARNING, __FILE__, __LINE__ );
        }
        break;
    }

  }

  PROFILE_END;

}

/*!
 \param def  Define value to parse

 Parses the specified define from the command-line, storing the define value in the
 define tree according to its value.
*/
void generate_parse_define(
  const char* def
) { PROFILE(GENERATE_PARSE_DEFINE);

  char* tmp = strdup_safe( def );  /* Temporary copy of the given argument */
  char* ptr = tmp;                 /* Pointer to current character in define */

  while( (*ptr != '\0') && (*ptr != '=') ) {
    ptr++;
  }

  if( *ptr == '=' ) {
    *ptr = '\0';
    ptr++;
    define_macro( tmp, ptr );
  } else {
    define_macro( tmp, "1" );
  }

  /* Deallocate memory */
  free_safe( tmp, (strlen( def ) + 1) );

}

/*!
 \param tab_file  Name of PLI tab file to create
 \param top_mod   Name of top-level module

 \throws anonymous Throw

 Creates a PLI table file.
*/
static void generate_pli_tab_file(
  const char* tab_file,
  const char* top_mod
) { PROFILE(GENERATE_PLI_TAB_FILE);

  FILE* tfile;     /* File handle of VPI tab file - only necessary for VCS */
  char* mod_name;  /* Name of VPI module */
  char* ext;       /* Extension of VPI module */

  /* Extract the name of the module from the given filename */
  mod_name = (char*)malloc_safe( strlen( tab_file ) + 5 );
  ext      = strdup_safe( tab_file );
  scope_extract_front( tab_file, mod_name, ext );

  Try {

    if( ext[0] != '\0' ) {

      strcat( mod_name, ".tab" );
      if( (tfile = fopen( mod_name, "w" )) != NULL ) {

        unsigned int rv;
        fprintf( tfile, "$covered_sim  call=covered_sim_calltf  acc+=r,cbk:%s+\n", top_mod );
        rv = fclose( tfile );
        assert( rv == 0 );

      } else {

        unsigned int rv = snprintf( user_msg, USER_MSG_LENGTH, "Unable to open %s for writing", mod_name );
        assert( rv < USER_MSG_LENGTH );
        print_output( user_msg, FATAL, __FILE__, __LINE__ );
        Throw 0;

      }

    } else {

      print_output( "Specified -vpi filename did not contain a file extension", FATAL, __FILE__, __LINE__ );
      Throw 0;

    }

  } Catch_anonymous {
    free_safe( mod_name, (strlen( mod_name ) + 1) );
    free_safe( ext, (strlen( ext ) + 1) );
    Throw 0;
  }

  /* Deallocate memory */
  free_safe( mod_name, (strlen( tab_file ) + 5) );
  free_safe( ext, (strlen( tab_file ) + 1) );

}

/*!
 \throws anonymous Throw

 Creates the dumpvars top-level module to use for dumping only needed portions of the design to the designated
 dumpfile.
*/
void generate_top_dumpvars_module(
  const char* dumpvars_file  /*!< Name of dumpvars file to create */
) { PROFILE(GENERATE_TOP_DUMPVARS_MODULE);

  FILE* vfile;     /* File handle to top-level module */
  char* mod_name;  /* Name of dumpvars module */
  char* ext;       /* Extension of dumpvars module */

  /* Extract the name of the module from the given filename */
  mod_name = strdup_safe( dumpvars_file );
  ext      = strdup_safe( dumpvars_file );
  scope_extract_front( dumpvars_file, mod_name, ext );

  Try {

    if( ext[0] != '\0' ) {

      if( (vfile = fopen( dumpvars_file, "w" )) != NULL ) {

        unsigned int rv;
        if( timescale != NULL ) {
          fprintf( vfile, "`timescale %s\n", timescale );
        }
        fprintf( vfile, "module %s;\n", mod_name );
        fprintf( vfile, "initial begin\n" );
        fprintf( vfile, "  $dumpfile( \"%s.vcd\" );\n", mod_name );
        db_output_dumpvars( vfile );
        fprintf( vfile, "end\n" );
        fprintf( vfile, "endmodule\n" );
        rv = fclose( vfile );
        assert( rv == 0 );

      } else {

        unsigned int rv = snprintf( user_msg, USER_MSG_LENGTH, "Unable to open %s for writing", dumpvars_file );
        assert( rv < USER_MSG_LENGTH );
        print_output( user_msg, FATAL, __FILE__, __LINE__ );
        Throw 0;

      }

    } else {

      print_output( "Specified -dumpvars filename did not contain a file extension", FATAL, __FILE__, __LINE__ );
      Throw 0;

    }

  } Catch_anonymous {
    free_safe( mod_name, (strlen( mod_name ) + 1) );
    free_safe( ext, (strlen( ext ) + 1) );
    Throw 0;
  }

  /* Deallocate memory */
  free_safe( mod_name, (strlen( dumpvars_file ) + 1) );
  free_safe( ext, (strlen( dumpvars_file ) + 1) );

  PROFILE_END;

}

/*!
 \return Returns TRUE if the help option was parsed.

 \throws anonymous search_add_directory_path Throw Throw Throw Throw Throw Throw Throw Throw Throw Throw Throw Throw
                   Throw Throw Throw Throw Throw Throw Throw Throw Throw Throw generate_parse_args ovl_add_assertions_to_no_score_list
                   fsm_arg_parse read_command_file search_add_file defparam_add search_add_extensions search_add_no_score_funit

 Parses score command argument list and performs specified functions based
 on these arguments.
*/
static bool generate_parse_args(
  int          argc,      /*!< Number of arguments specified in argv parameter list */
  int          last_arg,  /*!< Index of last parsed argument in list */
  const char** argv       /*!< List of arguments to parse */
) { PROFILE(GENERATE_PARSE_ARGS);

  int   i          = last_arg + 1;  /* Loop iterator */
  int   j;                          /* Loop iterator */
  char* ptr;                        /* Pointer to current character in defined value */
  char* rv;                         /* Return value from snprintf calls */
  bool  help_found = FALSE;

  while( (i < argc) && !help_found ) {

    if( strncmp( "-h", argv[i], 2 ) == 0 ) {

      generate_usage();
      help_found = TRUE;

    } else if( strncmp( "-inline-comb-depth", argv[i], 18 ) == 0 ) {

      if( check_option_value( argc, argv, i ) ) {
        i++;
        inline_comb_depth = atoi( argv[i] );
        if( inline_comb_depth <= 0 ) {
          inline_comb_depth = 0xffffffff;
        }
      } else {
        Throw 0;
      }

    } else if( strncmp( "-inline-metrics", argv[i], 15 ) == 0 ) {

      if( check_option_value( argc, argv, i ) ) {
        i++;
        generate_parse_metrics( argv[i] );
      } else {
        Throw 0;
      }

    } else if( strncmp( "-i", argv[i], 2 ) == 0 ) {

      if( check_option_value( argc, argv, i ) ) {
        i++;
        if( instance_specified ) {
          print_output( "Only one -i option may be present on the command-line.  Using first value...", WARNING, __FILE__, __LINE__ );
        } else {
          top_instance       = strdup_safe( argv[i] );
          generate_add_args( argv[i-1], argv[i] );
          instance_specified = TRUE;
        }
      } else {
        Throw 0;
      }

    } else if( strncmp( "-o", argv[i], 2 ) == 0 ) {
        
      if( check_option_value( argc, argv, i ) ) {
        i++;
        if( output_db != NULL ) {
          print_output( "Only one -o option may be present on the command-line.  Using first value...", WARNING, __FILE__, __LINE__ );
        } else {
          output_db = strdup_safe( argv[i] );
          generate_add_args( argv[i-1], argv[i] );
        }
      } else {   
        Throw 0; 
      }
                 
    } else if( strncmp( "-t", argv[i], 2 ) == 0 ) {
          
      if( check_option_value( argc, argv, i ) ) {
        i++;
        if( top_module != NULL ) {
          print_output( "Only one -t option may be present on the command-line.  Using first value...", WARNING, __FILE__, __LINE__ );
        } else {
          if( is_variable( argv[i] ) ) {
            top_module = strdup_safe( argv[i] );
            generate_add_args( argv[i-1], argv[i] ); 
          } else {
            unsigned int rv = snprintf( user_msg, USER_MSG_LENGTH, "Illegal top-level module name specified \"%s\"", argv[i] );
            assert( rv < USER_MSG_LENGTH );
            print_output( user_msg, FATAL, __FILE__, __LINE__ );
            Throw 0;
          }
        } 
      } else {
        Throw 0;
      }   
            
    } else if( strncmp( "-I", argv[i], 2 ) == 0 ) {
            
      if( check_option_value( argc, argv, i ) ) {
        i++;
        search_add_include_path( argv[i] );
        generate_add_args( argv[i-1], argv[i] );
      } else {
        Throw 0;
      }
    
    } else if( strncmp( "-y", argv[i], 2 ) == 0 ) {
      
      if( check_option_value( argc, argv, i ) ) {
        i++;
        search_add_directory_path( argv[i] );
        generate_add_args( argv[i-1], argv[i] );
      } else {
        Throw 0;
      } 
      
    } else if( strncmp( "-F", argv[i], 2 ) == 0 ) {
      
      if( check_option_value( argc, argv, i ) ) {
        i++;
        fsm_arg_parse( argv[i] );
        generate_add_args( argv[i-1], argv[i] );
      } else {
        Throw 0;
      }

    } else if( strncmp( "-f", argv[i], 2 ) == 0 ) {
      
      if( check_option_value( argc, argv, i ) ) {
        char** arg_list = NULL;
        int    arg_num  = 0;
        i++;
        Try {
          read_command_file( argv[i], &arg_list, &arg_num );
          help_found = generate_parse_args( arg_num, -1, (const char**)arg_list );
        } Catch_anonymous {
          for( j=0; j<arg_num; j++ ) {
            free_safe( arg_list[j], (strlen( arg_list[j] ) + 1) );
          }
          free_safe( arg_list, (sizeof( char* ) * arg_num) );
          Throw 0;
        } 
        for( j=0; j<arg_num; j++ ) {
          free_safe( arg_list[j], (strlen( arg_list[j] ) + 1) );
        }   
        free_safe( arg_list, (sizeof( char* ) * arg_num) );
      } else {
        Throw 0;
      } 
        
    } else if( strncmp( "-ec", argv[i], 3 ) == 0 ) {
        
      info_suppl.part.excl_assign = 1; 
      generate_add_args( argv[i], NULL );
      
    } else if( strncmp( "-ea", argv[i], 3 ) == 0 ) {
        
      info_suppl.part.excl_always = 1;
      generate_add_args( argv[i], NULL );
        
    } else if( strncmp( "-ei", argv[i], 3 ) == 0 ) {
    
      info_suppl.part.excl_init = 1;
      generate_add_args( argv[i], NULL );
      
    } else if( strncmp( "-ef", argv[i], 3 ) == 0 ) {
        
      info_suppl.part.excl_final = 1;
      generate_add_args( argv[i], NULL );
        
    } else if( strncmp( "-ep", argv[i], 3 ) == 0 ) {

      info_suppl.part.excl_pragma = 1; 
      generate_add_args( argv[i], NULL );
      if( ((i+1) < argc) && (argv[i+1][0] != '-') ) {
        i++;
        pragma_coverage_name = strdup_safe( argv[i] );
        generate_add_args( argv[i], NULL );
      } else {
        pragma_coverage_name = strdup_safe( "coverage" );
      }

    } else if( strncmp( "-e", argv[i], 2 ) == 0 ) {

      if( check_option_value( argc, argv, i ) ) {
        i++;
        search_add_no_score_funit( argv[i] );
        generate_add_args( argv[i-1], argv[i] );
      } else {
        Throw 0;
      }

    } else if( strncmp( "-top_ts", argv[i], 7 ) == 0 ) {

      if( check_option_value( argc, argv, i ) ) {
        i++;
        if( timescale != NULL ) {
          print_output( "Only one -top_ts option is allowed on the score command-line.  Using first value...", WARNING, __FILE__, __LINE__ );
          if( (i == argc) || (argv[i][0] == '-') ) {
            i--;
          }
        } else {
          process_timescale( argv[i], FALSE );
          timescale = strdup_safe( argv[i] );
          generate_add_args( argv[i-1], argv[i] );
        }
      } else {
        Throw 0;
      }

    } else if( strncmp( "-vpi", argv[i], 4 ) == 0 ) {

      i++;
      if( vpi_file != NULL ) {
        print_output( "Only one -vpi option is allowed on the score command-line.  Using first value...", WARNING, __FILE__, __LINE__ );
        if( (i == argc) || (argv[i][0] == '-') ) {
          i--;
        }
      } else {
        if( (i < argc) && (argv[i][0] != '-') ) {
          vpi_file = strdup_safe( argv[i] );
          generate_add_args( argv[i-1], argv[i] );
        } else {
          vpi_file = strdup_safe( DFLT_VPI_NAME );
          i--;
          generate_add_args( argv[i], NULL );
        }
      }

    } else if( strncmp( "-dumpvars", argv[i], 9 ) == 0 ) {

      i++;
      if( dumpvars_file != NULL ) {
        print_output( "Only one -dumpvars option is allowed on the score command-line.  Using first value...", WARNING, __FILE__, __LINE__ );
        if( (i == argc) || (argv[i][0] == '-') ) {
          i--;
        }
      } else {
        if( (i < argc) && (argv[i][0] != '-') ) {
          dumpvars_file = strdup_safe( argv[i] );
          generate_add_args( argv[i-1], argv[i] );
        } else {
          dumpvars_file = strdup_safe( DFLT_DUMPVARS_NAME );
          i--;
          generate_add_args( argv[i], NULL );
        }
      }

    } else if( strncmp( "-v", argv[i], 2 ) == 0 ) {

      if( check_option_value( argc, argv, i ) ) {
        i++;
        search_add_file( argv[i] );
        generate_add_args( argv[i-1], argv[i] );
      } else {
        Throw 0;
      }

    } else if( strncmp( "+libext+", argv[i], 8 ) == 0 ) {

      search_add_extensions( argv[i] + 8 );
      generate_add_args( argv[i], NULL );

    } else if( strncmp( "-D", argv[i], 2 ) == 0 ) {

      if( check_option_value( argc, argv, i ) ) { 
        i++;
        generate_parse_define( argv[i] );
        generate_add_args( argv[i-1], argv[i] );
      } else {
        Throw 0;
      }   
        
    } else if( strncmp( "-p", argv[i], 2 ) == 0 ) {
        
      if( check_option_value( argc, argv, i ) ) {
        i++;
        if( ppfilename != NULL ) {
          print_output( "Only one -p option is allowed on the score command-line.  Using first value...", WARNING, __FILE__, __LINE__ );
        } else {
          if( is_variable( argv[i] ) ) {
            ppfilename = strdup_safe( argv[i] );
            generate_add_args( argv[i-1], argv[i] );
          } else {
            unsigned int rv = snprintf( user_msg, USER_MSG_LENGTH, "Unrecognizable filename %s specified for -p option.", argv[i] );
            assert( rv < USER_MSG_LENGTH );
            print_output( user_msg, FATAL, __FILE__, __LINE__ );
            Throw 0;
          }
        }
      } else {
        Throw 0;
      }
    
    } else if( strncmp( "-P", argv[i], 2 ) == 0 ) { 

      if( check_option_value( argc, argv, i ) ) {
        char* tmp = strdup_safe( argv[i+1] );
        Try {
          i++;
          ptr = tmp;
          while( (*ptr != '\0') && (*ptr != '=') ) {
            ptr++;
          }
          if( *ptr == '\0' ) {
            print_output( "Option -P must specify a value to assign.  See \"covered score -h\" for more information.",
                          FATAL, __FILE__, __LINE__ );
            Throw 0;
          } else {
            vector* vec;
            int     base;
            generate_add_args( argv[i-1], argv[i] );
            *ptr = '\0';
            ptr++;
            vector_from_string( &ptr, FALSE, &vec, &base );
            if( vec == NULL ) {
              unsigned int rv = snprintf( user_msg, USER_MSG_LENGTH, "Unable to parse value for option -P %s=%s", tmp, ptr );
              assert( rv < USER_MSG_LENGTH );
              print_output( user_msg, FATAL, __FILE__, __LINE__ );
              Throw 0;
            }
            defparam_add( tmp, vec );
          }
        } Catch_anonymous {
          free_safe( tmp, (strlen( argv[i] ) + 1) );
          Throw 0;
        }
        free_safe( tmp, (strlen( argv[i] ) + 1) );
      } else {
        Throw 0;
      }

    } else if( strncmp( "-T", argv[i], 2 ) == 0 ) {
      
      if( check_option_value( argc, argv, i ) ) {
        i++;
        if( delay_expr_type != DELAY_EXPR_DEFAULT ) {
          print_output( "Only one -T option is allowed on the score command-line.  Using first value...", WARNING, __FILE__, __LINE__ );
        } else {
          if( strcmp( argv[i], "min" ) == 0 ) {
            delay_expr_type = DELAY_EXPR_MIN;
            generate_add_args( argv[i-1], argv[i] );
          } else if( strcmp( argv[i], "max" ) == 0 ) {
            delay_expr_type = DELAY_EXPR_MAX;
            generate_add_args( argv[i-1], argv[i] ); 
          } else if( strcmp( argv[i], "typ" ) == 0 ) {
            delay_expr_type = DELAY_EXPR_TYP;
            generate_add_args( argv[i-1], argv[i] );
          } else {
            unsigned int rv = snprintf( user_msg, USER_MSG_LENGTH, "Unknown -T value (%s).  Please specify min, max or typ.", argv[i] );
            assert( rv < USER_MSG_LENGTH );
            print_output( user_msg, FATAL, __FILE__, __LINE__ );
            Throw 0;
          } 
        }   
      } else {
        Throw 0;
      }       
              
    } else if( strncmp( "-S", argv[i], 2 ) == 0 ) {

      flag_display_sim_stats = TRUE;
      generate_add_args( argv[i], NULL );

    } else if( strncmp( "-A", argv[i], 2 ) == 0 ) {
        
      if( check_option_value( argc, argv, i ) ) {
        i++;  
        if( strncmp( argv[i], "ovl", 3 ) == 0 ) { 
          info_suppl.part.assert_ovl = 1;
          define_macro( "OVL_VERILOG",  "1" );
          define_macro( "OVL_COVER_ON", "1" );    
          generate_add_args( argv[i-1], argv[i] );
        } else {  
          unsigned int rv = snprintf( user_msg, USER_MSG_LENGTH, "Unknown -A value (%s).  Please specify ovl.", argv[i] );
          assert( rv < USER_MSG_LENGTH );
          print_output( user_msg, FATAL, __FILE__, __LINE__ );
          Throw 0;
        } 
      } else {
        Throw 0;
      } 
          
    } else if( strncmp( "-g", argv[i], 2 ) == 0 ) {
          
      int  generation;
      char tmp[256];
          
      if( check_option_value( argc, argv, i ) ) {
        i++;
        if( argv[i][(strlen( argv[i] ) - 1)] == '1' ) {
          generation = GENERATION_1995;
        } else if( argv[i][(strlen( argv[i] ) - 1)] == '2' ) {
          generation = GENERATION_2001;
        } else if( argv[i][(strlen( argv[i] ) - 1)] == '3' ) {
          generation = GENERATION_SV;
        } else {
          unsigned int rv = snprintf( user_msg, USER_MSG_LENGTH, "Unknown generation value '%c'.  Legal values are 1, 2 or 3.", argv[i][(strlen( argv[i] ) - 1)] );
          assert( rv < USER_MSG_LENGTH );
          print_output( user_msg, FATAL, __FILE__, __LINE__ );
          Throw 0;
        }
        if( strlen( argv[i] ) == 1 ) {
          flag_global_generation = generation;
        } else {
          strcpy( tmp, argv[i] );
          if( tmp[(strlen( tmp ) - 2)] == '=' ) {
            str_link* strl;
            tmp[(strlen( tmp ) - 2)] = '\0';
            strl        = str_link_add( strdup_safe( tmp ), &gen_mod_head, &gen_mod_tail );
            strl->suppl = generation;
          } else {
            unsigned int rv = snprintf( user_msg, USER_MSG_LENGTH, "Illegal -g syntax \"%s\".  See \"covered score -h\" for correct syntax.", tmp );
            assert( rv < USER_MSG_LENGTH );
            print_output( user_msg, FATAL, __FILE__, __LINE__ );
            Throw 0;
          }
        }
        generate_add_args( argv[i-1], argv[i] );
      } else {
        Throw 0;
      }

    } else if( strncmp( "-Wignore", argv[i], 8 ) == 0 ) {
        
      warnings_suppressed = TRUE;
      
    } else {

      unsigned int rv = snprintf( user_msg, USER_MSG_LENGTH, "Unknown score command option \"%s\".  See \"covered score -h\" for more information.", argv[i] );
      assert( rv < USER_MSG_LENGTH );
      print_output( user_msg, FATAL, __FILE__, __LINE__ );
      Throw 0;

    }

    i++;

  }

  if( !help_found ) {

    /* If the -A option was not specified, add all OVL modules to list of no-score modules */
    ovl_add_assertions_to_no_score_list( info_suppl.part.assert_ovl );

    /* Get the current directory */
    rv = getcwd( score_run_path, 4096 );
    assert( rv != NULL );

  }

  return( help_found );

}

/*!
 Parses the 'generate' command-line options, creates the design database, generated Verilog code
 and empty coverage file.
*/
void command_generate(
  int          argc,      /*!< Number of arguments in score command-line */
  int          last_arg,  /*!< Index of last parsed argument in list */
  const char** argv       /*!< Arguments from command-line to parse */
) { PROFILE(COMMAND_GENERATE);

  unsigned int rv;  /* Return value from snprintf calls */
  bool         error = FALSE;

  /* Output header information */
  rv = snprintf( user_msg, USER_MSG_LENGTH, COVERED_HEADER );
  assert( rv < USER_MSG_LENGTH );
  print_output( user_msg, NORMAL, __FILE__, __LINE__ );

  Try {

    /* Create a database to start storing the results */
    (void)db_create();

    /* Initialize the "scored" bits */
    info_suppl.part.scored_line   = 1;
    info_suppl.part.scored_toggle = 1;
    info_suppl.part.scored_memory = 1;
    info_suppl.part.scored_comb   = 1;
    info_suppl.part.scored_fsm    = 1;
    info_suppl.part.scored_assert = 1;
    info_suppl.part.scored_events = 1;

    /* Parse score command-line */
    if( !generate_parse_args( argc, last_arg, argv ) ) {

      /* If the user did not specify an output database directory name, use the default */
      if( output_db == NULL ) {
        output_db = strdup_safe( DFLT_OUTPUT_CDD );
      }

      /* Create a filesystem for the database */
      generate_create_file_system( output_db );

      /* Parse design */
      if( use_files_head != NULL ) {
        print_output( "Reading design...", NORMAL, __FILE__, __LINE__ );
        search_init();
        parse_design( top_module, output_db );
        print_output( "", NORMAL, __FILE__, __LINE__ );
      }

      /* Generate VPI-based top module */
      if( vpi_file != NULL ) {
    
        rv = snprintf( user_msg, USER_MSG_LENGTH, "Outputting VPI file %s...", vpi_file );
        assert( rv < USER_MSG_LENGTH );
        print_output( user_msg, NORMAL, __FILE__, __LINE__ );
        generate_top_vpi_module( vpi_file, output_db, top_instance );
        generate_pli_tab_file( vpi_file, top_module );

      } 
        
      /*@-duplicatequals -formattype@*/
      rv = snprintf( user_msg, USER_MSG_LENGTH, "Dynamic memory allocated:   %llu bytes", largest_malloc_size );
      assert( rv < USER_MSG_LENGTH );
      /*@=duplicatequals =formattype@*/
      print_output( user_msg, NORMAL, __FILE__, __LINE__ );
      print_output( "", NORMAL, __FILE__, __LINE__ ); 
                 
      /* Display simulation statistics if specified */
      if( flag_display_sim_stats ) {
        perf_output_inst_report( stdout );
      }

    } 
        
  } Catch_anonymous {
    error = TRUE;
  }   
      
  /* Close database */
  db_close();
        
  /* Deallocate memory for search engine */ 
  search_free_lists();

  /* Deallocate memory for defparams */
  defparam_dealloc();

  /* Deallocate memory for system tasks */
  sys_task_dealloc();

  /* Deallocate generation module string list */
  str_link_delete_list( gen_mod_head );

  free_safe( output_db, (strlen( output_db ) + 1) );
  free_safe( vpi_file, (strlen( vpi_file ) + 1) );
  free_safe( dumpvars_file, (strlen( dumpvars_file ) + 1) );
  free_safe( top_module, (strlen( top_module ) + 1) );
  free_safe( ppfilename, (strlen( ppfilename ) + 1) );
  ppfilename = NULL;

  free_safe( directive_filename, (strlen( directive_filename ) + 1) );
  free_safe( top_instance, (strlen( top_instance ) + 1) );
  free_safe( timescale, (strlen( timescale ) + 1) );
  free_safe( pragma_coverage_name, (strlen( pragma_coverage_name ) + 1) );

  if( error ) {
    Throw 0; 
  }

  PROFILE_END;

}
