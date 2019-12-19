###############################################
# Name: entire_game.s
###############################################

				.data
				.equ COUNTER_INPUT, 0x2030 #address for counter
                .equ PAUSE_BTN, 0x2060 #0x2020 #address for buttons
                .equ JUMP_BTN, 0x2040 #0x2021 #address for buttons
                .equ RESET_BTN, 0x2050 #0x2022 #address for buttons

                # Definindo o nome das letras
                .equ HEXA_S, 0x53
                .equ HEXA_T, 0x54
                .equ HEXA_A, 0x41
                .equ HEXA_R, 0x52
				.global main
				.text

###############################################
# Registradores usados | Valores representados
# r6                   | Contador do loop_2
# r7                   | X -> posição atual do bloco
# r8                   | Reach Edge, temporario
# r9                   | Contador do loop_1
# r10                  | Número Aleatório
# r11                  | Temp with mod operator
# r12                  | Tamanho do bloco
# r13                  | Temporario_1
# r14                  | Temporario_2
###############################################
# reservados           | Motivo
# r31                  | endereço call
# r0                   | Valor 0
###############################################

# envia uma instrução para o LCD
.macro instr db
	custom 1, r0, r0, \db
.endm
# envia um dado para o LCD
.macro data db
	movi r1, 1
	custom 1, r0, r1, \db
.endm

main:			addi r7, r0, 0
# Rotina de inicialização do display LCD
                #custom 0, r9, r10, r10
                movi r2, 0x38
                instr r2
                movi r2, 0x0c
                instr r2
                movi r2, 0x6
                instr r2
                movi r2, 0x1
                instr r2
# Looping menu
menu:
                movi r2, HEXA_S
                data r2
                movi r2, HEXA_T
                data r2
                movi r2, HEXA_A
                data r2
                movi r2, HEXA_R
                data r2
                movi r2, HEXA_T
                data r2
                movia r10, JUMP_BTN
                ldbio r9, 0(r10)            # carrega o valor contido no botão de Saltar
                bne r9, r0, menu

game_loop:
                add r16 ,r7, r12            #x+td
                addi r17, r0, 160           # colocando 160 no r17 
                bgt r16, r17, block_generator # vai pra branch se r16 for > 160

after_generation:

                br game_loop

block_generator:
                call random_call            # pega o valor de random
                addi r11, r0, 3
                call mod_operation
                # Finge que ta desenhando os blocos
                addi r7, r0, 0      # Seta o valor X do bloco para 0
                addi r8, r0, 0      # Seta o valor reach_edge para 0 (false)
                slli r10, r9, 2     # Multiplicação de r9 (random) por 4
                add r12, r9, r10    # Soma por r9, resultando em r9 * 5
                call block_move
                br after_generation # Impede de alcançar os métodos abaixo

block_move:
                sub r9, r7, r12     # r9 agora armazena o valor start (posição do blovo mais à direita)
                addi r10, r0, 0     # Temporario para o for
                add r11, r12, r12   # Valor td * 2 para a condicional do for
for_move:
                bgt r7, r0, if_positive_x
after_if_1:     addi r10, r10, 1
                bne r11, r10, for_move
                ret                 # Retorna para quem chamou block_move

if_positive_x:
                add r13, r9, r10    # Valor start+temporario do for
                addi r14, r12, 80   # Valor do tamanho da tela + tamanho do bloco
                blt r13, r14, if_right2left
                addi r8, r0, 1
                br after_if_1       # Volta para o for de onde veio

if_right2left:
                add r13, r9, r10    # start+i = temp
                addi r13, r13, 1    # temp + 1
                cmpgt r15, r13, r0  # compara temp se start+i for maior que zero e guarda em r15
                cmplt r16, r10, r12 # i<td salvo em r16
                cmpeq r17, r8, r0   # reachedge = 0; true
                and r15, r15, r16   # r15 
                and r15, r15, r17   #
                beq r15, r0, if_left2right # se for 0, vai para o próximo if
                add r18, r0, r13    # salva a posição de desenho do bloco em r18
                br after_if_1       # Volta para o for de onde veio

if_left2right:
                add r13, r9, r10    # start+i = temp
                addi r13, r13, 1    # temp + 1
                cmpge r16, r10, r12 # i>=td salvo em r16
                cmpgt r15, r13, r0  # compara temp se start+i for maior que zero e guarda em r15
                cmpne r17, r8, r0   # reachedge != 0; true
                and r15, r15, r16   # Verifica se r15 e r16 são iguais e guarda em r15
                and r15, r15, r17   # Verifica se r15 e r17 são iguais e guarda em r15
                beq r15, r0, after_if_1 # se for 0, vai para o próximo if
                sub r20, r12, r10   #
                addi r21, r0, -1
                mul r20, r20, r21   #   
                add r19, r9, r20    # salva 
                addi r18, r19, 1    # salva a posição de desenho do bloco em r18
                br after_if_1       # Volta para o for de onde veio

mod_operation:
                div r9, r10, r11
                mul r9, r9, r11
                sub r9, r10, r9
                addi r9, r9, 2
                ret                

# RANDOM
random_call:	
				movia r10, COUNTER_INPUT	# move o endereço da entrada do contador
				ldbio r9, 0(r10)			# carrega o valor contido na entrada do contador
                addi r10, r0, 0 			# Limpa o registrador com zero

xorshift:		addi r10, r9, 0
				slli r10, r10, 13			# shift left logical
				xorhi r10, r10, 13
				srli r10, r10, 7
				xorhi r10, r10, 11
				slli r10, r10, 5			# shift left logical
				ret
