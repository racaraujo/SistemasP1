###############################################
# Example: counter.s
# Counter from 0 to 10000
###############################################

		.data
		.equ STARTVALUE, 0
		.equ STARTMAJOR, 0

counter:	.word STARTVALUE
counter2:	.word STARTMAJOR
word:		.asciz "Test string"

		.global main
		.text
		
		
main:		movia r8, counter #move o imediato (0) para o r8
		ldw r9, 0(r8) #lê do r8 pro r9
		addi r7, r0, 300 #define o limite no r7
		
		movia r5, counter2 #move o imediato para o r5
		ldw r6, 0(r5) #lê do r5 pro r6
		addi r4, r0, 10 #define o limite no r4
		

loop:		addi r9, r9, 1 #incrementa r9
		bne r9, r7, loop #compara se r9 chegou ao valor max. caso não, volta pro loop
		#stw r9, 0(r8) 
		br loop2
		
loop2:		addi r6, r6, 1
		movia r8, counter #move o imediato (0) para o r8
		ldw r9, 0(r8) #lê do r8 pro r9
		bne r4, r6, loop
		

		
		




