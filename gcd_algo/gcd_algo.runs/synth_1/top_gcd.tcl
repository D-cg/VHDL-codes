# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/usuario/gcd_algo/gcd_algo.cache/wt [current_project]
set_property parent.project_path C:/Users/usuario/gcd_algo/gcd_algo.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.2 [current_project]
set_property ip_output_repo c:/Users/usuario/gcd_algo/gcd_algo.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/usuario/gcd_algo/gcd_algo.srcs/sources_1/new/X7seg.vhd
  C:/Users/usuario/gcd_algo/gcd_algo.srcs/sources_1/new/gcd_algorithm.vhd
  C:/Users/usuario/gcd_algo/gcd_algo.srcs/sources_1/new/debounce.vhd
  C:/Users/usuario/gcd_algo/gcd_algo.srcs/sources_1/new/clk_pulse.vhd
  C:/Users/usuario/gcd_algo/gcd_algo.srcs/sources_1/new/clk_divisor.vhd
  C:/Users/usuario/gcd_algo/gcd_algo.srcs/sources_1/new/top_gcd.vhd
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

synth_design -top top_gcd -part xc7a35tcpg236-1


write_checkpoint -force -noxdef top_gcd.dcp

catch { report_utilization -file top_gcd_utilization_synth.rpt -pb top_gcd_utilization_synth.pb }
