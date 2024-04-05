
Single_OpCodes_table = {
    "11111001": "stc",
    "11111000": "clc",
    "11111101": "std",
    "11111100": "cld",
    "0000111100000101": "syscall",
    "11000011": "ret"
}

Registers_table = {
    64: {
        "0000": "rax",
        "0001": "rcx",
        "0010": "rdx",
        "0011": "rbx",
        "0100": "rsp",
        "0101": "rbp",
        "0110": "rsi",
        "0111": "rdi",
        "1000": "r8",
        "1001": "r9",
        "1010": "r10",
        "1011": "r11",
        "1100": "r12",
        "1101": "r13",
        "1110": "r14",
        "1111": "r15"
    },

    32: {
        "0000": "eax",
        "0001": "ecx",
        "0010": "edx",
        "0011": "ebx",
        "0100": "esp",
        "0101": "ebp",
        "0110": "esi",
        "0111": "edi",
        "1000": "r8d",
        "1001": "r9d",
        "1010": "r10d",
        "1011": "r11d",
        "1100": "r12d",
        "1101": "r13d",
        "1110": "r14d",
        "1111": "r15d"
    },

    16: {
        "0000": "ax",
        "0001": "cx",
        "0010": "dx",
        "0011": "bx",
        "0100": "sp",
        "0101": "bp",
        "0110": "si",
        "0111": "di",
        "1000": "r8w",
        "1001": "r9w",
        "1010": "r10w",
        "1011": "r11w",
        "1100": "r12w",
        "1101": "r13w",
        "1110": "r14w",
        "1111": "r15w"
    },

    8: {
        "0000": "al",
        "0001": "cl",
        "0010": "dl",
        "0011": "bl",
        "0100": "ah",
        "0101": "ch",
        "0110": "dh",
        "0111": "bh",
        "1000": "r8b",
        "1001": "r9b",
        "1010": "r10b",
        "1011": "r11b",
        "1100": "r12b",
        "1101": "r13b",
        "1110": "r14b",
        "1111": "r15b"
    }
}

OpCode_2_table = {
    "100010": "mov",
    "000000": "add",
    "000100": "adc",
    "001010": "sub",
    "000110": "sbb",
    "001000": "and",
    "000010": "or",
    "001100": "xor",
    "001110": "cmp",
    "100001": "null",
    "1000010": "test",
    "1000011": "xchg",
    "00001111110000": "xadd",
    "00001111101011": "imul",
    "000011111011110": "bsf",
    "000011111011111": "bsr",
}

OpCode_2e_table = ["110000", "101011", "101111"]

OpCode_im_table = {
    "110001": {
        "000": "mov"
    },
    "100000": {
        "000": "add",
        "010": "adc",
        "101": "sub",
        "011": "sbb",
        "100": "and",
        "001": "or",
        "110": "xor",
        "111":  "cmp"
    },
    "111101": {
        "000": "test",
        "101": "imul",
        "111": "idiv",
        "011": "neg",
        "010": "not"
    },
    "111111": {
        "001": "dec",
        "000": "inc",
        "100": "jmp",
        "110": "push",
        "010": "call"
    },
    "110000": {
        "100": "shl",
        "101": "shr"
    },
    "110100": {
        "100": "shl",
        "101": "shr"
    },
    "100011": {
        "000": "pop"
    }
}

Size_Identifier = {
    8: "BYTE",
    16: "WORD",
    32: "DWORD",
    64: "QWORD"
}

Scale_map = {
    "00": "1",
    "01": "2",
    "10": "4",
    "11": "8"
}

Its_ax = {
    "0000010": "add",
    "0001010": "adc",
    "0010110": "sub",
    "0001110": "sbb",
    "0010010": "and",
    "0000110": "or",
    "0011010": "xor",
    "0011110": "cmp",
    "1010100": "test"
}

tttn = {
    "0000": "o",
    "0001": "no",
    "0010": "b",
    "0011": "ae",
    "0100": "e",
    "0101": "ne",
    "0110": "be",
    "0111": "a",
    "1000": "s",
    "1001": "ns",
    "1010": "p",
    "1011": "np",
    "1100": "l",
    "1101": "ge",
    "1110": "le",
    "1111": "g"
}


Op_sz = [8, 16, 32, 64]
Ad_sz = [32, 64]
Di_sz = [8, 32]
result = {"Rex_R": "0", "Rex_X": "0", "Rex_B": "0", "OpCode": ""}

Op1 = ""
Op2 = ""


