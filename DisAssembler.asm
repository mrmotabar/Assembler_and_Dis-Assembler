%include "in_out.asm"

section .data
    pNl db 10, 0
    pSpace db " ", 0
    pComma db ",", 0
    pSum db "+", 0
    pMul db "*", 0
    pOne db "1", 0
    pJ db "j", 0

    mapBin2hex db "0123456789ABCDEF"
    one dq 1

    dcl db "cl", 0

    d00 db "00 ", 0
    d01 db "01 ", 0
    d10 db "10 ", 0
    d11 db "11 ", 0

    d000 db "000 ", 0
    d001 db "001 ", 0
    d010 db "010 ", 0
    d011 db "011 ", 0
    d100 db "100 ", 0
    d101 db "101 ", 0
    d110 db "110 ", 0
    d111 db "111 ", 0

    d0000 dq "0000 ", 0
    d0100 db "0100 ", 0
    d1000 db "1000 ", 0
    d1011 db "1011 ", 0

    d01010 db "01010 ", 0
    d01011 db "01011 ", 0
    d10010 db "10010 ", 0

    d000000 db "000000 ", 0
    d000001 db "000001 ", 0
    d000010 db "000010 ", 0
    d000011 db "000011 ", 0
    d000100 db "000100 ", 0
    d000101 db "000101 ", 0
    d000110 db "000110 ", 0
    d000111 db "000111 ", 0
    d001000 db "001000 ", 0
    d001001 db "001001 ", 0
    d001010 db "001010 ", 0
    d001011 db "001011 ", 0
    d001100 db "001100 ", 0
    d001101 db "001101 ", 0
    d001110 db "001110 ", 0
    d001111 db "001111 ", 0
    d011010 db "011010 ", 0
    d100000 db "100000 ", 0
    d100001 db "100001 ", 0
    d100010 db "100010 ", 0
    d100011 db "100011 ", 0
    d101010 db "101010 ", 0
    d101011 db "101011 ", 0
    d101111 db "101111 ", 0
    d110000 db "110000 ", 0
    d110001 db "110001 ", 0
    d110100 db "110100 ", 0
    d111101 db "111101 ", 0
    d111111 db "111111 ", 0

    d00000000 db "00000000 ", 0
    d00001111 db "00001111 ", 0
    d11000010 db "11000010 ", 0
    d11101000 db "11101000 ", 0
    d11101001 db "11101001 ", 0
    d11101011 db "11101011 ", 0

    d00001111101011 db "00001111101011 ", 0
    d00001111101111 db "00001111101111 ", 0


    dQWORD db "QWORD", 0
    dDWORD db "DWORD", 0
    ddWORD db "WORD", 0
    dBYTE db "BYTE", 0
    dPTR db " PTR [", 0

    convertHelper db "0:0000 1:0001 2:0010 3:0011 4:0100 5:0101 6:0110 7:0111 8:1000 9:1001 "
                  db "a:1010 b:1011 c:1100 d:1101 e:1110 f:1111 ", 0

    soloTable db "11111001:stc 11111000:clc 11111101:std 11111100:cld 0000111100000101:syscall 11000011:ret ", 0
    soloTableKey db "11111001 11111000 11111101 11111100 0000111100000101 11000011 ", 0

    opcode2Table db "100010:mov 000000:add 000100:adc 001010:sub 000110:sbb 001000:and 000010:or 001100:xor "
                 db "001110:cmp 100001:n 1000010:test 1000011:xchg 00001111110000:xadd 00001111101011:imul "
                 db "000011111011110:bsf 000011111011111:bsr ", 0
    opcode2TableKey db "100010 000000 000100 001010 000110 001000 000010 001100 "
                    db "001110 100001 1000010 1000011 00001111110000 00001111101011 "
                    db "000011111011110 000011111011111 ", 0
    opcode2ETable db "110000 101011 101111 ", 0

    registersTable64 db "0000:rax 0001:rcx 0010:rdx 0011:rbx 0100:rsp 0101:rbp 0110:rsi 0111:rdi 1000:r8 1001:r9 "
                     db "1010:r10 1011:r11 1100:r12 1101:r13 1110:r14 1111:r15 ", 0
    registersTable32 db "0000:eax 0001:ecx 0010:edx 0011:ebx 0100:esp 0101:ebp 0110:esi 0111:edi 1000:r8d 1001:r9d "
                     db "1010:r10d 1011:r11d 1100:r12d 1101:r13d 1110:r14d 1111:r15d ", 0
    registersTable16 db "0000:ax 0001:cx 0010:dx 0011:bx 0100:sp 0101:bp 0110:si 0111:di 1000:r8w 1001:r9w "
                     db "1010:r10w 1011:r11w 1100:r12w 1101:r13w 1110:r14w 1111:r15w ", 0
    registersTable8 db "0000:al 0001:cl 0010:dl 0011:bl 0100:ah 0101:ch 0110:dh 0111:bh 1000:r8b 1001:r9b "
                     db "1010:r10b 1011:r11b 1100:r12b 1101:r13b 1110:r14b 1111:r15b ", 0

    scaleMap db "00:1 01:2 10:4 11:8 ", 0

    opcodeImTable110001 db "000:mov ", 0
    opcodeImTable100000 db "000:add 010:adc 101:sub 011:sbb 100:and 001:or 110:xor 111:cmp ", 0
    opcodeImTable111101 db "000:test 101:imul 111:idiv 011:neg 010:not ", 0
    opcodeImTable111111 db "001:dec 000:inc 100:jmp 110:push 010:call", 0
    opcodeImTable110000 db "100:shl 101:shr ", 0
    opcodeImTable110100 db "100:shl 101:shr ", 0
    opcodeImTable100011 db "000:pop ", 0
    opcodeImTableKey db "110001 100000 111101 111111 110000 110100 100011 ", 0

    tttn db "0000:o 0001:no 0010:b 0011:ae 0100:e 0101:ne 0110:be 0111:a 1000:s 1001:ns "
         db "1010:p 1011:np 1100:l 1101:ge 1110:le 1111:g ", 0
    
    itsAx db "0000010:add 0001010:adc 0010110:sub 0001110:sbb 0010010:and 0000110:or "
          db "0011010:xor 0011110:cmp 1010100:test ", 0
    itsAxKey db "0000010 0001010 0010110 0001110 0010010 0000110 "
             db "0011010 0011110 1010100 ", 0

    jppc db "jmp push pop call ", 0 

    pre66 db "01100110 ", 0
    pre67 db "01100111 ", 0

    opSz dq 8, 16, 32, 64
    adSz dq 32, 64
    diSz dq 8, 32

    hasOpE db 0

    imOp db 0

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

    ;input db "", NL
    ;code db "111111110000110010011001", 0
    SFD dq 0
    DFD dq 0
    firstFile db "first-file.txt", 0
