%include "in_out.asm"

section .data
    mapBin2hex db "0123456789ABCDEF"
    one dq 1
    four dq 4
    ten dq 10
    sixteen dq 16
    space db " "
    pNl db 10

    d00 db "00", 0
    d01 db "01", 0
    d10 db "10", 0
    d11 db "11", 0

    d000 db "000", 0
    d001 db "001", 0
    d010 db "010", 0
    d011 db "011", 0
    d100 db "100", 0
    d101 db "101", 0
    d110 db "110", 0
    d111 db "111", 0

    d0000 dq "0000", 0
    d0100 db "0100", 0
    d1000 db "1000", 0
    d1011 db "1011", 0

    d01010 db "01010", 0
    d01011 db "01011", 0

    d000000 db "000000", 0
    d000001 db "000001", 0
    d000010 db "000010", 0
    d000011 db "000011", 0
    d000100 db "000100", 0
    d000101 db "000101", 0
    d000110 db "000110", 0
    d000111 db "000111", 0
    d001000 db "001000", 0
    d001001 db "001001", 0
    d001010 db "001010", 0
    d001011 db "001011", 0
    d001100 db "001100", 0
    d001101 db "001101", 0
    d001110 db "001110", 0
    d001111 db "001111", 0
    d011010 db "011010", 0
    d100000 db "100000", 0
    d100001 db "100001", 0
    d100010 db "100010", 0
    d100011 db "100011", 0
    d101010 db "101010", 0
    d101011 db "101011", 0
    d101111 db "101111", 0
    d110000 db "110000", 0
    d110001 db "110001", 0
    d110100 db "110100", 0
    d111101 db "111101", 0
    d111111 db "111111", 0

    d00000000 db "00000000", 0
    d00001111 db "00001111", 0
    d11000010 db "11000010", 0
    d11101000 db "11101000", 0
    
    numberOfOperands dq 0

    soloTable db "stc:11111001 clc:11111000 std:11111101 cld:11111100 syscall:0000111100000101 ret:11000011", 0

    registersTable db "r10b:010 r11b:011 r12b:100 r13b:101 r14b:110 r15b:111 r10w:010 r11w:011 r12w:100 r13w:101 r14w:110 r15w:111 "
                   db "r10d:010 r11d:011 r12d:100 r13d:101 r14d:110 r15d:111 "
                   db "r10:010 r11:011 r12:100 r13:101 r14:110 r15:111 "
                   db "r8b:000 r9b:001 "
                   db "r8w:000 r9w:001 "
                   db "r8d:000 r9d:001 "
                   db "rax:000 rcx:001 rdx:010 rbx:011 rsp:100 rbp:101 rsi:110 rdi:111 "
                   db "eax:000 ecx:001 edx:010 ebx:011 esp:100 ebp:101 esi:110 edi:111 "
                   db "ax:000 cx:001 dx:010 bx:011 sp:100 bp:101 si:110 di:111 "
                   db "al:000 cl:001 dl:010 bl:011 ah:100 ch:101 dh:110 bh:111 "
                   db "r8:000 r9:001 n:101 ", 0
    scaleMap db "1:00 2:01 4:10 8:11 ", 0
    tttn db "o:0000 no:0001 b:0010 nae:0010 nb:0011 ae:0011 e:0100 z:0100 ne:0101 nz:0101 "
         db "be:0110 na:0110 nbe:0111 a:0111 s:1000 ns:1001 p:1010 pe:1010 np:1011 po:1011 "
         db "l:1100 nge:1100 nl:1101 ge:1101 le:1110 ng:1110 nle:1111 g:1111 ", 0

    registers64 db "rax rcx rdx rbx rsp rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 ", 0
    registers32 db "eax ecx edx ebx esp ebp esi edi r8d r9d r10d r11d r12d r13d r14d r15d ", 0
    registers16 db "ax cx dx bx sp bp si di r8w r9w r10w r11w r12w r13w r14w r15w ", 0
    registers8 db "al cl dl bl ah ch dh bh r8b r9b r10b r11b r12b r13b r14b r15b ", 0 

    newRegisters db "r8 r8d r8w r8b r9 r9d r9w r9b r10 r10d r10w r10b r11 r11d r11w r11b "
                 db "r12 r12d r12w r12b r13 r13d r13w r13b r14 r14d r14w r14b r15 r15d r15w r15b ", 0

    registersException db "rbp ebp bp ch", 0
    accumulators db "rax eax ax al", 0

    n db "n ", 0

    opSz dq 0
    adSz dq 0
    diSz dq 0
    dis dq 0
    imSz dq 0
    im dq 0

    pre66 db "01100110", 0
    pre67 db "01100111", 0

    has67 db 0
    has66 db 0
    hasRex db 0
    hasOpE db 0

    isMov db "mov ", 0
    isAdd db "add ", 0
    isAdc db "adc ", 0
    isSub db "sub ", 0
    isSbb db "sbb ", 0
    isAnd db "and ", 0
    isOr db "or ", 0
    isXor db "xor ", 0
    isDec db "dec ", 0
    isInc db "inc ", 0
    isCmp db "cmp ", 0
    isTest db "test ", 0
    isXchg db "xchg ", 0
    isXadd db "xadd ", 0
    isImul db "imul ", 0
    isIdiv db "idiv ", 0
    isBsf db "bsf ", 0
    isBsr db "bsr ", 0
    isJmp db "jmp ", 0
    isShl db "shl ", 0
    isShr db "shr ", 0
    isNeg db "neg ", 0
    isNot db "not ", 0
    isCall db "call ", 0
    isRet db "ret ", 0
    isPush db "push ", 0
    isPop  db "pop ", 0

    lineLen dq 0

    SFD dq 0
    D1FD dq 0
    D2FD dq 0
    firstFile db "first-file.txt", 0
    secondFile db "second-file.txt", 0
section .bss
    line resb 100
    temp resb 50
    temp1 resb 50
    temp2 resb 50
    instruction resb 10
    result resb 100

    operand resb 50
    operand0 resb 50
    operand1 resb 50

    rex_pre resb 4
    rex_w resb 1
    rex_r resb 1
    rex_x resb 1
    rex_b resb 1
    rex_end resb 1
    opcodeE resb 8
    opcodeE_end resb 1
    opcode resb 6
    opcode_d resb 1
    opcode_w resb 1
    opcode_end resb 1
    mod resb 2
    reg resb 3
    rm resb 3
    modRm_end resb 1
    scale resb 2
    index resb 3
    base resb 3
    SIB_end resb 1
    disField resb 32
    disField_end resb 1
    dataField resb 64
    dataField_end resb 1

    filePath resb 100

section .text
    global _start

%macro debug 1
    push rax
    mov rax, %1
    call writeNum
    call newLine
    pop rax
%endmacro


%macro putChar 2
    mov byte[%1], %2
    inc %1
%endmacro

%macro haveChar 2
    push r8
    push r9
    mov r8, %1
    mov r9b, %2
%%L1:
    cmp byte[r8], 0
    je %%notFound
    cmp byte[r8], r9b
    je %%Found
    inc r8
    jmp %%L1
%%notFound:
    mov rax, -1
    jmp %%end
%%Found:
    mov rax, r8
    jmp %%end
%%end:
    pop r9
    pop r8
%endmacro

%macro replace 4
    push r8
    mov r8, %1
    mov %4, 0
%%L1:
    cmp byte[r8], 0
    je %%end
    cmp byte[r8], %2
    je %%changeIt
    inc r8
    jmp %%L1
%%changeIt:
    inc %4
    mov byte[r8], %3
    inc r8
    jmp %%L1
%%end:
    pop r8
%endmacro

%macro resetArray 2
    push r8
    push r9
    mov r8, %1
    mov r9, 0
%%L1:
    cmp r9, %2
    je %%L1F
    mov byte[r8], 0
    inc r8
    inc r9
    jmp %%L1
%%L1F:
    pop r9
    pop r8
%endmacro

%macro getRegSz 2
    push r8
    push r9
    push r10
    push r11

    mov r8, 64
    mov r9, 32
    mov r10, 16
    mov r11, 8
    push %1
    push registers64
    call isIn
    cmovc %2, r8
    jc %%end
    push %1
    push registers32
    call isIn
    cmovc %2, r9
    jc %%end
    push %1
    push registers16
    call isIn
    cmovc %2, r10
    jc %%end
    push %1
    push registers8
    call isIn
    cmovc %2, r11