def Get_Input():
    inp = input()
    ret = bin(int(inp, 16))[2:]
    for i in range(len(inp)):
        if inp[i] == "0":
            ret = "0000" + ret
        else:
            break
    while len(ret) % 4 != 0:
        ret = "0" + ret
    return ret


def Find_Dis(sz):
    global Machin_Code
    ret = ""
    for i in range(sz - 8, -1, -8):
        if i > len(Machin_Code) - 1:
            continue
        ret += Machin_Code[i:i + 8]
    Machin_Code = Machin_Code[sz:]
    return str(hex(int(ret, 2)))


def Handle_2_Op():
    global Machin_Code, Op_sz, Ad_sz, Di_sz
    result["Mod"] = Machin_Code[0:2]
    result["Reg"] = Machin_Code[2:5]
    result["RM"] = Machin_Code[5:8]
    Machin_Code = Machin_Code[8:]
    print(OpCode_2_table[result["OpCode"]], end=" ")
    Op1 = Registers_table[Op_sz[0]][result["Rex_R"] + result["Reg"]]
    if result["Mod"] == "11":
        Op2 = Registers_table[Op_sz[0]][result["Rex_B"] + result["RM"]]
    elif result["Mod"] == "01" or result["Mod"] == "10":
        Di_sz = [8]
        if result["Mod"] == "10":
            Di_sz = [32]
        Op2 = Size_Identifier[Op_sz[0]] + " PTR ["
        if result["RM"] == "100":
            result["Scale"] = Machin_Code[0:2]
            result["Index"] = Machin_Code[2:5]
            result["Base"] = Machin_Code[5:8]
            Machin_Code = Machin_Code[8:]
            Op2 += Registers_table[Ad_sz[0]][result["Rex_B"] + result["Base"]]
            if result["Index"] == "100" and result["Rex_X"] == "0" and result["Scale"] == "00":
                pass
            else:
                Op2 += "+" + \
                    Registers_table[Ad_sz[0]][result["Rex_X"] +
                                              result["Index"]] + "*" + Scale_map[result["Scale"]]
            Op2 += "+" + Find_Dis(Di_sz[0]) + "]"
        else:
            result["Dis"] = Find_Dis(Di_sz[0])
            Op2 += Registers_table[Ad_sz[0]][result["Rex_B"] +
                                             result["RM"]] + "+" + result["Dis"] + "]"
    else:
        if result["RM"] == "100":
            result["Scale"] = Machin_Code[0:2]
            result["Index"] = Machin_Code[2:5]
            result["Base"] = Machin_Code[5:8]
            Machin_Code = Machin_Code[8:]
            if result["Base"] == "101":
                Di_sz = [32]
                if result["Index"] != "100":
                    Op2 = Size_Identifier[Op_sz[0]] + " PTR [" + \
                        Registers_table[Ad_sz[0]][result["Rex_X"] +
                                                  result["Index"]] + "*" + Scale_map[result["Scale"]] + "+" + Find_Dis(Di_sz[0]) + "]"
                else:
                    Op2 = Size_Identifier[Op_sz[0]] + \
                        " PTR [" + Find_Dis(Di_sz[0]) + "]"
            else:
                Op2 = Size_Identifier[Op_sz[0]] + " PTR [" + \
                    Registers_table[Ad_sz[0]][result["Rex_B"] + result["Base"]] + "+" + \
                    Registers_table[Ad_sz[0]][result["Rex_X"] + result["Index"]] + \
                    "*" + Scale_map[result["Scale"]] + "]"
        elif result["RM"] == "101":
            Op2 = Size_Identifier[Op_sz[0]] + \
                " PTR [" + Find_Dis(Di_sz[0]) + "]"
        else:
            Op2 = Size_Identifier[Op_sz[0]] + " PTR [" + \
                Registers_table[Ad_sz[0]][result["Rex_B"] + result["RM"]] + "]"

    if result["OpCode_D"] == "0":
        print(Op2 + "," + Op1, end="")
    else:
        print(Op1 + "," + Op2, end="")