section .bss
    temp resb 100
    temp1 resb 100
    temp2 resb 100

    input resb 100
    code resb 100

    operand0 resb 100
    operand1 resb 100

    rex_w resb 1
    rex_r resb 1
    rex_x resb 1
    rex_b resb 1
    opcode resb 20
    opcode_d resb 1
    opcode_w resb 1
    mod resb 10
    reg resb 10
    rm resb 10
    scale resb 10
    index resb 10
    base resb 10

    filePath resb 100

section .text
    global _start

%macro print 1
    mov rdi, %1
    call GetStrlen
    mov rax, sys_write
    mov rdi, [DFD]
    mov rsi, %1
    syscall
%endmacro

%macro pChar 1
    mov rax, sys_write
    mov rdi, [DFD]
    mov rsi, %1
    mov rdx, 1
    syscall
%endmacro 

%macro debug 1
    push rax
    mov rax, %1
    call writeNum
    call newLine
    pop rax
%endmacro

%macro firstNotZero 2
    mov %2, 0
    push r8
    mov r8, %1
%%L1:
    cmp qword[r8], 0
    jne %%found
    add r8, 8
    jmp %%L1
%%found:
    mov %2, qword[r8]
    pop r8
%endmacro

%macro witchRegTable 2
    cmp qword[%1], 64 
    je %%its64
    cmp qword[%1], 32
    je %%its32
    cmp qword[%1], 16 
    je %%its16
    cmp qword[%1], 8
    je %%its8