%%end:
    pop r11
    pop r10
    pop r9
    pop r8
%endmacro

%macro checkAd 1
    cmp byte[%1], "Q"
    je %%itIsMem
    cmp byte[%1], "D"
    je %%itIsMem 
    cmp byte[%1], "W"
    je %%itIsMem 
    cmp byte[%1], "B"
    je %%itIsMem 
    jmp %%end
%%itIsMem:
    mov r12, 0
    push qword 2
    push %1
    push temp
    call getItem
    cmp byte[temp], "n"
    je %%tryIndex
    getRegSz temp, r12
%%tryIndex:
    push qword 3
    push %1
    push temp
    call getItem
    cmp byte[temp], "n"
    je %%endAdSz
    getRegSz temp, r12
%%endAdSz:
    mov [adSz], r12
    push qword 5
    push %1
    push temp
    call getItem
    cmp byte[temp], "n"
    je %%end
    mov r12, 0
    push r13
    push r14
    push rax
    mov rax, 0
    mov r14, 0
    mov r13, temp
%%L1:
    cmp byte[r13], " "
    je %%L1F
    cmp byte[r13], 0
    je %%L1F
    mov r14b, byte[r13]
    cmp r14b, 65
    jge %%itsLetter
    sub r14b, "0"
%%L1_continue:
    mul qword[sixteen]
    add rax, r14
    inc r13
    jmp %%L1
%%itsLetter:
    sub r14b, "A"
    add r14b, 10
    jmp %%L1_continue
%%L1F:
    mov [dis], rax
    cmp rax, 127
    jg %%disIs32
    mov qword[diSz], 8
    pop rax
    pop r14
    pop r13
    jmp %%end
%%disIs32:
    mov qword[diSz], 32
    pop rax
    pop r14
    pop r13
    jmp %%end

%%end:
%endmacro
%macro getValueM 3
    push %1
    push %2
    push %3
    call getValue
%endmacro
%macro isInM 2
    push %1
    push %2
    call isIn
%endmacro
%macro copyM 2
    push %1
    push %2
    call copy
%endmacro
%macro copyWithOut0M 2
    push %1
    push %2
    call copyWithOut0
%endmacro
%macro copyEndWith0M 2
    push %1
    push %2
    call copyEndWith0
%endmacro
%macro getItemM 3
    push %1
    push %2
    push %3
    call getItem
%endmacro
%macro normalizeM 3
    push %1
    push %2
    push %3
    call normalize
%endmacro
%macro bin2hexM 2
    push %1
    push %2
    call bin2hex
%endmacro
;
readStr:
    push    r8
    push    rax
    mov     r8, filePath
readStr_getCharAgain:
    call    getc
    cmp     al, NL
    je      readStr_getCharEnd
    mov     [r8], al
    inc     r8
    jmp     readStr_getCharAgain
readStr_getCharEnd:
    mov     byte[r8], 0
    pop     rax
    pop     r8
    ret
;avali (key) dar dovami value dar sevomi
getValue:
    enter 0, 0
    push r8
    push r9
    push r10
    push r11

    mov r8, [rbp + 32]
    mov r9, [rbp + 24]
    mov r10, [rbp + 16]

getValue_findKey:
    cmp byte[r9], ":"
    je getValue_halfKeyFound
    mov r11b, [r9]
    cmp r11b, [r8]
    jne getValue_skipThisKey
    inc r8
    inc r9
    jmp getValue_findKey
getValue_halfKeyFound:
    cmp byte[r8], " "
    je getValue_keyFound
    cmp byte[r8], 0
    je getValue_keyFound
    jmp getValue_skipThisKey
getValue_skipThisKey:
    inc r9
    mov r11b, [r9 - 1]
    cmp r11b, " "
    mov r8, [rbp + 32]
    je getValue_findKey
    jmp getValue_skipThisKey

getValue_keyFound:
    inc r9
    cmp byte[r9], " "
    je getValue_end
    mov r11b, byte[r9]
    mov byte[r10], r11b
    inc r10
    jmp getValue_keyFound

getValue_end:
    mov byte[r10], 0
    mov r15, r10
    pop r11
    pop r10
    pop r9
    pop r8
    leave 
    ret 24

;avali dar dovomi hast? carry flag avaz mishe
isIn: 
    enter 0, 0
    push r8
    push r9
    push r10

    mov r8, [rbp + 24]
    mov r9, [rbp + 16]
    clc
isIn_search:
    cmp byte[r9], " "
    je isIn_halfFound
    cmp byte[r9], 0
    je isIn_end
    mov r10b, [r9]
    cmp [r8], r10b
    jne isIn_skipThis
    inc r9
    inc r8
    jmp isIn_search
isIn_skipThis:
    inc r9
    mov r10b, [r9 - 1]
    cmp r10b, " "
    mov r8, [rbp + 24]
    je isIn_search
    jmp isIn_skipThis
isIn_halfFound:
    cmp byte[r8], " "
    je isIn_found
    cmp byte[r8], 0
    je isIn_found
    inc r9
    mov r8, [rbp + 24]
    jmp isIn_search
isIn_found:
    stc
isIn_end:
    pop r10
    pop r9
    pop r8
    leave
    ret 16


;avali dar dovomi
copy:
    enter 0, 0
    push r8
    push r9
    push r10

    mov r8, [rbp + 24]
    mov r9, [rbp + 16]
copy_L1:
    mov r10b, [r8]
    cmp r10b, 0
    je copy_end
    cmp r10b, " "
    je copy_end
    cmp r10b, "]"
    je copy_end
    mov [r9], r10b
    inc r8
    inc r9
    jmp copy_L1

copy_end:
    mov byte[r9], 0
    mov r14, r8
    mov r15, r9
    pop r10
    pop r9
    pop r8
    leave
    ret 16
;avali dar dovomi
copyWithOut0:
    enter 0, 0
    push r8
    push r9
    push r10

    mov r8, [rbp + 24]
    mov r9, [rbp + 16]
copyWithOut0_L1:
    mov r10b, [r8]
    cmp r10b, 0
    je copyWithOut0_end
    cmp r10b, " "
    je copyWithOut0_end
    cmp r10b, "]"
    je copyWithOut0_end
    mov [r9], r10b
    inc r8
    inc r9
    jmp copyWithOut0_L1

copyWithOut0_end:
    mov r14, r8
    mov r15, r9
    pop r10
    pop r9
    pop r8
    leave
    ret 16
;avali dar dovomi
copyEndWith0:
    enter 0, 0
    push r8
    push r9
    push r10

    mov r8, [rbp + 24]
    mov r9, [rbp + 16]
copyEndWith0_L1:
    mov r10b, [r8]
    cmp r10b, 0
    je copyEndWith0_end
    mov [r9], r10b
    inc r8
    inc r9
    jmp copyEndWith0_L1

copyEndWith0_end:
    mov byte[r9], 0
    mov r14, r8
    mov r15, r9
    pop r10
    pop r9
    pop r8
    leave
    ret 16
;hex avali dar dovomi
bin2hex: 
    enter 0, 0
    push rax
    push rbx
    push r8
    push r9
    push r10

    mov r8, [rbp + 24]
    mov r9, [rbp + 16]
    mov r10, 2
bin2hex_L1:
    cmp byte[r8], 0
    je bin2hex_end
    mov rax, 0
    mul r10
    mov rbx,0
    cmp byte[r8], "1"
    cmove rbx, [one]
    add rax, rbx
    inc r8
    mul r10
    mov rbx,0
    cmp byte[r8], "1"
    cmove rbx, [one]
    add rax, rbx
    inc r8
    mul r10
    mov rbx,0
    cmp byte[r8], "1"
    cmove rbx, [one]
    add rax, rbx
    inc r8
    mul r10
    mov rbx,0
    cmp byte[r8], "1"
    cmove rbx, [one]
    add rax, rbx
    inc r8
    add rax, mapBin2hex
    mov bl, [rax]
    mov [r9], bl
    inc r9
    jmp bin2hex_L1
bin2hex_end:
    mov byte[r9], 0
    pop r10
    pop r9
    pop r8
    pop rbx
    pop rax
    leave
    ret 16