def Handle_im_Op():
    global Machin_Code, Op_sz, Ad_sz, Di_sz
    result["Mod"] = Machin_Code[0:2]
    result["Reg"] = Machin_Code[2:5]
    result["RM"] = Machin_Code[5:8]
    Machin_Code = Machin_Code[8:]
    print(OpCode_im_table[result["OpCode"]][result["Reg"]], end=" ")
    if OpCode_im_table[result["OpCode"]][result["Reg"]] in ["jmp", "push", "pop", "call"]:
        if not(16 in Op_sz):
            Op_sz = [64]
    if result["Mod"] == "11":
        Op2 = Registers_table[Op_sz[0]][result["Rex_B"] + result["RM"]]
    elif result["Mod"] == "01" or result["Mod"] == "10":
        Di_sz = [8]
        if result["Mod"] == "10":
            Di_sz = [32]
        Op2 = Size_Identifier[Op_sz[0]] + " PTR ["
        if result["RM"] == "100":
            result["Scale"] = Machin_Code[0:2]
            result["Index"] = Machin_Code[2:5]
            result["Base"] = Machin_Code[5:8]
            Machin_Code = Machin_Code[8:]
            Op2 += Registers_table[Ad_sz[0]][result["Rex_B"] + result["Base"]]
            if result["Index"] == "100" and result["Rex_X"] == "0" and result["Scale"] == "00":
                pass
            else:
                Op2 += "+" + \
                    Registers_table[Ad_sz[0]][result["Rex_X"] +
                                              result["Index"]] + "*" + Scale_map[result["Scale"]]
            Op2 += "+" + Find_Dis(Di_sz[0]) + "]"
        else:
            result["Dis"] = Find_Dis(Di_sz[0])
            Op2 += Registers_table[Ad_sz[0]][result["Rex_B"] +
                                             result["RM"]] + "+" + result["Dis"] + "]"
    else:
        if result["RM"] == "100":
            result["Scale"] = Machin_Code[0:2]
            result["Index"] = Machin_Code[2:5]
            result["Base"] = Machin_Code[5:8]
            Machin_Code = Machin_Code[8:]
            if result["Base"] == "101":
                Di_sz = [32]
                if result["Index"] != "100":
                    Op2 = Size_Identifier[Op_sz[0]] + " PTR [" + \
                        Registers_table[Ad_sz[0]][result["Rex_X"] +
                                                  result["Index"]] + "*" + Scale_map[result["Scale"]] + "+" + Find_Dis(Di_sz[0]) + "]"
                else:
                    Op2 = Size_Identifier[Op_sz[0]] + \
                        " PTR [" + Find_Dis(Di_sz[0]) + "]"
            else:
                Op2 = Size_Identifier[Op_sz[0]] + " PTR [" + \
                    Registers_table[Ad_sz[0]][result["Rex_B"] + result["Base"]] + "+" + \
                    Registers_table[Ad_sz[0]][result["Rex_X"] + result["Index"]] + \
                    "*" + Scale_map[result["Scale"]] + "]"
        elif result["RM"] == "101":
            Op2 = Size_Identifier[Op_sz[0]] + \
                " PTR [" + Find_Dis(Di_sz[0]) + "]"
        else:
            Op2 = Size_Identifier[Op_sz[0]] + " PTR [" + \
                Registers_table[Ad_sz[0]][result["Rex_B"] + result["RM"]] + "]"

    if len(Machin_Code) > 0:
        print(Op2 + "," + Find_Dis(Op_sz[0]), end="")
    elif result["OpCode"] == "110100":
        if result["OpCode_D"] == "1":
            print(Op2 + "," + "cl", end="")
        else:
            print(Op2 + "," + "1", end="")
    else:
        print(Op2, end="")


Machin_Code = Get_Input()


if Machin_Code in Single_OpCodes_table:
    print(Single_OpCodes_table[Machin_Code])
    exit()

if Machin_Code[0:8] == "01100111":
    Ad_sz = [32]
    Machin_Code = Machin_Code[8:]
else:
    try:
        Ad_sz.remove(32)
    except ValueError:
        pass

if Machin_Code[0:8] == "01100110":
    Op_sz = [16]
    Machin_Code = Machin_Code[8:]
else:
    try:
        Op_sz.remove(16)
    except ValueError:
        pass

if Machin_Code[0:4] == "0100":
    Machin_Code = Machin_Code[4:]
    if Machin_Code[0] == "1":
        Op_sz = [64]
    result["Rex_R"] = Machin_Code[1]
    result["Rex_X"] = Machin_Code[2]
    result["Rex_B"] = Machin_Code[3]
    Machin_Code = Machin_Code[4:]
else:
    try:
        Op_sz.remove(64)
    except ValueError:
        pass

if Machin_Code[0:8] == "00001111":
    Machin_Code = Machin_Code[8:]
    result["OpCode"] = "00001111"

if Machin_Code[0:8] == "11101011" or Machin_Code[0:8] == "11101001":
    print("jmp", end=" ")
    Machin_Code = Machin_Code[8:]
    print(Find_Dis(32))
if result["OpCode"] != "" and Machin_Code[0:4] == "1000":
    print("j" + tttn[Machin_Code[4:8]], end=" ")
    Machin_Code = Machin_Code[8:]
    print(Find_Dis(32))