%%its64:
    mov %2, registersTable64
    jmp %%end
%%its32:
    mov %2, registersTable32
    jmp %%end
%%its16:
    mov %2, registersTable16
    jmp %%end
%%its8:
    mov %2, registersTable8
    jmp %%end
%%end:
%endmacro

%macro witchImTable 2
    isInM %1, d110001
    jc %%itis110001
    isInM %1, d100000
    jc %%itis100000
    isInM %1, d111101
    jc %%itis111101
    isInM %1, d111111
    jc %%itis111111
    isInM %1, d110000
    jc %%itis110000
    isInM %1, d110100
    jc %%itis110100
    isInM %1, d100011
    jc %%itis100011
%%itis110001:
    mov %2, opcodeImTable110001
    jmp %%end
%%itis100000:
    mov %2, opcodeImTable100000
    jmp %%end
%%itis111101:
    mov %2, opcodeImTable111101
    jmp %%end
%%itis111111:
    mov %2, opcodeImTable111111
    jmp %%end
%%itis110000:
    mov %2, opcodeImTable110000
    jmp %%end
%%itis110100:
    mov %2, opcodeImTable110100
    jmp %%end
%%itis100011:
    mov %2, opcodeImTable100011
    jmp %%end
%%end:
%endmacro

%macro sizeIdentifier 1
    cmp qword[opSz], 64 
    je %%its64
    cmp qword[opSz], 32
    je %%its32
    cmp qword[opSz], 16 
    je %%its16
    cmp qword[opSz], 8
    je %%its8
%%its64:
    mov %1, dQWORD
    jmp %%end
%%its32:
    mov %1, dDWORD
    jmp %%end
%%its16:
    mov %1, ddWORD
    jmp %%end
%%its8:
    mov %1, dBYTE
    jmp %%end
%%end:
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
%macro bin2hexM 2
    push %1
    push %2
    call bin2hex
%endmacro
%macro findDisM 2
    push %1
    push %2
    call findDis
%endmacro
%macro getSliceM 4
    push %1
    push %2
    push %3
    push %4
    call getSlice
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
;az avali ta dovomi dar sevomi berize dar chaharomi (baz baste)
getSlice:
    enter 0, 0
    push rax
    push r8
    push r9
    push r10
    push r11
    mov r8, [rbp + 40]
    mov r9, [rbp + 32]
    mov r10, [rbp + 24]
    mov r11, [rbp + 16]
    add r9, r10
    add r10, r8
getSlice_L1:
    cmp byte[r10], 0
    je getSlice_L1F
    cmp r10, r9
    je getSlice_L1F
    mov al, byte[r10]
    mov byte[r11], al
    inc r10
    inc r11
    jmp getSlice_L1
getSlice_L1F:
    mov byte[r11], 0
    pop r11
    pop r10
    pop r9
    pop r8
    pop rax
    leave
    ret 32
;
convert2bin:
    push r8
    push r9
    push rax
    mov r8, input
    mov r9, code
convert2bin_L1:
    cmp byte[r8], NL
    je convert2bin_L1F
    mov al, byte[r8]
    mov byte[temp], al
    getValueM temp, convertHelper, r9
    add r9, 4
    inc r8
    jmp convert2bin_L1
convert2bin_L1F:
    mov byte[r9], 0
    pop rax
    pop r9
    pop r8
    ret
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
;tabdil dis be tartib mamooli be andaze avali dar dovomi
findDis:
    enter 0, 0
    push r8
    push r9
    push r10
    push rax
    mov r8, [rbp + 24]
    mov r9, temp1
    add r8, rbx
    sub r8, 8
findDis_L1:
    cmp r8, rbx
    jl findDis_L1F
    cmp byte[r8], 0
    je findDis_L1_continue
    getSliceM qword 0, qword 8, r8, r9
    add r9, 8
    sub r8, 8
    jmp findDis_L1
findDis_L1_continue:
    sub r8, 8
    jmp findDis_L1
findDis_L1F:
    mov byte[r9], 0
    bin2hexM temp1, temp2
    mov r8, [rbp + 16]
    mov byte[r8], "0"
    inc r8
    mov byte[r8], "x"
    inc r8
    mov r9, temp2
    mov r10, 0