;avali (index) dar dovomi mirize dar sevomi
getItem:
    enter 0, 0
    push r8
    push r9
    push r10

    mov r8, [rbp + 32]
    mov r9, [rbp + 24]
    mov r10, [rbp + 16]

getItem_L1:
    cmp r8, 0
    je getItem_L1F
getItem_L2:
    cmp byte[r9], " "
    je getItem_L2F
    inc r9
    jmp getItem_L2
getItem_L2F:
    dec r8
    inc r9
    jmp getItem_L1
getItem_L1F:
    copyM r9, r10
    pop r10
    pop r9
    pop r8
    leave
    ret 24
;pars operand dar avali
parseOp:
    enter 0, 0
    push r8
    mov r8, [rbp + 16]
    cmp byte[operand], "Q"
    je parseOp_itIsMem
    cmp byte[operand], "D"
    je parseOp_itIsMem
    cmp byte[operand], "W"
    je parseOp_itIsMem
    cmp byte[operand], "B"
    je parseOp_itIsMem
    cmp byte[operand], "0"
    jl parseOp_itIsReg
    cmp byte[operand], "9"
    jg parseOp_itIsReg
parseOp_itIsIm:
    push rax
    push r9
    push r10
    mov rax, 0
    mov r9, 0
    mov r10, operand
parseOp_itIsIm_L1:
    cmp byte[r10], 0
    je parseOp_itIsIm_L1F
    cmp byte[r10], " "
    je parseOp_itIsIm_L1F
    mov r9b, byte[r10]
    sub r9b, "0"
    mul qword[ten]
    add rax, r9 
    inc r10
    jmp parseOp_itIsIm_L1
parseOp_itIsIm_L1F:
    mov qword[im], rax
    pop r10
    pop r9
    pop rax
    jmp parseOp_end
parseOp_itIsReg:
    copyM operand, r8
    jmp parseOp_end
parseOp_itIsMem:
    copyM operand, r8
    mov byte[r15], " "
    inc r14
    inc r15
    copyM r14, r15
    mov byte[r15], " "
    inc r14
    inc r15
    haveChar r14, "*"
    mov rbx, rax
    haveChar r14, "+"
    inc r14

    cmp rax, -1
    jne parseOp_elseif_1
    cmp rbx, -1
    jne parseOp_indexScale
    cmp byte[r14], "0"
    jne parseOp_base
    ;just dis
    putChar r15, "n"
    putChar r15, " "
    putChar r15, "n"
    putChar r15, " "
    putChar r15, "n"
    putChar r15, " "

    inc r14
    inc r14
    copyM r14, r15
    putChar r15, " "
    putChar r15, 0
    jmp parseOp_end
parseOp_base:
    copyM r14, r15
    putChar r15, " "
    putChar r15, "n"
    putChar r15, " "
    putChar r15, "n"
    putChar r15, " "
    putChar r15, "n"
    putChar r15, " "
    putChar r15, 0
    jmp parseOp_end
parseOp_indexScale:
    mov byte[rbx], " "
    putChar r15, "n"
    putChar r15, " "
    copyM r14, r15
    mov byte[r15], " "
    inc r14
    inc r15
    copyM r14, r15
    putChar r15, " "
    putChar r15, "n"
    putChar r15, " "
    putChar r15, 0
    jmp parseOp_end
parseOp_elseif_1:
    cmp rbx, -1
    jne parseOp_else_1
    ;baseDis
    mov byte[rax], " "
    copyM r14, r15
    mov byte[r15], " "
    inc r14
    inc r15
    putChar r15, "n"
    putChar r15, " "
    putChar r15, "n"
    putChar r15, " "
    inc r14
    inc r14
    copyM r14, r15
    putChar r15, " "
    putChar r15, 0
    jmp parseOp_end
parseOp_else_1:
    replace r14, "*", " ", r10
    replace r14, "+", " ", r10
    cmp rax, rbx
    jg parseOp_indexScaleDis
    cmp r10, 2
    jne parseOp_baseIndexScale
    copyM r14, r15
    mov byte[r15], " "
    inc r14
    inc r15
    copyM r14, r15
    mov byte[r15], " "
    inc r14
    inc r15
    copyM r14, r15
    mov byte[r15], " "
    inc r14
    inc r15
    inc r14
    inc r14
    copyM r14, r15
    putChar r15, " "
    putChar r15, 0
    jmp parseOp_end
parseOp_baseIndexScale:
    copyM r14, r15
    mov byte[r15], " "
    inc r14
    inc r15
    copyM r14, r15
    mov byte[r15], " "
    inc r14
    inc r15
    copyM r14, r15
    putChar r15, " "
    putChar r15, "n"
    putChar r15, " "
    putChar r15, 0   
    jmp parseOp_end
parseOp_indexScaleDis:
    putChar r15, "n"
    putChar r15, " "
    copyM r14, r15
    mov byte[r15], " "
    inc r14
    inc r15
    copyM r14, r15
    mov byte[r15], " "
    inc r14
    inc r15
    inc r14
    inc r14
    copyM r14, r15
    putChar r15, " "
    putChar r15, 0
    jmp parseOp_end
parseOp_end:
    pop r8
    leave
    ret 8
;parse line
parseLine:
    mov r8, line
    mov r9, instruction
parseLine_findInstruction:
    cmp byte [r8], NL
    je parseLine_thisIsSolo
    cmp byte [r8], " "
    je parseLine_thisIsNotSolo
    mov al, [r8]
    mov [r9], al
    inc r8
    inc r9
    jmp parseLine_findInstruction
parseLine_thisIsSolo:
    mov byte[r9], 0
    getValueM instruction, soloTable, opcode
    jmp printResult
parseLine_thisIsNotSolo:
    mov byte[r9], 0
    mov r9, operand
    inc r8
parseLine_firstOp:
    cmp byte[r8], NL
    je parseLine_oneOperand
    cmp byte[r8], ","
    je parseLine_twoOperand
    mov al, [r8]
    mov [r9], al
    inc r8
    inc r9
    jmp parseLine_firstOp
parseLine_oneOperand:
    mov qword[numberOfOperands], 1
    mov byte[r9], 0
    push operand0
    call parseOp
    jmp parseLine_endParse
    
parseLine_twoOperand:
    mov qword[numberOfOperands], 2
    mov byte[r9], 0
    push operand0
    call parseOp
    resetArray operand, 50
    mov r9, operand
    inc r8
parseLine_secondOp:
    cmp byte[r8], NL
    je parseLine_twoOperandF
    mov al, [r8]
    mov [r9], al
    inc r8
    inc r9
    jmp parseLine_secondOp
parseLine_twoOperandF:
    push operand1
    call parseOp
    jmp parseLine_endParse
parseLine_endParse:
    ret

;
prep:
    push r8
    push r9
    push r10
    push r11
    push r12

    mov r8, 64
    mov r9, 32
    mov r10, 16
    mov r11, 8
    mov r12, 0
prep_opSz:
    cmp byte[operand0], "Q"
    cmove r12, r8
    je prep_opSzF
    cmp byte[operand0], "D"
    cmove r12, r9
    je prep_opSzF
    cmp byte[operand0], "W"
    cmove r12, r10
    je prep_opSzF
    cmp byte[operand0], "B"
    cmove r12, r11
    je prep_opSzF
    getItemM qword 0, operand0, temp
    getRegSz temp, r12
prep_opSzF:
    mov [opSz], r12
    mov r12, 0
prep_adSz:
    checkAd operand0
    cmp qword[numberOfOperands], 1
    je prep_skipSecondOp
    checkAd operand1
prep_skipSecondOp:
prep_end:
    cmp qword[im], 128
    jl prep_data8
    mov qword[imSz], 32
    jmp prep_dataSzFound
prep_data8:
    mov qword[imSz], 8
    jmp prep_dataSzFound
prep_dataSzFound:
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    ret

;
hSR: ;handleSecondRegister
    mov byte[opcode_d], "0"
    mov byte[opcode_w], "0"
    cmp qword[opSz], 8
    je hSR_dontChangeW
    mov byte[opcode_w], "1"
hSR_dontChangeW:
    getItemM qword 0, operand1, temp
    getValueM temp, registersTable, reg
    cmp byte[operand1], "r"
    jne hSR_doesntStartwithr
    mov byte[hasRex], 1
    mov byte[rex_w], "0"
    isInM temp, registers64
    jnc hSR_secondRegisterisnt64
    mov byte[rex_w], "1"
