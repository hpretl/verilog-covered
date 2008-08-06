set cov_rb      Line
set last_cov_rb Line

proc cov_create {f} {

  global cov_rb file_name start_line end_line last_cov_rb

  # Create frame for the radio buttons
  frame $f.m -relief raised -borderwidth 1

  tk_optionMenu $f.m.metrics cov_rb Line Toggle Memory Logic FSM Assert

  trace add variable cov_rb write cov_change_metric

  # Pack radiobuttons
  pack $f.m.metrics

  # Create summary frame and widgets
  frame $f.s -relief raised -borderwidth 1
  label $f.s.l -text "Summary Information:"
  label $f.s.ht -width 45 -anchor w

  # Pack the summary frame
  pack $f.s.l  -side left
  pack $f.s.ht -side left -fill both

  # Pack the coverage box frame
  pack $f.m -side left -fill both
  pack $f.s -side left -fill both -expand yes

  # Pack the metric selection and summary frames into the current window
  pack $f -side top -fill both

}

proc cov_display_summary {hit total} {

  global cov_rb

  # Create summary information text
  if {$cov_rb == "Line"} {
    set info "$hit out of $total lines executed"
  } elseif {$cov_rb == "Toggle"} {
    set info "$hit out of $total signals fully toggled"
  } elseif {$cov_rb == "Memory"} {
    set info "$hit out of $total memories fully covered"
  } elseif {$cov_rb == "Logic"} {
    set info "$hit out of $total logical combinations hit"
  } elseif {$cov_rb == "FSM"} {
    if {$total == -1} {
      set info "$hit FSM state transitions hit"
    } else {
      set info "$hit out of $total FSM state transitions hit"
    }
  } elseif {$cov_rb == "Assert"} {
    set info "$hit out of $total assertion coverage points hit"
  } else {
    set info ""
  }

  # Display text to GUI
  if {$info != ""} {
    .covbox.s.ht configure -text $info
  }

}

proc cov_clear_summary {} {

  .covbox.s.ht configure -text ""

}

proc cov_change_metric args {

  global cdd_name cov_rb last_cov_rb

  if {$cdd_name != ""} {
    set text_x [.bot.right.txt xview]
    set text_y [.bot.right.txt yview]
    if {$last_cov_rb != $cov_rb} {
      set last_cov_rb $cov_rb
      populate_listbox
      if {$cov_rb == "Line"} {
        process_line_cov
      } elseif {$cov_rb == "Toggle"} {
        process_toggle_cov
      } elseif {$cov_rb == "Memory"} {
        process_memory_cov
      } elseif {$cov_rb == "Logic"} {
        process_comb_cov
      } elseif {$cov_rb == "FSM"} {
        process_fsm_cov
      } elseif {$cov_rb == "Assert"} {
        process_assert_cov
      }
      update_all_windows
    } else {
      if {$cov_rb == "Line"} {
        display_line_cov 
      } elseif {$cov_rb == "Toggle"} { 
        display_toggle_cov
      } elseif {$cov_rb == "Memory"} {
        display_memory_cov
      } elseif {$cov_rb == "Logic"} {
        display_comb_cov
      } elseif {$cov_rb == "FSM"} {
        display_fsm_cov
      } elseif {$cov_rb == "Assert"} {
        display_assert_cov
      }
    }
    .bot.right.txt xview moveto [lindex $text_x 0]
    .bot.right.txt yview moveto [lindex $text_y 0]
  }

}
