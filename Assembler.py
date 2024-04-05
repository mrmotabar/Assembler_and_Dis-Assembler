result = {}

Single_OpCodes_table = {
    "stc": "11111001",
    "clc": "11111000",
    "std": "11111101",
    "cld": "11111100",
    "syscall": "0000111100000101",
}

Registers_table = {
    "null": ("101", 0),
    "rax": ("000", 64),
    "eax": ("000", 32),
    "ax": ("000", 16),
    "al": ("000", 8),
    "rcx": ("001", 64),
    "ecx": ("001", 32),
    "cx": ("001", 16),
    "cl": ("001", 8),
    "rdx": ("010", 64),
    "edx": ("010", 32),
    "dx": ("010", 16),
    "dl": ("010", 8),
    "rbx": ("011", 64),
    "ebx": ("011", 32),
    "bx": ("011", 16),
    "bl": ("011", 8),
    "rsp": ("100", 64),
    "esp": ("100", 32),
    "sp": ("100", 16),
    "ah": ("100", 8),
    "rbp": ("101", 64),
    "ebp": ("101", 32),
    "bp": ("101", 16),
    "ch": ("101", 8),
    "rsi": ("110", 64),
    "esi": ("110", 32),
    "si": ("110", 16),
    "dh": ("110", 8),
    "rdi": ("111", 64,),
    "edi": ("111", 32),
    "di": ("111", 16),
    "bh": ("111", 8),
    "r8": ("000", 64),
    "r8d": ("000", 32),
    "r8w": ("000", 16),
    "r8b": ("000", 8),
    "r9": ("001", 64),
    "r9d": ("001", 32),
    "r9w": ("001", 16),
    "r9b": ("001", 8),
    "r10": ("010", 64),
    "r10d": ("010", 32),
    "r10w": ("010", 16),
    "r10b": ("010", 8),
    "r11": ("011", 64),
    "r11d": ("011", 32),
    "r11w": ("011", 16),
    "r11b": ("011", 8),
    "r12": ("100", 64),
    "r12d": ("100", 32),
    "r12w": ("100", 16),
    "r12b": ("100", 8),
    "r13": ("101", 64),
    "r13d": ("101", 32),
    "r13w": ("101", 16),
    "r13b": ("101", 8),
    "r14": ("110", 64),
    "r14d": ("110", 32),
    "r14w": ("110", 16),
    "r14b": ("110", 8),
    "r15": ("111", 64),
    "r15d": ("111", 32),
    "r15w": ("111", 16),
    "r15b": ("111", 8),
}

New_Registers = [
    "r8",
    "r8d",
    "r8w",
    "r8b",
    "r9",
    "r9d",
    "r9w",
    "r9b",
    "r10",
    "r10d",
    "r10w",
    "r10b",
    "r11",
    "r11d",
    "r11w",
    "r11b",
    "r12",
    "r12d",
    "r12w",
    "r12b",
    "r13",
    "r13d",
    "r13w",
    "r13b",
    "r14",
    "r14d",
    "r14w",
    "r14b",
    "r15",
    "r15d",
    "r15w",
    "r15b",
]

Size_Identifier = ["BYTE", "WORD", "DWORD", "QWORD"]
Size_Identifier_Map = {
    "QWORD": 64,
    "DWORD": 32,
    "WORD": 16,
    "BYTE": 8
}

Scale_Map = {"1": "00", "2": "01", "4": "10", "8": "11"}

tttn = {
    "o": "0000",
    "no": "0001",
    "b": "0010",
    "nae": "0010",
    "nb": "0011",
    "ae": "0011",
    "e": "0100",
    "z": "0100",
    "ne": "0101",
    "nz": "0101",
    "be": "0110",
    "na": "0110",
    "nbe": "0111",
    "a": "0111",
    "s": "1000",
    "ns": "1001",
    "p": "1010",
    "pe": "1010",
    "np": "1011",
    "po": "1011",
    "l": "1100",
    "nge": "1100",
    "nl": "1101",
    "ge": "1101",
    "le": "1110",
    "ng": "1110",
    "nle": "1111",
    "g": "1111"
}

Op_sz = 0
Ad_sz = 0
Di_sz = 0


