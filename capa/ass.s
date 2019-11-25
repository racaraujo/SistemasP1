.data
    .equ btn, 0x5010
    .equ led, 0x5000
.text

.global main

# envia uma instrução para o LCD
.macro instr db
	custom 0, r0, r0, \db
.endm
# envia um dado para o LCD
.macro data db
	movi r1, 1
	custom 0, r0, r1, \db
.endm



#Inicializa o LCD
main:

    movia r3, btn #carregando bt em r3
	movia r4, led #carregando leds em r4
    addi r5, r0, 1 #r5=controle de estado

# Apaga os LED's
    ldbio r7, 0(r3)
	stwio r7, 0(r4)

# Rotina de inicialização do display LCD
	movi r2, 0x38
	instr r2
	
	movi r2, 0x0c
	instr r2
	
	movi r2, 0x6
	instr r2
	
	movi r2, 0x1
	instr r2
#-----------------------------------------

# LOOP PRINCIPAL
loop:

    # Nas linhas abaixo é verificado em qual estado está o programa e é mostrado na tela a mensagem corespondente


    call menu1


    # verifica se deve salvar em r8 o valor do estado atual e zerar o registrador de controle de estado

    beq r5, zero, retverifica
    add r8, r0, r5 
    addi r5, r0, 0 
retverifica:

    # lê botões e faz anti-debouncing (metodo escolhido: travar em loop até sinal voltar para nivel normal, usando outro registrador como controle)

    ldbio r7, 0(r3) 
antibouncing:
    ldbio r10, 0(r3)
    addi r6, r0, 15
    bne r10, r6, antibouncing
    
    #verifica botão DOWN

    addi r6, r0, 7
    bne r6, r7, notbtndown 
    addi r9, r8, 1
    addi r6, r0, 6
    bne r9, r6, notbottommenu
    addi r9, r0, 1
notbottommenu:
    add r5, r0, r9
notbtndown:

    #verifica botão UP

    addi r6, r0, 11
    bne r6, r7, notbtnup 
    subi r9, r8, 1
    addi r6, r0, 0
    bne r9, r6, nottopmenu
    addi r9, r0, 5
nottopmenu:
    add r5, r0, r9
notbtnup:

    #verifica botão SELECT

    addi r6, r0, 13
    bne r6, r7, notbtnselect 
    addi r6, r0, 1
    bne r9, r6, notm1
    call mensagem1
notm1:
    addi r6, r0, 2
    bne r9, r6, notm2
    call mensagem2
notm2:
    addi r6, r0, 3
    bne r9, r6, notm3
    call mensagem3
notm3:
    addi r6, r0, 4
    bne r9, r6, notm4
    call mensagem4
notm4:
    addi r6, r0, 5
    bne r9, r6, notm5
    call mensagem5
notm5:

notbtnselect:

    br loop
#----------------------------------------

# Menu 1 até 5

menu1:
    movi r2, 0x1 # Limpar display
	instr r2
    movi r2, 0x7e #[SETA]
 	data r2
    movi r2, 0x20 #[SPACE]
 	data r2
    movi r2, 0x4f #O
 	data r2
	movi r2, 0x50 #P
 	data r2
    movi r2, 0x43 #C
 	data r2
    movi r2, 0x41 #A
 	data r2
    movi r2, 0x4f #O
 	data r2
	movi r2, 0x20 #[SPACE]
 	data r2
    movi r2, 0x31 #1
 	data r2

    movi r2, 0xc0 # Ir para linha 2
	instr r2
    movi r2, 0x20 #[SPACE]
 	data r2
    movi r2, 0x20 #[SPACE]
 	data r2
    movi r2, 0x4f #O
 	data r2
	movi r2, 0x50 #P
 	data r2
    movi r2, 0x43 #C
 	data r2
    movi r2, 0x41 #A
 	data r2
    movi r2, 0x4f #O
 	data r2
	movi r2, 0x20 #[SPACE]
 	data r2
    movi r2, 0x32 #2
 	data r2
    ret



#-----------------------------------------

# Escrever Mensagens no LCD

mensagem1:
    movi r2, 0x1 # Limpar display
	instr r2
    movi r2, 0x4c #L
 	data r2
    movi r2, 0x45 #E
 	data r2
    movi r2, 0x44 #D
 	data r2
    movi r2, 0x20 #[SPACE]
 	data r2
    movi r2, 0x31 #1
 	data r2
    movi r2, 0x20 #[SPACE]
 	data r2
    movi r2, 0x4f #O
 	data r2
    movi r2, 0x4e #O
 	data r2
    addi r6, r0, 7
    stwio r6, 0(r4)
    
