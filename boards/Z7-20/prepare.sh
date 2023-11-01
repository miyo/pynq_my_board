#!/bin/sh

mkdir -p petalinux_bsp/hardware_project

cp ../../fpga_base/Z7-20/myproj/design_1_wrapper.xsa petalinux_bsp/hardware_project
cp ../../fpga_base/Z7-20/myproj/design_1.tcl .
cp ../../fpga_base/Z7-20/myproj/project_1.runs/impl_1/design_1_wrapper.bit base.bit
cp ../../fpga_base/Z7-20/myproj/project_1.gen/sources_1/bd/design_1/hw_handoff/design_1.hwh .