def Parse_Instruction(Inp):
    Inp = Inp.split(" ", 1)
    if len(Inp) > 1:
        Inp[1] = Inp[1].split(",")
        for i in range(len(Inp[1])):
            Inp[1][i] = Inp[1][i].split()
        for i in range(len(Inp[1])):
            if Inp[1][i][0] in Size_Identifier:
                st = Inp[1][i][2][1:-1]
                ind1 = st.find("+")
                ind2 = st.find("*")
                if ind1 == -1:
                    if ind2 == -1:
                        if st[0] == "0":
                            Inp[1][i][2] = [
                                "null", "null", "null",
                                st[2:]
                            ]
                        else:
                            Inp[1][i][2] = [st, "null", "null", "null"]

                    else:
                        temp = st.split("*")
                        Inp[1][i][2] = [
                            "null", temp[0], temp[1], "null"]
                elif ind2 == -1:
                    temp = st.split("+")
                    Inp[1][i][2] = [
                        temp[0], "null", "null", temp[1][2:]]
                else:
                    if ind1 < ind2:
                        if st.count("+") == 2:
                            temp = (st.replace("*", "+")).split("+")
                            Inp[1][i][2] = [
                                temp[0],
                                temp[1],
                                temp[2],
                                temp[3][2:],
                            ]
                        else:
                            temp = (st.replace("*", "+")).split("+")
                            Inp[1][i][2] = [
                                temp[0], temp[1],
                                temp[2], "null"
                            ]
                    else:
                        temp = (st.replace("*", "+")).split("+")
                        Inp[1][i][2] = [
                            "null",
                            temp[0],
                            temp[1],
                            temp[2][2:],
                        ]
            elif not(Inp[1][i][0] in Registers_table.keys()):
                if Inp[1][i][0][0] == "0":
                    Inp[1][i][0] = Inp[1][i][0][2:]
                else:
                    Inp[1][i][0] = str(hex(int(Inp[1][i][0])))[2:]
    return Inp


def Make_MC():
    helper = ["67", "66", "Rex_Pre", "Rex_W", "Rex_R", "Rex_X", "Rex_B", "OpCodeE", "OpCode",
              "OpCode_D", "OpCode_W", "Mod", "Reg", "RM", "Scale", "Index", "Base", "Dis", "Data"]
    ret = ""
    if "Rex_Pre" in result.keys():
        if not("Rex_W" in result.keys()):
            result["Rex_W"] = "0"
        if not("Rex_R" in result.keys()):
            result["Rex_R"] = "0"
        if not("Rex_X" in result.keys()):
            result["Rex_X"] = "0"
        if not("Rex_B" in result.keys()):
            result["Rex_B"] = "0"
    for i in helper:
        if i in result.keys():
            ret += result[i]
    ret = Make_it_4(ret)
    for i in range(0, len(ret) - 3, 4):
        if ret[i] == ret[i + 1] == ret[i + 2] == ret[i + 3] == "0":
            print("0", end="")
        else:
            break
    return hex(int(ret, 2))[2:]


def Make_it_4(st):
    while len(st) % 4 != 0:
        st = "0" + st
    return st


def Normalize(H, Size):
    ret = ""
    while len(H) * 4 < Size:
        H = "0" + H
    for i in range(len(H) - 1, 0, -2):
        ret += Make_it_4(str(bin(int(H[i - 1], 16)))[2:])
        ret += Make_it_4(str(bin(int(H[i], 16)))[2:])
    return ret


def Handle_Second_Register():
    global Op_sz, Ad_sz, Di_sz
    result["OpCode_W"] = "0"
    if Op_sz != 8:
        result["OpCode_W"] = "1"
    result["OpCode_D"] = "0"
    result["Reg"] = Registers_table[Instruction[1][1][0]][0]
    if Instruction[1][1][0][0] == "r":
        result["Rex_Pre"] = "0100"
        result["Rex_W"] = "0"
        if Registers_table[Instruction[1][1][0]][1] == 64:
            result["Rex_W"] = "1"
        if Instruction[1][1][0] in New_Registers:
            result["Rex_R"] = "1"
    if Instruction[1][0][0] in Registers_table.keys():  # first is reg
        result["Mod"] = "11"
        result["RM"] = Registers_table[Instruction[1][0][0]][0]
        if Instruction[1][0][0] in New_Registers:
            result["Rex_Pre"] = "0100"
            result["Rex_B"] = "1"
    elif Instruction[1][0][0] in Size_Identifier:  # first is mem
        if Instruction[1][0][2][1] == "null" and Instruction[1][0][2][3] == "null":  # single base
            if Instruction[1][0][2][0] in ["rbp", "ebp", "bp", "ch"]:
                result["Mod"] = "01"
                result["RM"] = "101"
                result["Dis"] = "00000000"
            else:
                if Instruction[1][0][2][0] in New_Registers:
                    result["Rex_Pre"] = "0100"
                    result["Rex_B"] = "1"
                result["Mod"] = "00"
                result["RM"] = Registers_table[Instruction[1][0][2][0]][0]
        elif Instruction[1][0][2][0] != "null" and Instruction[1][0][2][1] == "null":
            if Di_sz == 8:
                result["Mod"] = "01"
            elif Di_sz == 32:
                result["Mod"] = "10"
            result["RM"] = Registers_table[Instruction[1][0][2][0]][0]
            if Instruction[1][0][2][0] in New_Registers:
                result["Rex_Pre"] = "0100"
                result["Rex_B"] = "1"
            result["Dis"] = Normalize(Instruction[1][0][2][3], Di_sz)
        else:
            if Di_sz == 8:
                result["Mod"] = "01"
            elif Di_sz == 32:
                result["Mod"] = "10"
            else:
                result["Mod"] = "00"
            if Instruction[1][0][2][0] == "null":
                result["Mod"] = "00"
                Di_sz = 32
            result["RM"] = "100"
            result["Base"] = Registers_table[Instruction[1][0][2][0]][0]
            if Instruction[1][0][2][0] in New_Registers:
                result["Rex_Pre"] = "0100"
                result["Rex_B"] = "1"
            if Instruction[1][0][2][1] == "null":  # no Index Scale
                result["Scale"] = "00"
                result["Index"] = "100"
                result["Dis"] = Normalize(Instruction[1][0][2][3], Di_sz)
            else:
                result["Scale"] = Scale_Map[Instruction[1][0][2][2]]
                result["Index"] = Registers_table[Instruction[1]
                                                  [0][2][1]][0]
                if Instruction[1][0][2][1] in New_Registers:
                    result["Rex_Pre"] = "0100"
                    result["Rex_X"] = "1"
                if Instruction[1][0][2][3] == "null":  # no Dis
                    result["Dis"] = Normalize("0", Di_sz)
                else:
                    result["Dis"] = Normalize(
                        Instruction[1][0][2][3], Di_sz)


