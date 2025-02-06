# Custom build scripts for PYNQ

## Target

- Zybo Z7-20 (available for Zybo Z7-10)
- Zedboard
  - to make Ethernet available
- ZCU111
  - to add wp-disable into the device-tree
- ZCU106
  - to build with default BSP provieded by Xilinx

## Assumed Environment

- PYNQ v 3.0.1
- Vivado 2022.1.2
  - Required board files for Vivado
    - cf. https://github.com/Digilent/vivado-boards
- PetaLinux 2022.1

## Build FPGA bit-files

See [fpga_base](./fpga_base)

To build each of FGPA resources, execute `vivado -mode batch -source ./build.tcl` under the directory.

## Board files for PYNQ

See [boards](./boards)