hSR_secondRegisterisnt64:
    isInM temp, newRegisters
    jnc hSR_secondRegisterisntNew
    mov byte[rex_r], "1"
hSR_secondRegisterisntNew:
hSR_doesntStartwithr:
    cmp byte[operand0], "Q"
    je hSR_firstIsntRegister
    cmp byte[operand0], "D"
    je hSR_firstIsntRegister
    cmp byte[operand0], "W"
    je hSR_firstIsntRegister
    cmp byte[operand0], "B"
    je hSR_firstIsntRegister
    copyWithOut0M d11, mod
    getItemM qword 0, operand0, temp
    getValueM temp, registersTable, rm
    isInM temp, newRegisters
    jnc hSR_end
    mov byte[hasRex], 1
    mov byte[rex_b], "1"
    jmp hSR_end
hSR_firstIsntRegister: ;so first is mem
    getItemM qword 3, operand0, temp
    cmp byte[temp], "n"
    jne hSR_itsNotSingleBase
    getItemM qword 5, operand0, temp
    cmp byte[temp], "n"
    jne hSR_itsNotSingleBase
    getItemM qword 2, operand0, temp
    isInM temp, registersException
    jnc hSR_isntException
    copyWithOut0M d01, mod
    copyWithOut0M d101, rm
    copyWithOut0M d00000000, disField
    jmp hSR_end
hSR_isntException:
    isInM temp, newRegisters
    jnc hSR_singleBaseIsntNew
    mov byte[hasRex], 1
    mov byte[rex_b], "1"

hSR_singleBaseIsntNew:
    copyWithOut0M d00, mod
    getValueM temp, registersTable, rm
    jmp hSR_end

hSR_itsNotSingleBase:
    getItemM qword 2, operand0, temp
    cmp byte[temp], "n"
    je hSR_finalElse
    getItemM qword 3, operand0, temp
    cmp byte[temp], "n"
    jne hSR_finalElse
    cmp qword[diSz], 8
    jne hSR_disInst8
    copyWithOut0M d01, mod
    jmp hSR_disInst32
hSR_disInst8:
    cmp qword[diSz], 32
    jne hSR_disInst32
    copyWithOut0M d10, mod
hSR_disInst32:
    getItemM qword 2, operand0, temp
    getValueM temp, registersTable, rm
    normalizeM qword[dis], qword[diSz], disField
    isInM temp, newRegisters
    jnc hSR_end
    mov byte[hasRex], 1
    mov byte[rex_b], "1"
    jmp hSR_end
hSR_finalElse:
    copyWithOut0M d00, mod
    cmp qword[diSz], 8
    jne hSR_finalElse_disIsnt8
    copyWithOut0M d01, mod
    jmp hSR_finalElse_disIsnt32
hSR_finalElse_disIsnt8:
    cmp qword[diSz], 32
    jne hSR_finalElse_disIsnt32
    copyWithOut0M d10, mod
hSR_finalElse_disIsnt32:
    getItemM qword 2, operand0, temp
    cmp byte[temp], "n"
    jne hSR_finalElse_haveBase
    copyWithOut0M d00, mod
    mov qword[diSz], 32
hSR_finalElse_haveBase:
    copyWithOut0M d100, rm
    getItemM qword 2, operand0, temp
    getValueM temp, registersTable, base
    isInM temp, newRegisters
    jnc hSR_finalElse_noScaleIndex
    mov byte[hasRex], 1
    mov byte[rex_b], "1"
hSR_finalElse_noScaleIndex:
    getItemM qword 3, operand0, temp
    cmp byte[temp], "n"
    jne hSR_finalElse_ScaleIndex
    copyWithOut0M d00, scale
    copyWithOut0M d100, index
    normalizeM qword[dis], qword[diSz], disField
    jmp hSR_end
hSR_finalElse_ScaleIndex:
    getItemM qword 4, operand0, temp
    getValueM temp, scaleMap, scale
    getItemM qword 3, operand0, temp
    getValueM temp, registersTable, temp1
    copyWithOut0M temp1, index
    isInM temp, newRegisters
    jnc hSR_finalElse_noDis
    mov byte[hasRex], 1
    mov byte[rex_x], "1"
hSR_finalElse_noDis:
    getItemM qword 5, operand0, temp
    cmp byte[temp], "n"
    jne hSR_finalElse_Dis
    normalizeM qword 0, qword[diSz], disField
    jmp hSR_end
hSR_finalElse_Dis:
    normalizeM qword[dis], qword[diSz], disField
    jmp hSR_end
hSR_end:
    ret
;avali be andaze dovomi norm dar sevomi
normalize:
    enter 0, 0
    push r8
    push r9
    push r10
    push r11
    push rax
    push rdx
    mov rax, [rbp + 32]
    mov r9, [rbp + 24]
    mov r10, [rbp + 16]
    mov r11, 2
    add r10, r9
    mov byte[r10], 0
    mov r10, [rbp + 16]
    sub r10, 9
normalize_L1:
    cmp r9, 0
    je normalize_end
    add r10, 16
    mov r8, 8
normalize_L2:
    cmp r8, 0
    je normalize_L1
    xor rdx, rdx
    div r11
    add rdx, "0"
    mov byte[r10], dl
    dec r10
    dec r8
    dec r9
    jmp normalize_L2
normalize_end:
    pop rdx
    pop rax
    pop r11
    pop r10
    pop r9
    pop r8
    leave
    ret 24
;
hSI: ;handleSecondIm
    mov byte[opcode_d], "1"
    cmp qword[im], 127
    jg hSI_changeOpcode_d
    cmp qword[opSz], 8
    je hSI_changeOpcode_d
    jmp hSI_opcode_d0
hSI_changeOpcode_d:
    mov byte[opcode_d], "0"
hSI_opcode_d0:
    mov byte[opcode_w], "0"
    cmp qword[opSz], 8
    je hSI_opcode_w1
    mov byte[opcode_w], "1"
hSI_opcode_w1:
    normalizeM qword[im], qword[imSz], dataField
    cmp qword[opSz], 64
    jne hSI_opNot64
    mov byte[hasRex], 1
    mov byte[rex_w], "1"
hSI_opNot64:
    getItemM qword 0, operand0, temp
    cmp byte[temp], "Q"
    je hSI_firstIsntReg
    cmp byte[temp], "D"
    je hSI_firstIsntReg
    cmp byte[temp], "W"
    je hSI_firstIsntReg
    cmp byte[temp], "B"
    je hSI_firstIsntReg
    copyWithOut0M d11, mod
    getValueM temp, registersTable, rm
    cmp byte[temp], "r"
    jne hSR_end
    mov byte[hasRex], 1
    mov byte[rex_w], "0"
    cmp qword[opSz], 64
    jne hSI_firstIsnt64
    mov byte[rex_w], "1"
hSI_firstIsnt64:
    isInM temp, newRegisters
    jnc hSR_end
    mov byte[rex_b], "1"
    jmp hSR_end
hSI_firstIsntReg:
    jmp hSR_firstIsntRegister
;
hSO: ;handleSingleOp
    mov byte[opcode_d], "1"
    mov byte[opcode_w], "0"
    cmp qword[opSz], 8
    je hSO_opSzIs8
    mov byte[opcode_w], "1"
hSO_opSzIs8:
    cmp qword[opSz], 64
    jne hSO_opSzIsnt64
    mov byte[hasRex], 1
    mov byte[rex_w], "1"
hSO_opSzIsnt64:
    jmp hSI_opNot64
;
reset:
    mov qword[numberOfOperands], 0
    mov byte[has67], 0
    mov byte[has66], 0
    mov byte[hasRex], 0
    mov byte[hasOpE], 0
    mov qword[opSz], 0
    mov qword[adSz], 0
    mov qword[diSz], 0
    mov qword[dis], 0
    mov qword[imSz], 0
    mov qword[im], 0
    copyWithOut0M d0000, rex_w
    copyWithOut0M d00000000, opcode
    resetArray temp, 50
    resetArray temp1, 50
    resetArray temp2, 50
    resetArray instruction, 10
    resetArray result, 100
    resetArray operand, 50
    resetArray operand0, 50
    resetArray operand1, 50
    resetArray opcodeE, 8
    resetArray opcode, 8
    resetArray mod, 8
    resetArray scale, 8
    resetArray disField, 32
    resetArray dataField, 64
    resetArray filePath, 100
    ret