def Handle_Second_Im():
    global Op_sz, Ad_sz, Di_sz
    result["OpCode_D"] = "1"
    if int(Instruction[1][0][0], 16) > 127 or Op_sz == 8:
        result["OpCode_D"] = "0"
    result["OpCode_W"] = "0"
    if Op_sz != 8:
        result["OpCode_W"] = "1"
    result["Data"] = Normalize(Instruction[1][1][0], 32)
    if Op_sz == 64:
        result["Rex_Pre"] = "0100"
        result["Rex_W"] = "1"
    if Instruction[1][0][0] in Registers_table.keys():
        result["Mod"] = "11"
        result["RM"] = Registers_table[Instruction[1][0][0]][0]
        if Instruction[1][0][0][0] == "r":
            result["Rex_Pre"] = "0100"
            result["Rex_W"] = "0"
            if Registers_table[Instruction[1][0][0]][1] == 64:
                result["Rex_W"] = "1"
            if Instruction[1][0][0] in New_Registers:
                result["Rex_B"] = "1"
    else:
        if Instruction[1][0][2][1] == "null" and Instruction[1][0][2][3] == "null":  # single base
            if Instruction[1][0][2][0] in ["rbp", "ebp", "bp", "ch"]:
                result["Mod"] = "01"
                result["RM"] = "101"
                result["Dis"] = "00000000"
            else:
                if Instruction[1][0][2][0] in New_Registers:
                    result["Rex_Pre"] = "0100"
                    result["Rex_B"] = "1"
                result["Mod"] = "00"
                result["RM"] = Registers_table[Instruction[1][0][2][0]][0]
        elif Instruction[1][0][2][0] != "null" and Instruction[1][0][2][1] == "null":
            if Di_sz == 8:
                result["Mod"] = "01"
            elif Di_sz == 32:
                result["Mod"] = "10"
            result["RM"] = Registers_table[Instruction[1][0][2][0]][0]
            if Instruction[1][0][2][0] in New_Registers:
                result["Rex_Pre"] = "0100"
                result["Rex_B"] = "1"
            result["Dis"] = Normalize(Instruction[1][0][2][3], Di_sz)
        else:
            if Di_sz == 8:
                result["Mod"] = "01"
            elif Di_sz == 32:
                result["Mod"] = "10"
            else:
                result["Mod"] = "00"
            if Instruction[1][0][2][0] == "null":
                result["Mod"] = "00"
                Di_sz = 32
            result["RM"] = "100"
            result["Base"] = Registers_table[Instruction[1][0][2][0]][0]
            if Instruction[1][0][2][0] in New_Registers:
                result["Rex_Pre"] = "0100"
                result["Rex_B"] = "1"
            if Instruction[1][0][2][1] == "null":  # no Index Scale
                result["Scale"] = "00"
                result["Index"] = "100"
                result["Dis"] = Normalize(Instruction[1][0][2][3], Di_sz)
            else:
                result["Scale"] = Scale_Map[Instruction[1][0][2][2]]
                result["Index"] = Registers_table[Instruction[1]
                                                  [0][2][1]][0]
                if Instruction[1][0][2][1] in New_Registers:
                    result["Rex_Pre"] = "0100"
                    result["Rex_X"] = "1"
                if Instruction[1][0][2][3] == "null":  # no Dis
                    result["Dis"] = Normalize("0", Di_sz)
                else:
                    result["Dis"] = Normalize(
                        Instruction[1][0][2][3], Di_sz)


