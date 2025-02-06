# ZCU106

## Requirements

- Ubuntu 20.04
- Vivado 2022.1
- petalinux 2022.1
- ZCU106 BSP
  - cf. https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/embedded-design-tools.html
  - https://www.xilinx.com/member/forms/download/xef.html?filename=xilinx-zcu106-v2022.1-04191534.bsp
  - extract bsp to get 
    - `xilinx-zcu106-2022.1/hardware/xilinx-zcu106-2022.1/xilinx-zcu106-2022.1.runs/impl_1/zcu106_1_wrapper.bit`
- pynq_sdist.tar.gz and pynq_rootfs.aarc64.tar.gz
  - https://www.pynq.io/boards.html
  - https://bit.ly/pynq_sdist_v3_0_1
  - https://bit.ly/pynq_aarch64_v3_0_1

## Recommendation for host PC

Since the buidling step takes long time and requires frequent `sudo` execution, I recommend setting the `NOPASSWD:` option to enable `sudo` without a password by adding the entry in `/etc/sudoers`.

```
miyo    ALL=(ALL:ALL) NOPASSWD: ALL
```

Note that the parameters in `/etc/sudoers` are overridden line by line. Therefore, the new entry should be added at the bottom of the file.

## setup PYNQ

```
$ cd $HOME
$ git clone https://github.com/Xilinx/PYNQ.git
$ PYNQ/sdbuild/scripts/setup_host.sh
$ cp pynq_sdist.tar.gz PYNQ/sdbuild/prebuilt/pynq_sdist.tar.gz
$ cp pynq_rootfs.aarch64.tar.gz PYNQ/sdbuild/prebuilt/pynq_rootfs.aarch64.tar.gz
```

## setup board files

```
$ cd $HOME
$ git clone https://github.com/miyo/pynq_my_board
$ cp -r pynq_my_board/boards/ZCU106 PYNQ/boards/
$ cp xilinx-zcu106-v2022.1-04191534.bsp PYNQ/boards/
$ cp zcu106_1_wrapper.bit PYNQ/boards/base.bit
```

## Build

```
$ cd PYNQ/sdbuild/
$ make BOARDS=ZCU106
```

After the building process, you will get `output/ZCU106-3.0.1.img`.