;
readLine:
    push rax
    push rdi
    push rsi
    push rdx
    push r8
    mov qword[lineLen], 0
    mov r8, line
readLine_L1:
    mov     rax, sys_read
    mov     rdi, [SFD]
    mov     rsi, r8 
    mov     rdx, 1
    syscall
    cmp rax, 0
    je exit

    inc qword[lineLen]

    cmp byte[r8], NL
    je readLine_L1F
    inc r8
    jmp readLine_L1
readLine_L1F:
    pop r8
    pop rdx
    pop rsi
    pop rdi
    pop rax
    ret
;
printResult:
    mov r9, 0
    mov r8, result
    cmp byte[has67], 1
    jne printResult_doesntHave67
    copyWithOut0M pre67, r8
    add r9, 8
    mov r8, r15
printResult_doesntHave67:
    cmp byte[has66], 1
    jne printResult_doesntHave66
    copyWithOut0M pre66, r8
    add r9, 8
    mov r8, r15
printResult_doesntHave66:
    cmp byte[hasRex], 1
    jne printResult_doesntHaveRex
    copyWithOut0M rex_pre, r8
    add r9, 8
    mov r8, r15
printResult_doesntHaveRex:
    cmp byte[hasOpE], 1
    jne printResult_doesntHaveOpE
    copyWithOut0M opcodeE, r8
    add r9, 8
    mov r8, r15
printResult_doesntHaveOpE:
    copyWithOut0M opcode, r8
    add r9, 8
    mov r8, r15
    cmp byte[mod], 0
    je printResult_doesntHaveModRm
    copyWithOut0M mod, r8
    add r9, 8
    mov r8, r15
printResult_doesntHaveModRm:
    cmp byte[scale], 0
    je printResult_doesntHaveSIB
    copyWithOut0M scale, r8
    add r9, 8
    mov r8, r15
printResult_doesntHaveSIB:
    cmp byte[disField], 0
    je printResult_doesntHaveDis
    copyWithOut0M disField, r8
    add r9, [diSz]
    mov r8, r15
printResult_doesntHaveDis:
    cmp byte[dataField], 0
    je printResult_doesntHaveData
    copyWithOut0M dataField, r8
    add r9, [imSz]
    mov r8, r15
printResult_doesntHaveData:
    mov byte[r8], 0
    mov rax, sys_write
    mov rdi, [D1FD]
    mov rsi, result
    mov rdx, r9
    syscall
    ; mov rax, sys_write
    ; mov rdi, [D1FD]
    ; mov rsi, pNl
    ; mov rdx, 1
    ; syscall
    bin2hexM result, temp
    mov rax, r9
    div qword[four]
    mov r9, rax
    mov rax, sys_write
    mov rdi, [D2FD]
    mov rsi, temp
    mov rdx, r9
    syscall
    mov rax, sys_write
    mov rdi, [D2FD]
    mov rsi, space
    mov rdx, 1
    syscall
    mov rax, sys_write
    mov rdi, [D2FD]
    mov rsi, line
    mov rdx, [lineLen]
    syscall
    jmp makeMc
;
_start:

    copyWithOut0M d0100, rex_pre
    mov byte[rex_end], 0
    mov byte[opcodeE_end], 0
    mov byte[opcode_end], 0
    mov byte[modRm_end], 0
    mov byte[SIB_end], 0
    mov byte[disField_end], 0
    mov byte[dataField_end], 0
    
    call readStr
    mov rax, sys_open
    mov rdi, filePath
    mov rsi, O_RDWR
    syscall
    mov [SFD], rax
    mov rax, sys_create
    mov rdi, firstFile
    mov rsi, sys_IRUSR | sys_IWUSR
    syscall
    mov [D1FD], rax
    mov rax, sys_create
    mov rdi, secondFile
    mov rsi, sys_IRUSR | sys_IWUSR
    syscall
    mov [D2FD], rax
makeMc:
    call readLine

    call reset
    call parseLine
    
    ; mov rsi, instruction
    ; call printString
    ; call newLine
    ; mov rsi, operand0
    ; call printString
    ; call newLine
    ; mov rsi, operand1
    ; call printString
    ; call newLine


    call prep


    ; debug [opSz]
    ; debug [adSz]
    ; debug [diSz]
    ; debug [dis]
    ; debug [imSz]
    ; debug [im]

    cmp qword[opSz], 16
    jne doesntHave66
    mov byte[has66], 1
doesntHave66:
    cmp qword[adSz], 32
    jne doesntHave67
    mov byte[has67], 1
doesntHave67:
    isInM instruction, isMov
    jc hMov
    isInM instruction, isAdd
    jc hAdd
    isInM instruction, isAdc
    jc hAdc
    isInM instruction, isSub
    jc hSub
    isInM instruction, isSbb
    jc hSbb
    isInM instruction,isAnd
    jc hAnd
    isInM instruction, isOr
    jc hOr
    isInM instruction, isXor
    jc hXor
    isInM instruction, isDec
    jc hDec
    isInM instruction, isInc
    jc hInc
    isInM instruction, isCmp
    jc hCmp
    isInM instruction, isTest
    jc hTest
    isInM instruction, isXchg
    jc hXchg
    isInM instruction, isXadd
    jc hXadd
    isInM instruction, isImul
    jc hImul
    isInM instruction, isIdiv
    jc hIdiv
    isInM instruction, isBsf
    jc hBsf
    isInM instruction, isBsr
    jc hBsr
    isInM instruction, isJmp
    jc hJmp
    cmp byte[instruction], "j"
    je hJ
    isInM instruction, isShl
    jc hShl
    isInM instruction, isShr
    jc hShr
    isInM instruction, isNeg
    jc hNeg
    isInM instruction, isNot
    jc hNot
    isInM instruction, isCall
    jc hCall
    isInM instruction, isRet
    jc hRet
    isInM instruction, isPush
    jc hPush
    isInM instruction, isPop
    jc hPop
exit:
    mov     rax, sys_close
    mov     rdi, [SFD]
    syscall
    mov     rax, sys_close
    mov     rdi, [D1FD]
    syscall
    mov     rax, sys_close
    mov     rdi, [D2FD]
    syscall
    mov     rax, sys_exit
    mov     rdi, 0
    syscall

hMov:
    cmp byte[operand1], "Q"
    je hMov_elseIf
    cmp byte[operand1], "D"
    je hMov_elseIf
    cmp byte[operand1], "W"
    je hMov_elseIf
    cmp byte[operand1], "B"
    je hMov_elseIf
    cmp byte[operand1], 0
    je hMov_else
    copyWithOut0M d100010, opcode
    call hSR
    jmp printResult
hMov_elseIf:
    copyWithOut0M d100010, opcode
    copyEndWith0M operand0, temp
    copyEndWith0M operand1, operand0
    copyEndWith0M temp, operand1
    call hSR
    mov byte[opcode_d], "1"
    jmp printResult
hMov_else:
    mov qword[imSz], 32 
    cmp byte[operand0], "Q"
    je hMov_else_if_half
    cmp byte[operand0], "D"
    je hMov_else_if_half
    cmp byte[operand0], "W"
    je hMov_else_if_half
    cmp byte[operand0], "B"
    je hMov_else_if_half
    jmp hMov_else_else
hMov_else_if_half:
    cmp qword[opSz], 64
    je hMov_else_else
    cmp byte[operand0], "r"
    jne hMov_else_if_doesntStartWithr
    mov byte[hasRex], 1
    mov byte[rex_b], "1"
hMov_else_if_doesntStartWithr:
    copyWithOut0M d1011, temp
    mov byte[temp + 4], "0"
    cmp qword[opSz], 8
    je hMov_else_if_opSzIs8
    mov byte[temp + 4], "1"
hMov_else_if_opSzIs8:
    getValueM operand0, registersTable, temp1
    copyWithOut0M temp1, temp + 5
    copyEndWith0M temp, opcode
    normalizeM qword[im], qword[imSz], dataField
    jmp printResult
hMov_else_else:
    copyWithOut0M d110001, opcode
    copyWithOut0M d000, reg
    call hSI
    jmp printResult
