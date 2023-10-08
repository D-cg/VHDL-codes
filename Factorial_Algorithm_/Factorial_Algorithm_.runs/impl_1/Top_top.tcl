proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7a35tcpg236-1
  set_property board_part digilentinc.com:basys3:part0:1.2 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/Users/usuario/Factorial_Algorithm_/Factorial_Algorithm_.cache/wt [current_project]
  set_property parent.project_path C:/Users/usuario/Factorial_Algorithm_/Factorial_Algorithm_.xpr [current_project]
  set_property ip_output_repo C:/Users/usuario/Factorial_Algorithm_/Factorial_Algorithm_.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  add_files -quiet C:/Users/usuario/Factorial_Algorithm_/Factorial_Algorithm_.runs/synth_1/Top_top.dcp
  read_xdc C:/Users/usuario/Factorial_Algorithm_/Factorial_Algorithm_.srcs/constrs_1/imports/Downloads/Basys-3-Master.xdc
  link_design -top Top_top -part xc7a35tcpg236-1
  write_hwdef -file Top_top.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force Top_top_opt.dcp
  catch { report_drc -file Top_top_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force Top_top_placed.dcp
  catch { report_io -file Top_top_io_placed.rpt }
  catch { report_utilization -file Top_top_utilization_placed.rpt -pb Top_top_utilization_placed.pb }
  catch { report_control_sets -verbose -file Top_top_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Top_top_routed.dcp
  catch { report_drc -file Top_top_drc_routed.rpt -pb Top_top_drc_routed.pb -rpx Top_top_drc_routed.rpx }
  catch { report_methodology -file Top_top_methodology_drc_routed.rpt -rpx Top_top_methodology_drc_routed.rpx }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file Top_top_timing_summary_routed.rpt -rpx Top_top_timing_summary_routed.rpx }
  catch { report_power -file Top_top_power_routed.rpt -pb Top_top_power_summary_routed.pb -rpx Top_top_power_routed.rpx }
  catch { report_route_status -file Top_top_route_status.rpt -pb Top_top_route_status.pb }
  catch { report_clock_utilization -file Top_top_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force Top_top_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