findDis_L2:
    cmp byte[r9], 0
    je findDis_end
    cmp byte[r9], "0"
    je findDis_L2_0
    mov r10, 1
    mov al, byte[r9]
    mov byte[r8], al
    inc r8
    inc r9
    jmp findDis_L2
findDis_L2_0:
    inc r9
    cmp r10, 1
    jne findDis_L2
    mov al, byte[r9 - 1]
    mov byte[r8], al
    inc r8
    jmp findDis_L2
findDis_end:
    cmp byte[r8 - 1], "x"
    je findDis_itIsZero
    mov byte[r8], 0 
    mov r15, r8
    pop rax
    pop r10
    pop r9
    pop r8
    leave
    ret 16
findDis_itIsZero:
    mov byte[r8], "0"
    inc r8
    jmp findDis_end
;
reset:
    mov rbx, code
    mov byte[rex_r], "0"
    mov byte[rex_x], "0"
    mov byte[rex_b], "0"
    mov qword[opSz], 8
    mov qword[opSz + 8], 16
    mov qword[opSz + 16], 32
    mov qword[opSz + 24], 64
    mov qword[adSz], 32
    mov qword[adSz + 8], 64
    mov qword[diSz], 8
    mov qword[diSz + 8], 32
    mov byte[hasOpE], 0
    mov byte[imOp], 0

    resetArray temp, 100
    resetArray temp1, 100
    resetArray temp2, 100
    resetArray operand0, 100
    resetArray operand1, 100
    resetArray opcode, 22
    resetArray mod, 30
    resetArray scale, 30
    ret
;

readLine:
    push rax
    push rdi
    push rsi
    push rdx
    push r8
    mov r8, code
readLine_L1:
    mov     rax, sys_read
    mov     rdi, [SFD]
    mov     rsi, r8 
    mov     rdx, 1
    syscall
    cmp rax, 0
    je exit
    cmp byte[r8], NL
    je readLine_L1F
    inc r8
    jmp readLine_L1
readLine_L1F:
    mov byte[r8], 0
    pop r8
    pop rdx
    pop rsi
    pop rdi
    pop rax
    ret
;
_start:
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
    mov [DFD], rax

findCommand:
    call reset
    call readLine
    ;call convert2bin
    isInM rbx, soloTableKey
    jc thisIsSolo
    getSliceM qword 0, qword 8, rbx, temp
    isInM temp, pre67
    jnc doesntHave67
    add rbx, 8
    jmp check66
doesntHave67:
    mov qword[adSz], 0
check66:
    getSliceM qword 0, qword 8, rbx, temp

    isInM temp, pre66
    jnc doesntHave66
    mov qword[opSz], 0
    add rbx, 8
    jmp checkRex
doesntHave66:
    mov qword[opSz + 8], 0
checkRex:
    getSliceM qword 0, qword 4, rbx, temp
    isInM temp, d0100
    jnc doesntHaveRex
    add rbx, 4
    mov al, byte[rbx + 1]
    mov byte[rex_r], al
    mov al, byte[rbx + 2]
    mov byte[rex_x], al
    mov al, byte[rbx + 3]
    mov byte[rex_b], al
    add rbx, 4
    cmp byte[rbx - 4], "1"
    jne checkOpE
    mov qword[opSz], 0
    mov qword[opSz + 8], 0
    mov qword[opSz + 16], 0
    jmp checkOpE
doesntHaveRex:
checkOpE:
    getSliceM qword 0, qword 8, rbx, temp
    isInM temp, d00001111
    jnc checkOp
    add rbx, 8
    copyWithOut0M d00001111, opcode
    mov byte[hasOpE], 1
checkOp:
    firstNotZero opSz, rax
    mov [opSz], rax
    firstNotZero adSz, rax
    mov [adSz], rax
    
    getSliceM qword 0, qword 8, rbx, temp
    isInM temp, d11101011
    jc itsJmp
    isInM temp, d11101001
    jc itsJmp
    cmp byte[hasOpE], 0
    je itsNotJttn
    getSliceM qword 0, qword 4, rbx, temp
    isInM temp, d1000
    jnc itsNotJttn
    jmp itsJtttn
