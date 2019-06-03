connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Nexys4 210274505292A" && level==0} -index 0
fpga -file D:/aulas/cr/projects/p09/project/project.sdk/design_1_wrapper_hw_platform_0/design_1_wrapper.bit
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Nexys4 210274505292A"} -index 0
rst -system
after 3000
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Nexys4 210274505292A"} -index 0
dow D:/aulas/cr/projects/p09/project/project.sdk/First/Debug/First.elf
targets -set -nocase -filter {name =~ "microblaze*#0" && bscan=="USER2"  && jtag_cable_name =~ "Digilent Nexys4 210274505292A"} -index 0
con
