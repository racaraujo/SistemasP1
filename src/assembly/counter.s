###############################################
# Example: counter.s
# Counter from 0 to 10000
###############################################

		.data
		.equ STARTVALUE, 0
		.equ STARTMAJOR, 0

counter_1:	.word STARTVALUE
counter_2:	.word STARTMAJOR
word:		.asciz "Test string"

		.global main
		.text

###############################################
# Registradores usados | Valores representados
# r4                   | Limite do loop_2
# r5                   | Imediato 0
# r6                   | Contador do loop_2
# r7                   | Limite do loop_1
# r8                   | Imediato 0
# r9                   | Contador do loop_1
###############################################

main:		movia r8, counter_1 		# move o imediato (0) para o r8
		ldw r9, 0(r8) 			        # lê do r8 pro r9 (Limpa o registrador com zero)
		addi r7, r0, 300 		        # define o limite no r7
		
		movia r5, counter_2 		    # move o imediato para o r5
		ldw r6, 0(r5) 			        # lê do r5 pro r6 (Limpa o registrador com zero)
		addi r4, r0, 10 		        # define o limite no r4


# Looping para contar cerca de 1 segundo, após a contagem, passa para o loop_2
loop_1:		addi r9, r9, 1 			    # incrementa r9
		bne r9, r7, loop_1 		        # compara se r9 chegou ao valor max. caso não, volta pro loop
		br loop_2

# Looping para contar 10 segundos, chamado sempre que loop_1 acaba
loop_2:		addi r6, r6, 1
		movia r8, counter_1 	    	# move o imediato (0) para o r8
		ldw r9, 0(r8) 			        # lê do r8 pro r9
		bne r4, r6, loop_1
