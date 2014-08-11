# Div64Bit

This is a macro, you can use if you want to devide a big 64bit number
through a little 8bit number.

This macro is intended to be used in programs were you want to convert a number
into other bases, for example when you want to convert from binary to decimal.

>One of the special features of this macro is, that it is compatible with
>8086 CPU's real-mode and only uses Operations available on 8086 CPU's.
>So it will work absolute correct on 8086 CPU's.

**The division routine uses the registers CX, DX, SI, DI as one big 64bit register.**

|**Byte Nr.** | 7   | 6   | 5   | 4   | 3 - 2  | 1 - 0  |
| ----------- |:---:|:---:|:---:|:---:|:------:|:------:|
|**Register** | CH  | CL  | DH  | DL  |   SI   |   DI   |


The whole thing works like this:
```x86asm
Input:      cx:dx:si:di = 64bit Dividend
                     bl =  8bit Divisor
Output:     cx:dx:si:di = 64bit Quotient
                     ah =  8bit Remainder

Caller-save registers: bh, flags
Callee-save registers: All other registers, except the registers used for output.
```

For more details look into the "Div64Bit.asm" file.

**This macro is not optimised for speed. It is optimised for size.**