itsNotJttn:
    getSliceM qword 0, qword 8, rbx, temp
    isInM temp, d11101000
    jc itsCall
    isInM temp, d11000010
    jc itsRet
    getSliceM qword 0, qword 5, rbx, temp
    isInM temp, d01010
    jc itsPushReg
    getSliceM qword 0, qword 6, rbx, temp
    isInM temp, d011010
    jnc itsNotPushDis
    cmp byte[rbx + 7], "0"
    jne itsNotPushDis
    jmp itsPushDis
itsNotPushDis:
    getSliceM qword 0, qword 6, rbx, temp
    isInM temp, d011010
    jnc itsNotImul
    cmp byte[rbx + 7], "1"
    jne itsNotImul
    jmp itsImul
itsNotImul:
    getSliceM qword 0, qword 5, rbx, temp
    isInM temp, d01011
    jc itsPop
    getSliceM qword 0, qword 4, rbx, temp
    isInM temp, d1011
    jnc itsNotMovA
    cmp byte[opcode], 0
    jne itsNotMovA
    jmp itsMovA
itsNotMovA:
    getSliceM qword 0, qword 5, rbx, temp
    isInM temp, d10010
    jc itsXchgA
    getSliceM qword 0, qword 7, rbx, temp
    isInM temp, itsAxKey
    jc hAx

    getSliceM qword 0, qword 6, rbx, temp
    isInM temp, opcode2TableKey
    jc itsTwoOp
    isInM temp, opcode2ETable
    jnc itsNotTwoOp
    cmp byte[opcode], 0
    je itsNotTwoOp
    jmp itsTwoOp
itsNotTwoOp:
    getSliceM qword 0, qword 6, rbx, temp
    isInM temp, opcodeImTableKey
    jc itsSoloOrIm
exit:
    mov     rax, sys_close
    mov     rdi, [SFD]
    syscall
    mov     rax, sys_close
    mov     rdi, [DFD]
    syscall
    mov     rax, sys_exit
    mov     rdi, 0
    syscall

thisIsSolo:
    getValueM code, soloTable, temp
    print temp
    pChar pNl
    jmp findCommand
;
handleTwoOp:
    getSliceM qword 0, qword 2, rbx, mod
    getSliceM qword 2, qword 5, rbx, reg
    getSliceM qword 5, qword 8, rbx, rm
    add rbx, 8
    getValueM opcode, opcode2Table, temp
    print temp
    pChar pSpace
    mov al, byte[rex_r]
    mov byte[temp], al
    copyM reg, temp + 1
    witchRegTable opSz, rax
    getValueM temp, rax, operand0
handleTwoOp_checkMod:
    isInM mod, d11
    jnc handleTwoOp_modIsnt11
    mov al, byte[rex_b]
    mov byte[temp], al
    copyM rm, temp + 1
    witchRegTable opSz, rax
    getValueM temp, rax, operand1
    mov rdx, r15
    jmp handleTwoOp_print
handleTwoOp_modIsnt11:
    isInM mod, d00
    jc handleTwoOp_modIs00
    mov qword[diSz], 8
    isInM mod, d10
    jnc handleTwoOp_modIsnt10
    mov qword[diSz], 32
handleTwoOp_modIsnt10:
    sizeIdentifier rax
    copyM rax, operand1
    mov rdx, r15
    copyEndWith0M dPTR, rdx
    mov rdx, r15
    isInM rm, d100
    jnc handleTwoOp_elseIf_rmIsnt100
    getSliceM qword 0, qword 2, rbx, scale
    getSliceM qword 2, qword 5, rbx, index
    getSliceM qword 5, qword 8, rbx, base
    add rbx, 8
    mov al, byte[rex_b]
    mov byte[temp], al
    copyM base, temp+ + 1
    witchRegTable adSz, rax
    getValueM temp, rax, rdx
    mov rdx, r15
    isInM index, d100
    jnc handleTwoOp_hasIndex
    cmp byte[rex_x], "0"
    jne handleTwoOp_hasIndex
    isInM scale, d00
    jnc handleTwoOp_hasIndex
    jmp handleTwoOp_ope1_end
