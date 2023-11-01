source ./design_1.tcl

set project_dir "myproj"; # cf. design_1.tcl

make_wrapper -files [get_files ./myproj/project_1.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse ./myproj/project_1.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v

update_compile_order -fileset sources_1

update_compile_order -fileset sources_1

reset_project

launch_runs synth_1 -jobs 8
wait_on_run synth_1

launch_runs impl_1 -jobs 8
wait_on_run impl_1

open_run impl_1
report_utilization -file [file join $project_dir "project.rpt"]
report_timing -file [file join $project_dir "project.rpt"] -append

launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

write_hw_platform -fixed -include_bit -force -file ./myproj/design_1_wrapper.xsa

open_bd_design {./myproj/project_1.srcs/sources_1/bd/design_1/design_1.bd}
write_bd_tcl -force ./myproj/design_1.tcl

close_project

quit

