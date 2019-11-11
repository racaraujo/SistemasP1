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
# r10                  | Número Aleatório
###############################################

main:		movia r8, counter_1 		# move o imediato (0) para o r8

random_call:	ldw r10, 0(r8) 			# l� do r8 pro r10(Limpa o registrador com zero)

xorshift:	addi r10, r9, 150
		slli r10, r10, 13		# shift left logical
		xorhi r10, r10, 13
		srli r10, r10, 7
		xorhi r10, r10, 11
		slli r10, r10, 5		# shift left logical
		br random_call