handleTwoOp_hasIndex:
    mov byte[rdx], "+"
    inc rdx
    mov al, byte[rex_x]
    mov byte[temp], al
    copyM index, temp+ + 1
    witchRegTable adSz, rax
    getValueM temp, rax, rdx
    mov rdx, r15
    mov byte[rdx], "*"
    inc rdx
    getValueM scale, scaleMap, rdx
    mov rdx, r15
handleTwoOp_ope1_end:
    mov byte[rdx], "+"
    inc rdx
    findDisM qword[diSz], rdx
    mov rdx, r15
    mov byte[rdx], "]"
    inc rdx
    jmp handleTwoOp_print
handleTwoOp_elseIf_rmIsnt100:
    mov al, byte[rex_b]
    mov byte[temp], al
    copyM rm, temp + 1
    witchRegTable adSz, rax
    getValueM temp, rax, rdx
    mov rdx, r15
    mov byte[rdx], "+"
    inc rdx
    findDisM qword[diSz], rdx
    mov rdx, r15
    mov byte[rdx], "]"
    inc rdx
    jmp handleTwoOp_print
handleTwoOp_modIs00:
    isInM rm, d100
    jnc handleTwoOp_modIs00_elseIf
    getSliceM qword 0, qword 2, rbx, scale
    getSliceM qword 2, qword 5, rbx, index
    getSliceM qword 5, qword 8, rbx, base
    add rbx, 8
    isInM base, d101
    jnc handleTwoOp_modIs00_notException
    mov qword[diSz], 32
    isInM index, d100
    jc handleTwoOp_modIs00_indexIs100
    sizeIdentifier rax
    copyM rax, operand1
    mov rdx, r15
    copyEndWith0M dPTR, rdx
    mov rdx, r15
    mov al, byte[rex_x]
    mov byte[temp], al
    copyM index, temp + 1
    witchRegTable adSz, rax
    getValueM temp, rax, rdx
    mov rdx, r15
    mov byte[rdx], "*"
    inc rdx
    getValueM scale, scaleMap, rdx
    mov rdx, r15
    mov byte[rdx], "+"
    inc rdx
    findDisM qword[diSz], rdx
    mov rdx, r15
    mov byte[rdx], "]"
    inc rdx
    jmp handleTwoOp_print
handleTwoOp_modIs00_indexIs100:
    sizeIdentifier rax
    copyM rax, operand1
    mov rdx, r15
    copyEndWith0M dPTR, rdx
    mov rdx, r15
    findDisM qword[diSz], rdx
    mov rdx, r15
    mov byte[rdx], "]"
    inc rdx
    jmp handleTwoOp_print
handleTwoOp_modIs00_notException:
    sizeIdentifier rax
    copyM rax, operand1
    mov rdx, r15
    copyEndWith0M dPTR, rdx
    mov rdx, r15
    mov al, byte[rex_b]
    mov byte[temp], al
    copyM base, temp + 1
    witchRegTable adSz, rax
    getValueM temp, rax, rdx
    mov rdx, r15
    mov byte[rdx], "+"
    inc rdx
    mov al, byte[rex_x]
    mov byte[temp], al
    copyM index, temp + 1
    witchRegTable adSz, rax
    getValueM temp, rax, rdx
    mov rdx, r15
    mov byte[rdx], "*"
    inc rdx
    getValueM scale, scaleMap, rdx
    mov rdx, r15
    mov byte[rdx], "]"
    inc rdx
    jmp handleTwoOp_print
handleTwoOp_modIs00_elseIf:
    isInM rm, d101
    jnc handleTwoOp_modIs00_else
    sizeIdentifier rax
    copyM rax, operand1
    mov rdx, r15
    copyEndWith0M dPTR, rdx
    mov rdx, r15
    findDisM qword[diSz], rdx
    mov rdx, r15
    mov byte[rdx], "]"
    inc rdx
    jmp handleTwoOp_print
handleTwoOp_modIs00_else:
    sizeIdentifier rax
    copyM rax, operand1
    mov rdx, r15
    copyEndWith0M dPTR, rdx
    mov rdx, r15
    mov al, byte[rex_b]
    mov byte[temp], al
    copyM rm, temp + 1
    witchRegTable adSz, rax 
    getValueM temp, rax, rdx
    mov rdx, r15
    mov byte[rdx], "]"
    inc rdx
    jmp handleTwoOp_print
