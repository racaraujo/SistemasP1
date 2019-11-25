###############################################
# Example: ledbasic.s
# Animate the led by turning on one led at a
# time
###############################################

			.data
			.equ LEDADDR, 0x810
			.equ STARTMAJOR, 0
			.equ ONE, 1

counter:	.word STARTMAJOR
			.word ONE
			.global main
			.text

###############################################
# Registradores usados | Valores representados
# r4                   | Limite máximo do loop
# r5                   | Imedito com valor 0
# r6                   | Contador do delay
# r8                   | Contador do loop
# r9                   | Endereço da LED saída
# r10                  | Tamanho do bloco
# r11                  | Para uso temporário
# r12                  | Valor de soma
###############################################

###############################################
# Sequencia dos LEDs   | Valor do registrador
# 0000                 | 0x11111110   - 00
# 0001                 | 0x11111118   - 08
# 0011                 | 0x1111111c   - 12
# 0111                 | 0x1111111e   - 14
# 1111                 | 0x1111111f   - 15
# 1110                 | 0x11111117   - 07
# 1100                 | 0x11111113   - 03
# 1000                 | 0x11111111   - 01
################################################

main:		addi r4, r0, 200		# define o limite no r4
reset:		movia r8, 0x11111110	# byte para ligar led
			movia r9, LEDADDR		# move o endereço da led
			movia r5, counter		# move o imediato para o r5
			ldw r6, 0(r5)			# lê do r5 pro r6
			movia r12, 8			# Armazena 8 como valor de soma

delay:  	addi r6, r6, 1
			bne r4, r6, delay		# compara se r6 chegou ao val max. senão, delay
			br loop					# vai pro loop que acende led

loop:		stb r8, 0(r9)			# armazena o byte em r8 no periferico com endereço em r9
			add r8, r8, r12			# roli r8, r8, 1
			movia r11, ONE          # Move o imediato 1 para r11
			blt r12, r11, reset     # Caso o valor em r12 <= r11 reseta
			srai r11, r12, 1		# divide por 2
			sub r11, r12, r11		# Subtrai r11 de r12
			movia r5, counter		# move o imediato para o r5
			ldw r6, 0(r5)			# lê do r5 pro r6
			beq r11, r12, less_one  # caso o r12 ao ser dividido vire 0, vai para subtrair 1
			mov r12, r11            # caso não entre na condição acima, r12 fica com o valor em r11
			br delay				# volta pra contar o tempo
less_one:	addi r12, r12, -1       # subtrai 1 de r12
			br delay
