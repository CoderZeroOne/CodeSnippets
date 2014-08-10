;
; Copyright 2014 Alexander Blümel <bluemelalexander98@gmail.com>
;
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your opinion) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program. If not, see <http://www.gnu.org/licenses/>
;

%ifndef __Div64Bit_asm__
%define __Div64Bit_asm__

;== Makros =====================================================================

;-------------------------------------------------------------------------------
;
;  Div64Bit
;
;   Input:      cx:dx:si:di = 64bit Dividend
;                        bl =  8bit Divisor
;   Output:     cx:dx:si:di = 64bit Quotient
;                        ah =  8bit Remainder
;
;   Caller-save registers: bh, flags
;   Callee-save registers: All other registers, except the registers used for
;                          output.

%macro Div64Bit 0

                mov     bh, 00001000b
                xor     ah, ah
%%NextDiv:      xchg    al, dl
                xchg    al, dh
                xchg    al, cl
                xchg    al, ch
                div     bl
                dec     bh
                test    bh, 00000011b
                jnz     %%NextDiv
                xchg    al, dl
                xchg    al, dh
                xchg    al, cl
                xchg    al, ch
                xchg    cx, si
                xchg    dx, di
                test    bh, 00000100b
                jnz     %%NextDiv

%endmacro

%endif