handleTwoOp_print:
    cmp byte[imOp], 1
    je handleTwoOp_end
    cmp byte[opcode_d], "0"
    jne handleTwoOp_print_rev
    print operand1
    pChar pComma
    print operand0
    jmp handleTwoOp_end
handleTwoOp_print_rev:
    print operand0
    pChar pComma
    print operand1
    jmp handleTwoOp_end
handleTwoOp_end:
    ret
;
handleImOp:

    getSliceM qword 0, qword 2, rbx, mod
    getSliceM qword 2, qword 5, rbx, reg
    getSliceM qword 5, qword 8, rbx, rm
    add rbx, 8
    
    witchImTable opcode, rax
    getValueM reg, rax, temp
    print temp
    pChar pSpace
    isInM temp, jppc
    jnc handleImOp_continue
    cmp qword[opSz + 8], 0
    jne handleImOp_continue
    mov qword[opSz], 64
handleImOp_continue:
    mov byte[imOp], 1
    call handleTwoOp_checkMod
    jmp handleImOp_print
handleImOp_print:
    cmp byte[rbx], 0
    je handleImOp_itIsSingleOp
    mov byte[rdx], ","
    inc rdx
    findDisM qword 64, rdx
    mov rdx, r15
    print operand1
    ret

handleImOp_itIsSingleOp:
    isInM opcode, d110100
    jc handleImOp_itIsShift
    print operand1
    ret
handleImOp_itIsShift:
    print operand1
    pChar pComma
    cmp byte[opcode_d], "1"
    jne handleImOp_itIsShift_1
    print dcl
    ret
handleImOp_itIsShift_1:
    pChar pOne
    ret

;
itsJmp:
    print isJmp
    add rbx, 8
    findDisM qword 32, temp
    print temp
    pChar pNl
    jmp findCommand
;
itsJtttn:
    pChar pJ
    getSliceM qword 4, qword 8, rbx, temp
    getValueM temp, tttn, temp1
    print temp1
    pChar pSpace
    add rbx, 8
    findDisM qword 32, temp
    print temp
    pChar pNl
    jmp findCommand
;
itsCall:
    print isCall
    add rbx, 8
    findDisM qword 32, temp
    print temp
    pChar pNl
    jmp findCommand
;
itsRet:
    print isRet
    add rbx, 8
    findDisM qword 32, temp
    print temp
    pChar pNl
    jmp findCommand
;
itsPushReg:
    print isPush
    mov al, byte[rex_b]
    mov byte[temp], al
    add rbx, 5
    copyM rbx, temp + 1
    witchRegTable opSz, rax
    getValueM temp, rax, temp1
    print temp1
    pChar pNl
    jmp findCommand
;
itsPushDis:
    print isPush
    add rbx, 8
    findDisM qword 32, temp
    print temp
    pChar pNl
    jmp findCommand
;
itsImul:
    mov qword[opSz], 0
    firstNotZero opSz, rax
    mov [opSz], rax
    copyM d00001111101011, opcode
    mov byte[opcode_d], "1"
    mov byte[opcode_w], "1"
    add rbx, 8
    call handleTwoOp
    pChar pComma
    findDisM qword 32, temp
    print temp
    pChar pNl
    jmp findCommand
;
itsPop:
    print isPop
    mov al, byte[rex_b]
    mov byte[temp], al
    add rbx, 5
    copyM rbx, temp + 1
    witchRegTable opSz, rax
    getValueM temp, rax, temp1
    print temp1
    pChar pNl
    jmp findCommand
;
itsMovA:
    print isMov
    mov al, byte[rbx + 4]
    mov byte[opcode_w], al
    getSliceM qword 5, qword 8, rbx, reg
    add rbx, 8
    cmp byte[opcode_w], "0"
    jne itsMovA_opNot8
    mov qword[opSz], 8
    jmp itsMovA_continue
itsMovA_opNot8:
    mov qword[opSz], 0
    firstNotZero opSz, rax
    mov [opSz], rax