def Handle_Single_Op():
    global Op_sz, Ad_sz, Di_sz
    result["OpCode_D"] = "1"
    result["OpCode_W"] = "0"
    if Op_sz != 8:
        result["OpCode_W"] = "1"
    if Op_sz == 64:
        result["Rex_Pre"] = "0100"
        result["Rex_W"] = "1"
    if Instruction[1][0][0] in Registers_table.keys():
        result["Mod"] = "11"
        result["RM"] = Registers_table[Instruction[1][0][0]][0]
        if Instruction[1][0][0][0] == "r":
            result["Rex_Pre"] = "0100"
            result["Rex_W"] = "0"
            if Registers_table[Instruction[1][0][0]][1] == 64:
                result["Rex_W"] = "1"
            if Instruction[1][0][0] in New_Registers:
                result["Rex_B"] = "1"
    else:
        if Instruction[1][0][2][1] == "null" and Instruction[1][0][2][3] == "null":  # single base
            if Instruction[1][0][2][0] in ["rbp", "ebp", "bp", "ch"]:
                result["Mod"] = "01"
                result["RM"] = "101"
                result["Dis"] = "00000000"
            else:
                if Instruction[1][0][2][0] in New_Registers:
                    result["Rex_Pre"] = "0100"
                    result["Rex_B"] = "1"
                result["Mod"] = "00"
                result["RM"] = Registers_table[Instruction[1][0][2][0]][0]
        elif Instruction[1][0][2][0] != "null" and Instruction[1][0][2][1] == "null":
            if Di_sz == 8:
                result["Mod"] = "01"
            elif Di_sz == 32:
                result["Mod"] = "10"
            result["RM"] = Registers_table[Instruction[1][0][2][0]][0]
            if Instruction[1][0][2][0] in New_Registers:
                result["Rex_Pre"] = "0100"
                result["Rex_B"] = "1"
            result["Dis"] = Normalize(Instruction[1][0][2][3], Di_sz)
        else:
            if Di_sz == 8:
                result["Mod"] = "01"
            elif Di_sz == 32:
                result["Mod"] = "10"
            else:
                result["Mod"] = "00"
            if Instruction[1][0][2][0] == "null":
                result["Mod"] = "00"
                Di_sz = 32
            result["RM"] = "100"
            result["Base"] = Registers_table[Instruction[1][0][2][0]][0]
            if Instruction[1][0][2][0] in New_Registers:
                result["Rex_Pre"] = "0100"
                result["Rex_B"] = "1"
            if Instruction[1][0][2][1] == "null":  # no Index Scale
                result["Scale"] = "00"
                result["Index"] = "100"
                result["Dis"] = Normalize(Instruction[1][0][2][3], Di_sz)
            else:
                result["Scale"] = Scale_Map[Instruction[1][0][2][2]]
                result["Index"] = Registers_table[Instruction[1]
                                                  [0][2][1]][0]
                if Instruction[1][0][2][1] in New_Registers:
                    result["Rex_Pre"] = "0100"
                    result["Rex_X"] = "1"
                if Instruction[1][0][2][3] == "null":  # no Dis
                    result["Dis"] = Normalize("0", Di_sz)
                else:
                    result["Dis"] = Normalize(
                        Instruction[1][0][2][3], Di_sz)


def Prep():
    global Op_sz, Ad_sz, Di_sz
    if len(Instruction) > 1:
        if Instruction[1][0][0] in Registers_table.keys():
            Op_sz = Registers_table[Instruction[1][0][0]][1]
        elif Instruction[1][0][0] in Size_Identifier:
            Op_sz = Size_Identifier_Map[Instruction[1][0][0]]
    elif len(Instruction[1]) > 1:
        if Instruction[1][1][0] in Registers_table.keys():
            Op_sz = Registers_table[Instruction[1][1][0]][1]
        elif Instruction[1][1][0] in Size_Identifier:
            Op_sz = Size_Identifier_Map[Instruction[1][1][0]]

    if len(Instruction) > 1 and Instruction[1][0][0] in Size_Identifier:
        if Instruction[1][0][2][0] != "null":
            Ad_sz = Registers_table[Instruction[1][0][2][0]][1]
        elif Instruction[1][0][2][1] != "null":
            Ad_sz = Registers_table[Instruction[1][0][2][1]][1]
    elif len(Instruction[1]) > 1 and Instruction[1][1][0] in Size_Identifier:
        if Instruction[1][1][2][0] != "null":
            Ad_sz = Registers_table[Instruction[1][1][2][0]][1]
        elif Instruction[1][1][2][1] != "null":
            Ad_sz = Registers_table[Instruction[1][1][2][1]][1]

    if len(Instruction) > 1 and Instruction[1][0][0] in Size_Identifier:
        if Instruction[1][0][2][3] != "null":
            if int(Instruction[1][0][2][3], 16) > 127:
                Di_sz = 32
            else:
                Di_sz = 8
    elif len(Instruction[1]) > 1 and Instruction[1][1][0] in Size_Identifier:
        if Instruction[1][1][2][3] != "null":
            if int(Instruction[1][1][2][3], 16) > 127:
                Di_sz = 32
            else:
                Di_sz = 8