;
hAdd:
    cmp byte[operand1], "Q"
    je hAdd_elseIf
    cmp byte[operand1], "D"
    je hAdd_elseIf
    cmp byte[operand1], "W"
    je hAdd_elseIf
    cmp byte[operand1], "B"
    je hAdd_elseIf
    cmp byte[operand1], 0
    je hAdd_else
    copyWithOut0M d000000, opcode
    call hSR
    jmp printResult
hAdd_elseIf: 
    copyWithOut0M d000000, opcode
    copyEndWith0M operand0, temp
    copyEndWith0M operand1, operand0
    copyEndWith0M temp, operand1
    call hSR
    mov byte[opcode_d], "1"
    jmp printResult
hAdd_else:
    cmp byte[operand0], "Q"
    je hAdd_else_else
    cmp byte[operand0], "D"
    je hAdd_else_else
    cmp byte[operand0], "W"
    je hAdd_else_else
    cmp byte[operand0], "B"
    je hAdd_else_else
    isInM operand0, accumulators
    jnc hAdd_else_else
    cmp qword[im], 127
    jng hAdd_else_else
    cmp qword[opSz], 64
    jne hAdd_else_opSzIsnt64
    mov byte[hasRex], 1
    mov byte[rex_w], "1"
hAdd_else_opSzIsnt64:
    copyWithOut0M d000001, opcode
    mov byte[opcode_d], "0"
    mov byte[opcode_w], "0"
    cmp qword[opSz], 8
    je hAdd_else_opSzIs8
    mov byte[opcode_w], "1"
hAdd_else_opSzIs8:
    normalizeM qword[im], qword 32, dataField
    jmp printResult
hAdd_else_else:
    copyWithOut0M d100000, opcode
    copyWithOut0M d000, reg
    call hSI
    jmp printResult
;
hAdc:
    cmp byte[operand1], "Q"
    je hAdc_elseIf
    cmp byte[operand1], "D"
    je hAdc_elseIf
    cmp byte[operand1], "W"
    je hAdc_elseIf
    cmp byte[operand1], "B"
    je hAdc_elseIf
    cmp byte[operand1], 0
    je hAdc_else
    copyWithOut0M d000100, opcode
    call hSR
    jmp printResult
hAdc_elseIf:
    copyWithOut0M d000100, opcode
    copyEndWith0M operand0, temp
    copyEndWith0M operand1, operand0
    copyEndWith0M temp, operand1
    call hSR
    mov byte[opcode_d], "1"
    jmp printResult
hAdc_else:
    cmp byte[operand0], "Q"
    je hAdc_else_else
    cmp byte[operand0], "D"
    je hAdc_else_else
    cmp byte[operand0], "W"
    je hAdc_else_else
    cmp byte[operand0], "B"
    je hAdc_else_else
    isInM operand0, accumulators
    jnc hAdc_else_else
    cmp qword[im], 127
    jng hAdc_else_else
    cmp qword[opSz], 64
    jne hAdc_else_opSzIsnt64
    mov byte[hasRex], 1
    mov byte[rex_w], "1"
hAdc_else_opSzIsnt64:
    copyWithOut0M d000101, opcode
    mov byte[opcode_d], "0"
    mov byte[opcode_w], "0"
    cmp qword[opSz], 8
    je hAdc_else_opSzIs8
    mov byte[opcode_w], "1"
hAdc_else_opSzIs8:
    normalizeM qword[im], qword 32,dataField
    jmp printResult
hAdc_else_else:
    copyWithOut0M d100000, opcode 
    copyWithOut0M d010, reg
    call hSI
    jmp printResult
;
hSub:
    cmp byte[operand1], "Q"
    je hSub_elseIf
    cmp byte[operand1], "D"
    je hSub_elseIf
    cmp byte[operand1], "W"
    je hSub_elseIf
    cmp byte[operand1], "B"
    je hSub_elseIf
    cmp byte[operand1], 0
    je hSub_else
    copyWithOut0M d001010, opcode
    call hSR
    jmp printResult
hSub_elseIf:
    copyWithOut0M d001010, opcode
    copyEndWith0M operand0, temp
    copyEndWith0M operand1, operand0
    copyEndWith0M temp, operand1
    call hSR
    mov byte[opcode_d], "1"
    jmp printResult
hSub_else:
    cmp byte[operand0], "Q"
    je hSub_else_else
    cmp byte[operand0], "D"
    je hSub_else_else
    cmp byte[operand0], "W"
    je hSub_else_else
    cmp byte[operand0], "B"
    je hSub_else_else
    isInM operand0, accumulators
    jnc hSub_else_else
    cmp qword[im], 127
    jng hSub_else_else
    cmp qword[opSz], 64
    jne hSub_else_opSzIsnt64
    mov byte[hasRex], 1
    mov byte[rex_w], "1"
hSub_else_opSzIsnt64:
    copyWithOut0M d001011, opcode
    mov byte[opcode_d], "0"
    mov byte[opcode_w], "0"
    cmp qword[opSz], 8
    je hSub_else_opSzIs8
    mov byte[opcode_w], "1"
hSub_else_opSzIs8:
    normalizeM qword[im], qword 32, dataField
    jmp printResult
hSub_else_else:
    copyWithOut0M d100000, opcode
    copyWithOut0M d101, reg
    call hSI
    jmp printResult
;
hSbb:
    cmp byte[operand1], "Q"
    je hSbb_elseIf
    cmp byte[operand1], "D"
    je hSbb_elseIf
    cmp byte[operand1], "W"
    je hSbb_elseIf
    cmp byte[operand1], "B"
    je hSbb_elseIf
    cmp byte[operand1], 0
    je hSbb_else
    copyWithOut0M d000110, opcode
    call hSR
    jmp printResult
hSbb_elseIf:
    copyWithOut0M d000110, opcode
    copyEndWith0M operand0, temp
    copyEndWith0M operand1, operand0
    copyEndWith0M temp, operand1
    call hSR
    mov byte[opcode_d], "1"
    jmp printResult
hSbb_else:
    cmp byte[operand0], "Q"
    je hSbb_else_else
    cmp byte[operand0], "D"
    je hSbb_else_else
    cmp byte[operand0], "W"
    je hSbb_else_else
    cmp byte[operand0], "B"
    je hSbb_else_else
    isInM operand0, accumulators
    jnc hSbb_else_else
    cmp qword[im], 127
    jng hSbb_else_else
    cmp qword[opSz], 64
    jne hSbb_else_opSzIsnt64
    mov byte[hasRex], 1
    mov byte[rex_w], "1"
hSbb_else_opSzIsnt64:
    copyWithOut0M d000111, opcode
    mov byte[opcode_d], "0"
    mov byte[opcode_w], "0"
    cmp qword[opSz], 8
    je hSbb_else_opSzIs8
    mov byte[opcode_w], "1"
hSbb_else_opSzIs8:
    normalizeM qword[im], qword 32, dataField
    jmp printResult
hSbb_else_else:
    copyWithOut0M d100000, opcode
    copyWithOut0M d011, reg
    call hSI
    jmp printResult
;
hAnd:
    cmp byte[operand1], "Q"
    je hAnd_elseIf
    cmp byte[operand1], "D"
    je hAnd_elseIf
    cmp byte[operand1], "W"
    je hAnd_elseIf
    cmp byte[operand1], "B"
    je hAnd_elseIf
    cmp byte[operand1], 0
    je hAnd_else
    call copyWithOut0M d001000, opcode
    call hSR
    jmp printResult
hAnd_elseIf:
    copyWithOut0M d001000, opcode
    copyEndWith0M operand0, temp
    copyEndWith0M operand1, operand0
    copyEndWith0M temp, operand1
    call hSR
    mov byte[opcode_d], "1"
    jmp printResult
hAnd_else:
    cmp byte[operand0], "Q"
    je hAnd_else_else
    cmp byte[operand0], "D"
    je hAnd_else_else
    cmp byte[operand0], "W"
    je hAnd_else_else
    cmp byte[operand0], "B"
    je hAnd_else_else
    isInM operand0, accumulators
    jnc hAnd_else_else
    cmp qword[im], 127
    jng hAnd_else_else
    cmp qword[opSz], 64
    jne hAnd_else_opSzIsnt64
    mov byte[hasRex], 1
    mov byte[rex_w], "1"