itsMovA_continue:
    mov al, byte[rex_b]
    mov byte[temp], al
    copyM reg, temp + 1
    witchRegTable opSz, rax
    getValueM temp, rax, temp1
    print temp1
    pChar pComma
    findDisM qword[opSz], temp
    print temp
    pChar pNl
    jmp findCommand
;
itsXchgA:
    print isXchg
    mov byte[opcode_w], "1"
    getSliceM qword 5, qword 8, rbx, reg
    add rbx, 8
    cmp byte[opcode_w], "0"
    jne itsXchgA_opNot8
    mov qword[opSz], 8
    jmp itsXchgA_continue
itsXchgA_opNot8:
    mov qword[opSz], 0
    firstNotZero opSz, rax
    mov [opSz], rax
itsXchgA_continue:
    mov al, byte[rex_b]
    mov byte[temp], al
    copyM reg, temp + 1
    witchRegTable opSz, rax
    getValueM temp, rax, temp1
    print temp1
    pChar pComma
    witchRegTable opSz, rax
    getValueM d0000, rax, temp1
    print temp1
    pChar pNl
    jmp findCommand
;
hAx:
    getSliceM qword 0, qword 7, rbx, temp
    getValueM temp, itsAx, temp1
    print temp1
    pChar pSpace
    mov al, byte[rbx + 7]
    mov byte[opcode_w], al
    copyM d000, reg
    add rbx, 8
    cmp byte[opcode_w], "0"
    jne hAx_opNot8
    mov qword[opSz], 8
    jmp hAx_continue
hAx_opNot8:
    mov qword[opSz], 0
    firstNotZero opSz, rax
    mov [opSz], rax
hAx_continue:
    mov al, byte[rex_b]
    mov byte[temp], al
    copyM reg, temp + 1
    witchRegTable opSz, rax
    getValueM temp, rax, temp1
    print temp1
    pChar pComma
    findDisM qword 32, temp
    print temp
    pChar pNl
    jmp findCommand
;
itsTwoOp:
    mov rax, 0
    cmp byte[hasOpE], 1
    jne itsTwoOp_doesntHaveE
    getSliceM qword 0, qword 6, rbx, temp
    copyM temp, opcode + 8
    mov r13, r15
    jmp itsTwoOp_opF
itsTwoOp_doesntHaveE:
    getSliceM qword 0, qword 6, rbx, temp
    copyM temp, opcode
    mov r13, r15
itsTwoOp_opF:
    mov al, byte[rbx + 6]
    mov byte[opcode_d], al
    mov al, byte[rbx + 7]
    mov byte[opcode_w], al
    isInM opcode, d100001
    jnc itsTwoOp_opIsnt100001
    mov al, byte[opcode_d]
    mov byte[r13], al
    inc r13
    mov byte[r13], 0
    mov byte[opcode_d], "0"
itsTwoOp_opIsnt100001:
    isInM opcode, d00001111101111
    jnc itsTwoOp_opIsnt00001111101111
    mov al, byte[opcode_w]
    mov byte[r13], al
    inc r13
    mov byte[r13], 0
    mov byte[opcode_d], "1"
    mov byte[opcode_w], "1"
itsTwoOp_opIsnt00001111101111:
    cmp byte[opcode_w], "0"
    jne itsTwoOp_opSzIsnt8
    mov qword[opSz], 8
    jmp itsTwoOp_continue
itsTwoOp_opSzIsnt8:
    mov qword[opSz], 0
    firstNotZero opSz, rax
    mov [opSz], rax
itsTwoOp_continue:
    add rbx, 8
    call handleTwoOp
    pChar pNl
    jmp findCommand
;
itsSoloOrIm:
    getSliceM qword 0, qword 6, rbx, opcode
    mov al, byte[rbx + 6]
    mov byte[opcode_d], al
    mov al, byte[rbx + 7]
    mov byte[opcode_w], al
    cmp byte[opcode_w], "0"
    jne itsSoloOrIm_opSzIsnt8
    mov qword[opSz], 8
    jmp itsSoloOrIm_continue
itsSoloOrIm_opSzIsnt8:
    mov qword[opSz], 0
    firstNotZero opSz, rax
    mov [opSz], rax
itsSoloOrIm_continue:
    add rbx, 8
    call handleImOp
    pChar pNl
    jmp findCommand