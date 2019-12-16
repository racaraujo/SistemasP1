# TCL File Generated by Component Editor 18.0
# Thu Dec 12 15:03:11 BRST 2019
# DO NOT MODIFY


# 
# initialize_lcd "lcd_initializer" v1.0
# Jictyvoo, Igor Garcia, Rafael Antonio 2019.12.12.15:03:11
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module initialize_lcd
# 
set_module_property DESCRIPTION ""
set_module_property NAME initialize_lcd
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR "Jictyvoo, Igor Garcia, Rafael Antonio"
set_module_property DISPLAY_NAME lcd_initializer
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL LCD_Initializer
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file initialize_lcd.v VERILOG PATH verilog/custom_instructions/initialize_lcd.v TOP_LEVEL_FILE


# 
# parameters
# 


# 
# display items
# 


# 
# connection point nios_custom_instruction_slave
# 
add_interface nios_custom_instruction_slave nios_custom_instruction end
set_interface_property nios_custom_instruction_slave clockCycle 0
set_interface_property nios_custom_instruction_slave operands 2
set_interface_property nios_custom_instruction_slave ENABLED true
set_interface_property nios_custom_instruction_slave EXPORT_OF ""
set_interface_property nios_custom_instruction_slave PORT_NAME_MAP ""
set_interface_property nios_custom_instruction_slave CMSIS_SVD_VARIABLES ""
set_interface_property nios_custom_instruction_slave SVD_ADDRESS_GROUP ""

add_interface_port nios_custom_instruction_slave dataa dataa Input 32


# 
# connection point conduit_end
# 
add_interface conduit_end conduit end
set_interface_property conduit_end associatedClock ""
set_interface_property conduit_end associatedReset ""
set_interface_property conduit_end ENABLED true
set_interface_property conduit_end EXPORT_OF ""
set_interface_property conduit_end PORT_NAME_MAP ""
set_interface_property conduit_end CMSIS_SVD_VARIABLES ""
set_interface_property conduit_end SVD_ADDRESS_GROUP ""

add_interface_port conduit_end lcd_data lcd_data Output 8


# 
# connection point nios_custom_instruction_slave_1
# 
add_interface nios_custom_instruction_slave_1 nios_custom_instruction end
set_interface_property nios_custom_instruction_slave_1 clockCycle 0
set_interface_property nios_custom_instruction_slave_1 operands 2
set_interface_property nios_custom_instruction_slave_1 ENABLED true
set_interface_property nios_custom_instruction_slave_1 EXPORT_OF ""
set_interface_property nios_custom_instruction_slave_1 PORT_NAME_MAP ""
set_interface_property nios_custom_instruction_slave_1 CMSIS_SVD_VARIABLES ""
set_interface_property nios_custom_instruction_slave_1 SVD_ADDRESS_GROUP ""

add_interface_port nios_custom_instruction_slave_1 datab datab Input 32


# 
# connection point nios_custom_instruction_slave_2
# 
add_interface nios_custom_instruction_slave_2 nios_custom_instruction end
set_interface_property nios_custom_instruction_slave_2 clockCycle 0
set_interface_property nios_custom_instruction_slave_2 operands 2
set_interface_property nios_custom_instruction_slave_2 ENABLED true
set_interface_property nios_custom_instruction_slave_2 EXPORT_OF ""
set_interface_property nios_custom_instruction_slave_2 PORT_NAME_MAP ""
set_interface_property nios_custom_instruction_slave_2 CMSIS_SVD_VARIABLES ""
set_interface_property nios_custom_instruction_slave_2 SVD_ADDRESS_GROUP ""

add_interface_port nios_custom_instruction_slave_2 done done Output 1