elif Machin_Code[0:8] == "11101000":
    print("call", end=" ")
    Machin_Code = Machin_Code[8:]
    print(Find_Dis(32))
elif Machin_Code[0:8] == "11000010":
    print("ret", end=" ")
    Machin_Code = Machin_Code[8:]
    print(Find_Dis(32))
elif Machin_Code[0:5] == "01010":
    print("push", end=" ")
    if not(16 in Op_sz):
        Op_sz = [64]
    else:
        Op_sz = [16]
    print(Registers_table[Op_sz[0]][result["Rex_B"] + Machin_Code[5:]])
elif Machin_Code[0:6] == "011010" and Machin_Code[7] == "0":
    print("push", end=" ")
    Machin_Code = Machin_Code[8:]
    print(Find_Dis(32))
elif Machin_Code[0:6] == "011010" and Machin_Code[7] == "1":
    try:
        Op_sz.remove(8)
    except ValueError:
        pass
    result["OpCode"] = "00001111101011"
    result["OpCode_D"] = "1"
    result["OpCode_W"] = "1"
    Machin_Code = Machin_Code[8:]
    Handle_2_Op()
    print("," + Find_Dis(32))
elif Machin_Code[0:5] == "01011":
    print("pop", end=" ")
    if not(16 in Op_sz):
        Op_sz = [64]
    else:
        Op_sz = [16]
    print(Registers_table[Op_sz[0]][result["Rex_B"] + Machin_Code[5:]])
elif Machin_Code[0:4] == "1011" and result["OpCode"] == "":
    print("mov", end=" ")
    result["OpCode_W"] = Machin_Code[4]
    result["Reg"] = Machin_Code[5:8]
    Machin_Code = Machin_Code[8:]
    if result["OpCode_W"] == "0":
        Op_sz = [8]
    else:
        try:
            Op_sz.remove(8)
        except ValueError:
            pass
    print(Registers_table[Op_sz[0]]
          [result["Rex_B"] + result["Reg"]], end=",")
    print(Find_Dis(Op_sz[0]))
elif Machin_Code[0:5] == "10010":
    print("xchg", end=" ")
    result["OpCode_W"] = "1"
    result["Reg"] = Machin_Code[5:8]
    Machin_Code = Machin_Code[8:]
    if result["OpCode_W"] == "0":
        Op_sz = [8]
    else:
        try:
            Op_sz.remove(8)
        except ValueError:
            pass
    print(Registers_table[Op_sz[0]]
          [result["Rex_B"] + result["Reg"]], end=",")
    print(Registers_table[Op_sz[0]]["0000"])
elif Machin_Code[0:7] in Its_ax.keys():
    print(Its_ax[Machin_Code[0:7]], end=" ")
    result["OpCode_W"] = Machin_Code[7]
    result["Reg"] = "000"
    Machin_Code = Machin_Code[8:]
    if result["OpCode_W"] == "0":
        Op_sz = [8]
    else:
        try:
            Op_sz.remove(8)
        except ValueError:
            pass
    print(Registers_table[Op_sz[0]]
          [result["Rex_B"] + result["Reg"]], end=",")
    print(Find_Dis(Op_sz[0]))
elif Machin_Code[0:6] in OpCode_2_table.keys() or (Machin_Code[0:6] in OpCode_2e_table and result["OpCode"] != ""):
    result["OpCode"] += Machin_Code[0:6]
    result["OpCode_D"] = Machin_Code[6]
    result["OpCode_W"] = Machin_Code[7]
    if result["OpCode"] == "100001":
        result["OpCode"] += result["OpCode_D"]
        result["OpCode_D"] = "0"
    if result["OpCode"] == "00001111101111":
        result["OpCode"] += result["OpCode_W"]
        result["OpCode_W"] = "1"
        result["OpCode_D"] = "1"
    if result["OpCode_W"] == "0":
        Op_sz = [8]
    else:
        try:
            Op_sz.remove(8)
        except ValueError:
            pass
    Machin_Code = Machin_Code[8:]
    Handle_2_Op()
elif Machin_Code[0:6] in OpCode_im_table.keys():
    result["OpCode"] = Machin_Code[0:6]
    result["OpCode_D"] = Machin_Code[6]
    result["OpCode_W"] = Machin_Code[7]
    if result["OpCode_W"] == "0":
        Op_sz = [8]
    else:
        try:
            Op_sz.remove(8)
        except ValueError:
            pass
    Machin_Code = Machin_Code[8:]
    Handle_im_Op()