Instruction = Parse_Instruction(input())

if Instruction[0] in Single_OpCodes_table.keys():
    result["OpCode"] = Single_OpCodes_table[Instruction[0]]
    print(Make_MC())
    exit()

Prep()


if Op_sz == 16:
    result["66"] = "01100110"
if Ad_sz == 32:
    result["67"] = "01100111"


if Instruction[0] == "mov":
    if Instruction[1][1][0] in Registers_table.keys():
        result["OpCode"] = "100010"
        Handle_Second_Register()
    elif Instruction[1][1][0] in Size_Identifier:
        result["OpCode"] = "100010"
        Instruction[1][0], Instruction[1][1] = Instruction[1][1], Instruction[1][0]
        Handle_Second_Register()
        result["OpCode_D"] = "1"
    else:
        if Instruction[1][0][0] in Registers_table.keys() and Registers_table[Instruction[1][0][0]][1] != 64:
            if Instruction[1][0][0][0] == "r":
                result["Rex_Pre"] = "0100"
                result["Rex_B"] = "1"
            result["OpCode"] = "1011"
            result["OpCode_D"] = "0"
            if Op_sz != 8:
                result["OpCode_D"] = "1"
            result["OpCode_W"] = Registers_table[Instruction[1][0][0]][0]
            result["Data"] = Normalize(Instruction[1][1][0], Op_sz)

        else:
            result["OpCode"] = "110001"
            result["Reg"] = "000"
            Handle_Second_Im()
    print(Make_MC())
elif Instruction[0] == "add":
    if Instruction[1][1][0] in Registers_table.keys():
        result["OpCode"] = "000000"
        Handle_Second_Register()
    elif Instruction[1][1][0] in Size_Identifier:
        result["OpCode"] = "000000"
        Instruction[1][0], Instruction[1][1] = Instruction[1][1], Instruction[1][0]
        Handle_Second_Register()
        result["OpCode_D"] = "1"
    else:
        if Instruction[1][0][0] in ["rax", "eax", "ax", "al"] and int(Instruction[1][1][0], 16) > 127:
            if Op_sz == 64:
                result["Rex_Pre"] = "0100"
                result["Rex_W"] = "1"
            result["OpCode"] = "000001"
            result["OpCode_D"] = "0"
            result["OpCode_W"] = "0"
            if Op_sz != 8:
                result["OpCode_W"] = "1"
            result["Data"] = Normalize(Instruction[1][1][0], min(Op_sz, 32))
        else:
            result["OpCode"] = "100000"
            result["Reg"] = "000"
            Handle_Second_Im()
            result["OpCode_D"] = "0"
    print(Make_MC())
elif Instruction[0] == "adc":
    if Instruction[1][1][0] in Registers_table.keys():
        result["OpCode"] = "000100"
        Handle_Second_Register()
    elif Instruction[1][1][0] in Size_Identifier:
        result["OpCode"] = "000100"
        Instruction[1][0], Instruction[1][1] = Instruction[1][1], Instruction[1][0]
        Handle_Second_Register()
        result["OpCode_D"] = "1"
    else:
        if Instruction[1][0][0] in ["rax", "eax", "ax", "al"] and int(Instruction[1][1][0], 16) > 127:
            if Op_sz == 64:
                result["Rex_Pre"] = "0100"
                result["Rex_W"] = "1"
            result["OpCode"] = "000101"
            result["OpCode_D"] = "0"
            result["OpCode_W"] = "0"
            if Op_sz != 8:
                result["OpCode_W"] = "1"
            result["Data"] = Normalize(Instruction[1][1][0], min(Op_sz, 32))
        else:
            result["OpCode"] = "100000"
            result["Reg"] = "010"
            Handle_Second_Im()
    print(Make_MC())
elif Instruction[0] == "sub":
    if Instruction[1][1][0] in Registers_table.keys():
        result["OpCode"] = "001010"
        Handle_Second_Register()
    elif Instruction[1][1][0] in Size_Identifier:
        result["OpCode"] = "001010"
        Instruction[1][0], Instruction[1][1] = Instruction[1][1], Instruction[1][0]
        Handle_Second_Register()
        result["OpCode_D"] = "1"
    else:
        if Instruction[1][0][0] in ["rax", "eax", "ax", "al"] and int(Instruction[1][1][0], 16) > 127:
            if Op_sz == 64:
                result["Rex_Pre"] = "0100"
                result["Rex_W"] = "1"
            result["OpCode"] = "001011"
            result["OpCode_D"] = "0"
            result["OpCode_W"] = "0"
            if Op_sz != 8:
                result["OpCode_W"] = "1"
            result["Data"] = Normalize(Instruction[1][1][0], min(Op_sz, 32))
        else:
            result["OpCode"] = "100000"
            result["Reg"] = "101"
            Handle_Second_Im()
    print(Make_MC())