# 
# connection point nios_custom_instruction_slave_3
# 
add_interface nios_custom_instruction_slave_3 nios_custom_instruction end
set_interface_property nios_custom_instruction_slave_3 clockCycle 0
set_interface_property nios_custom_instruction_slave_3 operands 2
set_interface_property nios_custom_instruction_slave_3 ENABLED true
set_interface_property nios_custom_instruction_slave_3 EXPORT_OF ""
set_interface_property nios_custom_instruction_slave_3 PORT_NAME_MAP ""
set_interface_property nios_custom_instruction_slave_3 CMSIS_SVD_VARIABLES ""
set_interface_property nios_custom_instruction_slave_3 SVD_ADDRESS_GROUP ""

add_interface_port nios_custom_instruction_slave_3 result result Output 32


# 
# connection point conduit_end_1
# 
add_interface conduit_end_1 conduit end
set_interface_property conduit_end_1 associatedClock ""
set_interface_property conduit_end_1 associatedReset ""
set_interface_property conduit_end_1 ENABLED true
set_interface_property conduit_end_1 EXPORT_OF ""
set_interface_property conduit_end_1 PORT_NAME_MAP ""
set_interface_property conduit_end_1 CMSIS_SVD_VARIABLES ""
set_interface_property conduit_end_1 SVD_ADDRESS_GROUP ""

add_interface_port conduit_end_1 lcd_rw lcd_rw Output 1


# 
# connection point conduit_end_2
# 
add_interface conduit_end_2 conduit end
set_interface_property conduit_end_2 associatedClock ""
set_interface_property conduit_end_2 associatedReset ""
set_interface_property conduit_end_2 ENABLED true
set_interface_property conduit_end_2 EXPORT_OF ""
set_interface_property conduit_end_2 PORT_NAME_MAP ""
set_interface_property conduit_end_2 CMSIS_SVD_VARIABLES ""
set_interface_property conduit_end_2 SVD_ADDRESS_GROUP ""

add_interface_port conduit_end_2 lcd_rs lcd_rs Output 1


# 
# connection point nios_custom_instruction_slave_5
# 
add_interface nios_custom_instruction_slave_5 nios_custom_instruction end
set_interface_property nios_custom_instruction_slave_5 clockCycle 0
set_interface_property nios_custom_instruction_slave_5 operands 2
set_interface_property nios_custom_instruction_slave_5 ENABLED true
set_interface_property nios_custom_instruction_slave_5 EXPORT_OF ""
set_interface_property nios_custom_instruction_slave_5 PORT_NAME_MAP ""
set_interface_property nios_custom_instruction_slave_5 CMSIS_SVD_VARIABLES ""
set_interface_property nios_custom_instruction_slave_5 SVD_ADDRESS_GROUP ""

add_interface_port nios_custom_instruction_slave_5 clk_en clk_en Input 1


# 
# connection point nios_custom_instruction_slave_6
# 
add_interface nios_custom_instruction_slave_6 nios_custom_instruction end
set_interface_property nios_custom_instruction_slave_6 clockCycle 0
set_interface_property nios_custom_instruction_slave_6 operands 2
set_interface_property nios_custom_instruction_slave_6 ENABLED true
set_interface_property nios_custom_instruction_slave_6 EXPORT_OF ""
set_interface_property nios_custom_instruction_slave_6 PORT_NAME_MAP ""
set_interface_property nios_custom_instruction_slave_6 CMSIS_SVD_VARIABLES ""
set_interface_property nios_custom_instruction_slave_6 SVD_ADDRESS_GROUP ""

add_interface_port nios_custom_instruction_slave_6 start start Input 1


# 
# connection point conduit_end_3
# 
add_interface conduit_end_3 conduit end
set_interface_property conduit_end_3 associatedClock clock
set_interface_property conduit_end_3 associatedReset ""
set_interface_property conduit_end_3 ENABLED true
set_interface_property conduit_end_3 EXPORT_OF ""
set_interface_property conduit_end_3 PORT_NAME_MAP ""
set_interface_property conduit_end_3 CMSIS_SVD_VARIABLES ""
set_interface_property conduit_end_3 SVD_ADDRESS_GROUP ""

add_interface_port conduit_end_3 lcd_enable lcd_enable Output 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset reset Input 1


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1