hAnd_else_opSzIsnt64:
    copyWithOut0M d001001, opcode
    mov byte[opcode_d], "0"
    mov byte[opcode_w], "0"
    cmp qword[opSz], 8
    je hAnd_else_opSzIs8
    mov byte[opcode_w], "1"
hAnd_else_opSzIs8:
    normalizeM qword[im], qword 32, dataField
    jmp printResult
hAnd_else_else:
    copyWithOut0M d100000, opcode
    copyWithOut0M d100, reg
    call hSI
    jmp printResult
;
hOr:
    cmp byte[operand1], "Q"
    je hOr_elseIf
    cmp byte[operand1], "D"
    je hOr_elseIf
    cmp byte[operand1], "W"
    je hOr_elseIf
    cmp byte[operand1], "B"
    je hOr_elseIf
    cmp byte[operand1], 0
    je hOr_else
    copyWithOut0M d000010, opcode
    call hSR
    jmp printResult
hOr_elseIf:
    copyWithOut0M d000010, opcode
    copyEndWith0M operand0, temp
    copyEndWith0M operand1, operand0
    copyEndWith0M temp, operand1
    call hSR
    mov byte[opcode_d], "1"
    jmp printResult
hOr_else:
    cmp byte[operand0], "Q"
    je hOr_else_else
    cmp byte[operand0], "D"
    je hOr_else_else
    cmp byte[operand0], "W"
    je hOr_else_else
    cmp byte[operand0], "B"
    je hOr_else_else
    isInM operand0, accumulators
    jnc hOr_else_else
    cmp qword[im], 127
    jng hOr_else_else
    cmp qword[opSz], 64
    jne hOr_else_opSzIsnt64
    mov byte[hasRex], 1
    mov byte[rex_w], "1"
hOr_else_opSzIsnt64:
    copyWithOut0M d000011, opcode
    mov byte[opcode_d], "0"
    mov byte[opcode_w], "0"
    cmp qword[opSz], 8
    je hOr_else_opSzIs8
    mov byte[opcode_w], "1"
hOr_else_opSzIs8:
    normalizeM qword[im], qword 32, dataField
    jmp printResult
hOr_else_else:
    copyWithOut0M d100000, opcode
    copyWithOut0M d001, reg
    call hSI
    jmp printResult
;
hXor:
    cmp byte[operand1], "Q"
    je hXor_elseIf
    cmp byte[operand1], "D"
    je hXor_elseIf
    cmp byte[operand1], "W"
    je hXor_elseIf
    cmp byte[operand1], "B"
    je hXor_elseIf
    cmp byte[operand1], 0
    je hXor_else
    copyWithOut0M d001100, opcode
    call hSR
    jmp printResult
hXor_elseIf:
    copyWithOut0M d001100, opcode
    copyEndWith0M operand0, temp
    copyEndWith0M operand1, operand0
    copyEndWith0M temp, operand1
    call hSR
    mov byte[opcode_d], "1"
    jmp printResult
hXor_else:
    cmp byte[operand0], "Q"
    je hXor_else_else
    cmp byte[operand0], "D"
    je hXor_else_else
    cmp byte[operand0], "W"
    je hXor_else_else
    cmp byte[operand0], "B"
    je hXor_else_else
    isInM operand0, accumulators
    jnc hXor_else_else
    cmp qword[im], 127
    jng hXor_else_else
    cmp qword[opSz], 64
    jne hXor_else_opSzIsnt64
    mov byte[hasRex], 1
    mov byte[rex_w], "1"
hXor_else_opSzIsnt64:
    copyWithOut0M d001101, opcode
    mov byte[opcode_d], "0"
    mov byte[opcode_w], "0"
    cmp qword[opSz], 8
    je hXor_else_opSzIs8
    mov byte[opcode_w], "1"
hXor_else_opSzIs8:
    normalizeM qword[im], qword 32, dataField
    jmp printResult
hXor_else_else:
    copyWithOut0M d100000, opcode
    copyWithOut0M d110, reg
    call hSI
    jmp printResult
;
hDec:
    copyWithOut0M d111111, opcode
    copyWithOut0M d001, reg
    call hSO
    jmp printResult
;
hInc:
    copyWithOut0M d111111, opcode 
    copyWithOut0M d000, reg
    call hSO
    jmp printResult
;
hCmp:
    cmp byte[operand1], "Q"
    je hCmp_elseIf
    cmp byte[operand1], "D"
    je hCmp_elseIf
    cmp byte[operand1], "W"
    je hCmp_elseIf
    cmp byte[operand1], "B"
    je hCmp_elseIf
    cmp byte[operand1], 0
    je hCmp_else
    copyWithOut0M d001110, opcode
    call hSR
    jmp printResult
hCmp_elseIf:
    copyWithOut0M d001110, opcode
    copyEndWith0M operand0, temp
    copyEndWith0M operand1, operand0
    copyEndWith0M temp, operand1
    call hSR
    mov byte[opcode_d], "1"
    jmp printResult
hCmp_else:
    cmp byte[operand0], "Q"
    je hCmp_else_else
    cmp byte[operand0], "D"
    je hCmp_else_else
    cmp byte[operand0], "W"
    je hCmp_else_else
    cmp byte[operand0], "B"
    je hCmp_else_else
    isInM operand0, accumulators
    jnc hCmp_else_else
    cmp qword[im], 127
    jng hCmp_else_else
    cmp qword[opSz], 64
    jne hCmp_else_opSzIsnt64
    mov byte[hasRex], 1
    mov byte[rex_w], "1"
hCmp_else_opSzIsnt64:
    copyWithOut0M d001111, opcode
    mov byte[opcode_d], "0"
    mov byte[opcode_w], "0"
    cmp qword[opSz], 8
    je hCmp_else_opSzIs8
    mov byte[opcode_w], "1"
hCmp_else_opSzIs8:
    normalizeM qword[im], qword 32, dataField
    jmp printResult
hCmp_else_else:
    copyWithOut0M d100000, opcode
    copyWithOut0M d111, reg
    call hSI
    jmp printResult
;
hTest:
    cmp byte[operand1], "Q"
    je hTest_elseIf
    cmp byte[operand1], "D"
    je hTest_elseIf
    cmp byte[operand1], "W"
    je hTest_elseIf
    cmp byte[operand1], "B"
    je hTest_elseIf
    cmp byte[operand1], 0
    je hTest_else
    copyWithOut0M d100001, opcode
    call hSR
    jmp printResult
hTest_elseIf:
    copyWithOut0M d100001, opcode
    copyEndWith0M operand0, temp
    copyEndWith0M operand1, operand0
    copyEndWith0M temp, operand1
    call hSR
    mov byte[opcode_d], "1"
    jmp printResult
hTest_else:
    cmp byte[operand0], "Q"
    je hTest_else_else
    cmp byte[operand0], "D"
    je hTest_else_else
    cmp byte[operand0], "W"
    je hTest_else_else
    cmp byte[operand0], "B"
    je hTest_else_else
    isInM operand0, accumulators
    jnc hTest_else_else
    cmp qword[im], 127
    jng hTest_else_else
    cmp qword[opSz], 64
    jne hTest_else_opSzIsnt64
    mov byte[hasRex], 1
    mov byte[rex_w], "1"
hTest_else_opSzIsnt64:
    copyWithOut0M d101010, opcode
    mov byte[opcode_d], "0"
    mov byte[opcode_w], "0"
    cmp qword[opSz], 8
    je hTest_else_opSzIs8
    mov byte[opcode_w], "1"
hTest_else_opSzIs8:
    normalizeM qword[im], qword 32, dataField
    jmp printResult
hTest_else_else:
    copyWithOut0M d111101, opcode
    copyWithOut0M d000, reg
    call hSI
    jmp printResult
;
hXchg:
    copyWithOut0M d100001, opcode
    cmp byte[operand1], "Q"
    je hXchg_swap
    cmp byte[operand1], "D"
    je hXchg_swap
    cmp byte[operand1], "W"
    je hXchg_swap
    cmp byte[operand1], "B"
    je hXchg_swap
    jmp hXchg_itsFine
hXchg_swap:
    copyEndWith0M operand0, temp
    copyEndWith0M operand1, operand0
    copyEndWith0M temp, operand1
hXchg_itsFine:
    call hSR
    mov byte[opcode_d], "1"
    jmp printResult
