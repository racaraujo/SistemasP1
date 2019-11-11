###############################################
# Example: random.s
# Uses counter to take a number in the register and use it like a random
# Trying using xorshift
###############################################

		.data
		.equ STARTVALUE, 0
	
counter_1:	.word STARTVALUE
		.global main
		.text

###############################################
# Registradores usados | Valores representados
# r6                   | Contador do loop_2
# r9                   | Contador do loop_1
# r10                  | N�mero Aleat�rio
###############################################

main:		movia r8, counter_1 		# move o imediato (0) para o r8

random_call:	ldw r10, 0(r8) 			# l� do r8 pro r9 (Limpa o registrador com zero)

xorshift:	addi r10, r9, 0
		ldw r11, 0(r8) 			# l� do r8 pro r9 (Limpa o registrador com zero)
		addi r11, r0, 3			# define r11 como 3
		sll r10, r10, r11		# shift left logical
		xor r10, r10, r11
		addi r11, r0, 2			# define r11 como 5
		srl r10, r10, r11
		br random_call