elif Instruction[0] == "sbb":
    if Instruction[1][1][0] in Registers_table.keys():
        result["OpCode"] = "000110"
        Handle_Second_Register()
    elif Instruction[1][1][0] in Size_Identifier:
        result["OpCode"] = "000110"
        Instruction[1][0], Instruction[1][1] = Instruction[1][1], Instruction[1][0]
        Handle_Second_Register()
        result["OpCode_D"] = "1"
    else:
        if Instruction[1][0][0] in ["rax", "eax", "ax", "al"] and int(Instruction[1][1][0], 16) > 127:
            if Op_sz == 64:
                result["Rex_Pre"] = "0100"
                result["Rex_W"] = "1"
            result["OpCode"] = "000111"
            result["OpCode_D"] = "0"
            result["OpCode_W"] = "0"
            if Op_sz != 8:
                result["OpCode_W"] = "1"
            result["Data"] = Normalize(Instruction[1][1][0], min(Op_sz, 32))
        else:
            result["OpCode"] = "100000"
            result["Reg"] = "011"
            Handle_Second_Im()
    print(Make_MC())
elif Instruction[0] == "and":
    if Instruction[1][1][0] in Registers_table.keys():
        result["OpCode"] = "001000"
        Handle_Second_Register()
    elif Instruction[1][1][0] in Size_Identifier:
        result["OpCode"] = "001000"
        Instruction[1][0], Instruction[1][1] = Instruction[1][1], Instruction[1][0]
        Handle_Second_Register()
        result["OpCode_D"] = "1"
    else:
        if Instruction[1][0][0] in ["rax", "eax", "ax", "al"] and int(Instruction[1][1][0], 16) > 127:
            if Op_sz == 64:
                result["Rex_Pre"] = "0100"
                result["Rex_W"] = "1"
            result["OpCode"] = "001001"
            result["OpCode_D"] = "0"
            result["OpCode_W"] = "0"
            if Op_sz != 8:
                result["OpCode_W"] = "1"
            result["Data"] = Normalize(Instruction[1][1][0], min(Op_sz, 32))
        else:
            result["OpCode"] = "100000"
            result["Reg"] = "100"
            Handle_Second_Im()
    print(Make_MC())
elif Instruction[0] == "or":
    if Instruction[1][1][0] in Registers_table.keys():
        result["OpCode"] = "000010"
        Handle_Second_Register()
    elif Instruction[1][1][0] in Size_Identifier:
        result["OpCode"] = "000010"
        Instruction[1][0], Instruction[1][1] = Instruction[1][1], Instruction[1][0]
        Handle_Second_Register()
        result["OpCode_D"] = "1"
    else:
        if Instruction[1][0][0] in ["rax", "eax", "ax", "al"] and int(Instruction[1][1][0], 16) > 127:
            if Op_sz == 64:
                result["Rex_Pre"] = "0100"
                result["Rex_W"] = "1"
            result["OpCode"] = "000011"
            result["OpCode_D"] = "0"
            result["OpCode_W"] = "0"
            if Op_sz != 8:
                result["OpCode_W"] = "1"
            result["Data"] = Normalize(Instruction[1][1][0], min(Op_sz, 32))
        else:
            result["OpCode"] = "100000"
            result["Reg"] = "001"
            Handle_Second_Im()
    print(Make_MC())
elif Instruction[0] == "xor":
    if Instruction[1][1][0] in Registers_table.keys():
        result["OpCode"] = "001100"
        Handle_Second_Register()
    elif Instruction[1][1][0] in Size_Identifier:
        result["OpCode"] = "001100"
        Instruction[1][0], Instruction[1][1] = Instruction[1][1], Instruction[1][0]
        Handle_Second_Register()
        result["OpCode_D"] = "1"
    else:
        if Instruction[1][0][0] in ["rax", "eax", "ax", "al"] and int(Instruction[1][1][0], 16) > 127:
            if Op_sz == 64:
                result["Rex_Pre"] = "0100"
                result["Rex_W"] = "1"
            result["OpCode"] = "001101"
            result["OpCode_D"] = "0"
            result["OpCode_W"] = "0"
            if Op_sz != 8:
                result["OpCode_W"] = "1"
            result["Data"] = Normalize(Instruction[1][1][0], min(Op_sz, 32))
        else:
            result["OpCode"] = "100000"
            result["Reg"] = "110"
            Handle_Second_Im()
    print(Make_MC())
elif Instruction[0] == "dec":
    result["OpCode"] = "111111"
    result["Reg"] = "001"
    Handle_Single_Op()
    print(Make_MC())
elif Instruction[0] == "inc":
    result["OpCode"] = "111111"
    result["Reg"] = "000"
    Handle_Single_Op()
    print(Make_MC())
elif Instruction[0] == "cmp":
    if Instruction[1][1][0] in Registers_table.keys():
        result["OpCode"] = "001110"
        Handle_Second_Register()
    elif Instruction[1][1][0] in Size_Identifier:
        result["OpCode"] = "001110"
        Instruction[1][0], Instruction[1][1] = Instruction[1][1], Instruction[1][0]
        Handle_Second_Register()
        result["OpCode_D"] = "1"
    else:
        if Instruction[1][0][0] in ["rax", "eax", "ax", "al"] and int(Instruction[1][1][0], 16) > 127:
            if Op_sz == 64:
                result["Rex_Pre"] = "0100"
                result["Rex_W"] = "1"
            result["OpCode"] = "001111"
            result["OpCode_D"] = "0"
            result["OpCode_W"] = "0"
            if Op_sz != 8:
                result["OpCode_W"] = "1"
            result["Data"] = Normalize(Instruction[1][1][0], min(Op_sz, 32))
        else:
            result["OpCode"] = "100000"
            result["Reg"] = "111"
            Handle_Second_Im()
    print(Make_MC())
elif Instruction[0] == "test":
    if Instruction[1][1][0] in Registers_table.keys():
        result["OpCode"] = "100001"
        Handle_Second_Register()
        result["OpCode_D"] = "0"
    elif Instruction[1][1][0] in Size_Identifier:
        result["OpCode"] = "100001"
        Instruction[1][0], Instruction[1][1] = Instruction[1][1], Instruction[1][0]
        Handle_Second_Register()
    else:
        if Instruction[1][0][0] in ["rax", "eax", "ax", "al"]:
            if Op_sz == 64:
                result["Rex_Pre"] = "0100"
                result["Rex_W"] = "1"
            result["OpCode"] = "101010"
            result["OpCode_D"] = "0"
            result["OpCode_W"] = "0"
            if Op_sz != 8:
                result["OpCode_W"] = "1"
            result["Data"] = Normalize(Instruction[1][1][0], min(Op_sz, 32))
        else:
            result["OpCode"] = "111101"
            result["Reg"] = "000"
            Handle_Second_Im()
    print(Make_MC())
elif Instruction[0] == "xchg":
    result["OpCode"] = "100001"
    Handle_Second_Register()
    result["OpCode_D"] = "1"
    print(Make_MC())
elif Instruction[0] == "xadd":
    result["OpCodeE"] = "00001111"
    result["OpCode"] = "110000"
    Handle_Second_Register()
    result["OpCode_D"] = "0"
    print(Make_MC())
elif Instruction[0] == "imul":
    if len(Instruction[1]) == 2:
        if Instruction[1][1][0] in Registers_table.keys():
            result["OpCodeE"] = "00001111"
            result["OpCode"] = "101011"
            Instruction[1][0], Instruction[1][1] = Instruction[1][1], Instruction[1][0]
            Handle_Second_Register()
            result["OpCode_D"] = "1"
            result["OpCode_W"] = "1"
        elif Instruction[1][1][0] in Size_Identifier:
            result["OpCodeE"] = "00001111"
            result["OpCode"] = "101011"
            Instruction[1][0], Instruction[1][1] = Instruction[1][1], Instruction[1][0]
            Handle_Second_Register()
            result["OpCode_D"] = "1"
    elif len(Instruction[1]) == 1:
        result["OpCode"] = "111101"
        Handle_Single_Op()
        result["OpCode_D"] = "1"
        result["Reg"] = "101"
    print(Make_MC())
elif Instruction[0] == "idiv":
    result["OpCode"] = "111101"
    result["Reg"] = "111"
    Handle_Single_Op()
    result["OpCode_D"] = "1"
    print(Make_MC())
elif Instruction[0] == "bsf":
    if Instruction[1][0][0] in Registers_table.keys():
        Instruction[1][0], Instruction[1][1] = Instruction[1][1], Instruction[1][0]
    result["OpCodeE"] = "00001111"
    result["OpCode"] = "101111"
    Handle_Second_Register()
    result["OpCode_D"] = "0"
    result["OpCode_W"] = "0"
    print(Make_MC())
elif Instruction[0] == "bsr":
    if Instruction[1][0][0] in Registers_table.keys():
        Instruction[1][0], Instruction[1][1] = Instruction[1][1], Instruction[1][0]
    result["OpCodeE"] = "00001111"
    result["OpCode"] = "101111"
    Handle_Second_Register()
    result["OpCode_D"] = "0"
    result["OpCode_W"] = "1"
    print(Make_MC())
elif Instruction[0] == "jmp":
    result["OpCode"] = "111111"
    Handle_Single_Op()
    result["OpCode_D"] = "1"
    result["OpCode_W"] = "1"
    result["Rex_W"] = "0"
    result["Reg"] = "100"
    print(Make_MC())