whaitreturn1:    
    ldbio r7, 0(r3) 
    ldbio r10, 0(r3)
    addi r6, r0, 15
    bne r10, r6, whaitreturn1
    addi r6, r0, 14
    bne r7, r6, whaitreturn1
    addi r5, r0, 1
    addi r6, r0, 15
    stwio r6, 0(r4)
    ret
mensagem2:
    movi r2, 0x1 # Limpar display
	instr r2
    movi r2, 0x4c #L
 	data r2
    movi r2, 0x45 #E
 	data r2
    movi r2, 0x44 #D
 	data r2
    movi r2, 0x20 #[SPACE]
 	data r2
    movi r2, 0x32 #2
 	data r2
    movi r2, 0x20 #[SPACE]
 	data r2
    movi r2, 0x4f #O
 	data r2
    movi r2, 0x4e #O
 	data r2
    addi r6, r0, 11
    stwio r6, 0(r4)

    whaitreturn2:    
    ldbio r7, 0(r3) 
    ldbio r10, 0(r3)
    addi r6, r0, 15
    bne r10, r6, whaitreturn2
    addi r6, r0, 14
    bne r7, r6, whaitreturn2
    addi r5, r0, 2
    addi r6, r0, 15
    stwio r6, 0(r4)
    ret
mensagem3:
    movi r2, 0x1 # Limpar display
	instr r2
    movi r2, 0x4c #L
 	data r2
    movi r2, 0x45 #E
 	data r2
    movi r2, 0x44 #D
 	data r2
    movi r2, 0x20 #[SPACE]
 	data r2
    movi r2, 0x33 #3
 	data r2
    movi r2, 0x20 #[SPACE]
 	data r2
    movi r2, 0x4f #O
 	data r2
    movi r2, 0x4e #O
 	data r2
    addi r6, r0, 13
    stwio r6, 0(r4)

    whaitreturn3:    
    ldbio r7, 0(r3) 
    ldbio r10, 0(r3)
    addi r6, r0, 15
    bne r10, r6, whaitreturn3
    addi r6, r0, 14
    bne r7, r6, whaitreturn3
    addi r5, r0, 3
    addi r6, r0, 15
    stwio r6, 0(r4)
    ret
mensagem4:
    movi r2, 0x1 # Limpar display
	instr r2
    movi r2, 0x4c #L
 	data r2
    movi r2, 0x45 #E
 	data r2
    movi r2, 0x44 #D
 	data r2
    movi r2, 0x20 #[SPACE]
 	data r2
    movi r2, 0x34 #4
 	data r2
    movi r2, 0x20 #[SPACE]
 	data r2
    movi r2, 0x4f #O
 	data r2
    movi r2, 0x4e #O
 	data r2
    addi r6, r0, 14
    stwio r6, 0(r4)

    whaitreturn4:    
    ldbio r7, 0(r3) 
    ldbio r10, 0(r3)
    addi r6, r0, 15
    bne r10, r6, whaitreturn4
    addi r6, r0, 14
    bne r7, r6, whaitreturn4
    addi r5, r0, 4
    addi r6, r0, 15
    stwio r6, 0(r4)
    ret
mensagem5:
    movi r2, 0x1 # Limpar display
	instr r2
    movi r1, 0x41 #A
 	data r2
    movi r2, 0x4c #L
 	data r2
    movi r2, 0x4c #L
 	data r2
    movi r2, 0x20 #[SPACE]
 	data r2
    movi r2, 0x4c #L
 	data r2
    movi r2, 0x45 #E
 	data r2
    movi r2, 0x44 #D
 	data r2
    movi r2, 0x53 #S
 	data r2
    movi r2, 0x20 #[SPACE]
 	data r2
    movi r2, 0x4f #O
 	data r2
    movi r2, 0x4e #O
 	data r2
    stwio r0, 0(r4)

    whaitreturn5:    
    ldbio r7, 0(r3) 
    ldbio r10, 0(r3)
    addi r6, r0, 15
    bne r10, r6, whaitreturn5
    addi r6, r0, 14
    bne r7, r6, whaitreturn5
    addi r5, r0, 5
    addi r6, r0, 15
    stwio r6, 0(r4)
    ret

#-----------------------------------------

# Fim do código
end: