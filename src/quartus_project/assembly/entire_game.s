###############################################
# Name: entire_game.s
###############################################

				.data
				.equ COUNTER_INPUT, 0x2030 #address for counter
                .equ PAUSE_BTN, 0x2020 #address for buttons
                .equ JUMP_BTN, 0x2021 #address for buttons
                .equ RESET_BTN, 0x2022 #address for buttons

				.global main
				.text

###############################################
# Registradores usados | Valores representados
# r6                   | Contador do loop_2
# r7                   | X -> posição atual do bloco
# r8                   | Tamanho da tela = 80
# r9                   | Contador do loop_1
# r10                  | Número Aleatório
# r11                  | Temp with mod operator
# r12                  | Tamanho do bloco
# r13                  | 
###############################################
# reservados           | Motivo
# r31                  | endereço call
# r0                   | Valor 0
###############################################

main:			addi r7, r0, r0

# Looping menu
menu:
                movia r10, JUMP_BTN
                ldbio r9, 0(r10)            # carrega o valor contido no botão de Saltar
                bne r9, r0, menu 

block_generator:
                call random_call            # pega o valor de random
                addi r11, r0, 3
                call mod_operation
                # Finge que ta desenhando os blocos
                call block_draw
                br main # Impede de alcançar os métodos abaixo

block_draw:
                

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
                addi r10, r0, r0			# Limpa o registrador com zero

xorshift:		addi r10, r9, 0
				slli r10, r10, 13			# shift left logical
				xorhi r10, r10, 13
				srli r10, r10, 7
				xorhi r10, r10, 11
				slli r10, r10, 5			# shift left logical
				ret