elif Instruction[0][0] == "j":
    result["OpCodeE"] = "00001111"
    result["OpCode"] = "1000"
    result["Dis"] = Normalize(Instruction[1][0][0], 32)
    result["OpCode_D"] = tttn[Instruction[0][1:]]
    print(Make_MC())
elif Instruction[0] == "shl":
    if len(Instruction[1]) == 1 or Instruction[1][1][0] == "1":
        result["OpCode"] = "110100"
        result["Reg"] = "100"
        Handle_Single_Op()
        result["OpCode_D"] = "0"
    elif len(Instruction[1]) == 2 and Instruction[1][1][0] == "cl":
        result["OpCode"] = "110100"
        result["Reg"] = "100"
        Handle_Single_Op()
        result["OpCode_D"] = "1"
    else:
        result["OpCode"] = "110000"
        result["Reg"] = "100"
        Handle_Single_Op()
        result["OpCode_D"] = "0"
        result["Data"] = Normalize(Instruction[1][1][0], 8)
    print(Make_MC())
elif Instruction[0] == "shr":
    if len(Instruction[1]) == 1 or Instruction[1][1][0] == "1":
        result["OpCode"] = "110100"
        result["Reg"] = "101"
        Handle_Single_Op()
        result["OpCode_D"] = "0"
    elif len(Instruction[1]) == 2 and Instruction[1][1][0] == "cl":
        result["OpCode"] = "110100"
        result["Reg"] = "101"
        Handle_Single_Op()
        result["OpCode_D"] = "1"
    else:
        result["OpCode"] = "110000"
        result["Reg"] = "101"
        Handle_Single_Op()
        result["OpCode_D"] = "0"
        result["Data"] = Normalize(Instruction[1][1][0], 8)
    print(Make_MC())
elif Instruction[0] == "neg":
    result["OpCode"] = "111101"
    result["Reg"] = "011"
    Handle_Single_Op()
    result["OpCode_D"] = "1"
    print(Make_MC())
elif Instruction[0] == "not":
    result["OpCode"] = "111101"
    result["Reg"] = "010"
    Handle_Single_Op()
    result["OpCode_D"] = "1"
    print(Make_MC())
elif Instruction[0] == "call":
    result["OpCode"] = "11101000"
    result["Dis"] = Normalize(Instruction[1][0][0], 32)
    print(Make_MC())
elif Instruction[0] == "ret":
    if len(Instruction) == 1:
        result["OpCode"] = "11000011"
    else:
        result["OpCode"] = "11000010"
        result["Dis"] = Normalize(Instruction[1][0][0], 16)
    print(Make_MC())
elif Instruction[0] == "push":
    if Instruction[1][0][0] in Registers_table.keys():
        result["OpCode"] = "0101"
        result["OpCode_D"] = "0"
        result["OpCode_W"] = Registers_table[Instruction[1][0][0]][0]
        if Op_sz == 64:
            result["Rex_Pre"] = "0100"
            result["Rex_W"] = "1"
        if Instruction[1][0][0] in New_Registers:
            result["Rex_Pre"] = "0100"
            result["Rex_B"] = "1"
    elif Instruction[1][0][0] in Size_Identifier:
        result["OpCode"] = "111111"
        result["Reg"] = "110"
        Handle_Single_Op()
        result.pop("Rex_Pre", "")
        result.pop("Rex_W", "")
        result.pop("Rex_R", "")
        result.pop("Rex_X", "")
        result.pop("Rex_B", "")
        result["OpCode_D"] = "1"
        result["OpCode_W"] = "1"
    else:
        result["OpCode"] = "011010"
        result["OpCode_D"] = "0"
        result["OpCode_W"] = "0"
        if int(Instruction[1][0][0], 16) > 127:
            result["Data"] = Normalize(Instruction[1][0][0], 32)
        else:
            result["Data"] = Normalize(Instruction[1][0][0], 8)
    print(Make_MC())
elif Instruction[0] == "pop":
    if Instruction[1][0][0] in Registers_table.keys():
        result["OpCode"] = "0101"
        result["OpCode_D"] = "1"
        result["OpCode_W"] = Registers_table[Instruction[1][0][0]][0]
        if Op_sz == 64:
            result["Rex_Pre"] = "0100"
            result["Rex_W"] = "1"
        if Instruction[1][0][0] in New_Registers:
            result["Rex_Pre"] = "0100"
            result["Rex_B"] = "1"
    else:
        result["OpCode"] = "100011"
        result["Reg"] = "000"
        Handle_Single_Op()
        result.pop("Rex_Pre", "")
        result.pop("Rex_W", "")
        result.pop("Rex_R", "")
        result.pop("Rex_X", "")
        result.pop("Rex_B", "")
        result["OpCode_D"] = "1"
        result["OpCode_W"] = "1"
    print(Make_MC())
