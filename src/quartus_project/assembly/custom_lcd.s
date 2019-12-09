###############################################
# Name: custom_lcd.s
# Uses counter to take a number in the register and use it like a random
# Trying using xorshift
###############################################

				.data
				.equ STARTVALUE, 0
				.equ COUNTER_INPUT, 0x2030 #address for counter
	
counter_1:		.word STARTVALUE
				.global main
				.text

###############################################
# Registradores usados | Valores representados
# r6                   | Contador do loop_1
###############################################

main:			custom 0, r7, r7, r7