;
hXadd:
    mov byte[hasOpE], 1
    copyWithOut0M d00001111, opcodeE
    copyWithOut0M d110000, opcode
    call hSR
    mov byte[opcode_d], "0"
    jmp printResult
;
hImul:
    cmp qword[numberOfOperands], 2
    jne hImul_numberOfOperandsIs1
    cmp byte[operand1], "Q"
    je hImul_secondOpIsMem
    cmp byte[operand1], "D"
    je hImul_secondOpIsMem
    cmp byte[operand1], "W"
    je hImul_secondOpIsMem
    cmp byte[operand1], "B"
    je hImul_secondOpIsMem
    mov byte[hasOpE], 1
    copyWithOut0M d00001111, opcodeE
    copyWithOut0M d101011, opcode
    copyEndWith0M operand0, temp
    copyEndWith0M operand1, operand0
    copyEndWith0M temp, operand1
    call hSR
    mov byte[opcode_d], "1"
    mov byte[opcode_w], "1"
    jmp printResult
hImul_secondOpIsMem:
    mov byte[hasOpE], 1
    copyWithOut0M d00001111, opcodeE
    copyWithOut0M d101011, opcode
    copyEndWith0M operand0, temp
    copyEndWith0M operand1, operand0
    copyEndWith0M temp, operand1
    call hSR
    mov byte[opcode_d], "1"
    jmp printResult
hImul_numberOfOperandsIs1:
    copyWithOut0M d111101, opcode
    call hSO
    mov byte[opcode_d], "1"
    copyWithOut0M d101, reg
    jmp printResult
;
hIdiv:
    copyWithOut0M d111101, opcode
    copyWithOut0M d111, reg
    call hSO
    mov byte[opcode_d], "1"
    jmp printResult
;
hBsf:
    cmp byte[operand0], "Q"
    je hBsf_firstOpIsMem
    cmp byte[operand0], "D"
    je hBsf_firstOpIsMem
    cmp byte[operand0], "W"
    je hBsf_firstOpIsMem
    cmp byte[operand0], "B"
    je hBsf_firstOpIsMem
    copyEndWith0M operand0, temp
    copyEndWith0M operand1, operand0
    copyEndWith0M temp, operand1
hBsf_firstOpIsMem:
    mov byte[hasOpE], 1
    copyWithOut0M d00001111, opcodeE
    copyWithOut0M d101111, opcode
    call hSR
    mov byte[opcode_d], "0"
    mov byte[opcode_w], "0"
    jmp printResult
;
hBsr:
    cmp byte[operand0], "Q"
    je hBsr_firstOpIsMem
    cmp byte[operand0], "D"
    je hBsr_firstOpIsMem
    cmp byte[operand0], "W"
    je hBsr_firstOpIsMem
    cmp byte[operand0], "B"
    je hBsr_firstOpIsMem
    copyEndWith0M operand0, temp
    copyEndWith0M operand1, operand0
    copyEndWith0M temp, operand1
hBsr_firstOpIsMem:
    mov byte[hasOpE], 1
    copyWithOut0M d00001111, opcodeE
    copyWithOut0M d101111, opcode
    call hSR
    mov byte[opcode_d], "0"
    mov byte[opcode_w], "1"
    jmp printResult
;
hJmp:
    copyWithOut0M d111111, opcode
    call hSO
    mov byte[opcode_d], "1"
    mov byte[opcode_w], "1"
    mov byte[hasRex], 1
    mov byte[rex_w], "0"
    copyWithOut0M d100, reg
    jmp printResult
;
hJ:
    mov byte[hasOpE], 1
    copyWithOut0M d00001111, opcodeE
    copyWithOut0M d1000, temp
    normalizeM qword[im], qword 32, disField
    getValueM instruction + 1, tttn, temp1
    copyWithOut0M temp1, temp + 4
    jmp printResult
;
hShl:
    cmp qword[numberOfOperands], 1
    jne hShl_if
    cmp qword[im], 1
    je hShl_if
    jmp hShl_elseIf
hShl_if:
    copyWithOut0M d110100, opcode
    copyWithOut0M d100, reg
    call hSO
    mov byte[opcode_d], "0"
    jmp printResult
hShl_elseIf:
    cmp qword[numberOfOperands], 2
    jne hShl_else
    cmp byte[operand1], "c"
    jne hShl_else
    copyWithOut0M d110100, opcode
    copyWithOut0M d100, reg
    call hSO
    mov byte[opcode_d], "1"
    jmp printResult
hShl_else:
    copyWithOut0M d110000, opcode
    copyWithOut0M d100, reg
    call hSO
    mov byte[opcode_d], "0"
    normalizeM qword[im], qword 8, dataField
    jmp printResult
;
hShr:
    cmp qword[numberOfOperands], 1
    jne hShr_if
    cmp qword[im], 1
    je hShr_if
    jmp hShr_elseIf
hShr_if:
    copyWithOut0M d110100, opcode
    copyWithOut0M d101, reg
    call hSO
    mov byte[opcode_d], "0"
    jmp printResult
hShr_elseIf:
    cmp qword[numberOfOperands], 2
    jne hShr_else
    cmp byte[operand1], "c"
    jne hShr_else
    copyWithOut0M d110100, opcode
    copyWithOut0M d101, reg
    call hSO
    mov byte[opcode_d], "1"
    jmp printResult
hShr_else:
    copyWithOut0M d110000, opcode 
    copyWithOut0M d101, reg
    call hSO
    mov byte[opcode_d], "0"
    normalizeM qword[im], qword 8, dataField
    jmp printResult
;
hNeg:
    copyWithOut0M d111101, opcode
    copyWithOut0M d011, reg
    call hSO
    mov byte[opcode_d], "1"
    jmp printResult
;
hNot:
    copyWithOut0M d111101, opcode
    copyWithOut0M d010, reg
    call hSO
    mov byte[opcode_d], "1"
    jmp printResult
;
hCall:
    copyWithOut0M d11101000, opcode
    normalizeM qword[im], qword 32, disField
    jmp printResult
;
hRet:
    copyWithOut0M d11000010, opcode
    normalizeM qword[im], 16, disField
    jmp printResult
;
hPush:
    cmp byte[operand0], "Q"
    je hPush_elseIf
    cmp byte[operand0], "D"
    je hPush_elseIf
    cmp byte[operand0], "W"
    je hPush_elseIf
    cmp byte[operand0], "B"
    je hPush_elseIf
    cmp byte[operand0], 0
    je hPush_else
    copyWithOut0M d01010, temp
    getValueM operand0, registersTable, temp + 5
    cmp qword[opSz], 64
    jne hPush_If_opSzIsnt64
    mov byte[hasRex], 1
    mov byte[rex_w], "1"
hPush_If_opSzIsnt64:
    isInM operand0, newRegisters
    jnc printResult
    mov byte[hasRex], 1
    mov byte[rex_b], "1"
    jmp printResult
hPush_elseIf:
    copyWithOut0M d111111, opcode
    copyWithOut0M d110, reg
    call hSO
    mov byte[hasRex], 0
    mov byte[opcode_d], "1"
    mov byte[opcode_w], "1"
    jmp printResult
hPush_else:
    copyWithOut0M d011010, opcode
    mov byte[opcode_d], "0"
    mov byte[opcode_w], "0"
    normalizeM qword[im], qword[imSz], dataField
    jmp printResult
;
hPop:
    cmp byte[operand0], "Q"
    je hPop_else
    cmp byte[operand0], "D"
    je hPop_else
    cmp byte[operand0], "W"
    je hPop_else
    cmp byte[operand0], "B"
    je hPop_else
    cmp byte[operand0], 0
    je hPop_else
    copyWithOut0M d01011, temp
    getValueM operand0, registersTable, temp + 5
    cmp qword[opSz], 64
    jne hPop_If_opSzIsnt64
    mov byte[hasRex], 1
    mov byte[rex_w], "1"
hPop_If_opSzIsnt64:
    isInM operand0, newRegisters
    jnc printResult
    mov byte[hasRex], 1
    mov byte[rex_b], "1"
    jmp printResult
hPop_else:
    copyWithOut0M d100011, opcode
    copyWithOut0M d000, reg
    call hSO
    mov byte[hasRex], 0
    mov byte[opcode_d], "1"
    mov byte[opcode_w], "1"
    jmp printResult