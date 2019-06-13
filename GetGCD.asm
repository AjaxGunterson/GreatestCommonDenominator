TITLE	GREATEST COMMON DIVISOR
; Finds the greatest common divisor
; of two numbers

INCLUDE Irvine32.inc

.data

GetGCD PROTO,
	num1:WORD,
	num2:WORD

.code
main PROC

	INVOKE	GetGCD,6,6	; 
	call	WriteDec	; Output GCD
	call	Crlf		; make prettier
	Call	Crlf		; make prettier
	INVOKE	GetGCD,3,73	; 
	call	WriteDec	; Output GCD
	call	Crlf		; make prettier
	Call	Crlf		; make prettier
	INVOKE	GetGCD,8,888; 
	call	WriteDec	; Output GCD
	call	Crlf		; make prettier
	Call	Crlf		; make prettier

exit
main ENDP

;---------------------------------------------------------------;
GetGCD PROC,num1:WORD,num2:WORD									;
;																;
;					Description:	Returns GCD of 2 numbers	;
;									back in EAX					;
;																;
;---------------------------------------------------------------;
	
	push	ebx;
	push	edx;

	movzx	eax,num1; This will be Y
	cdq				; Sign extend to edx
	inc		edx		; if eax > 0, set zf
	jnz		next	; goto next number if positive
	neg		eax		; if negative, flip

	Next:

	mov		ebx,eax ; Y will stay in ebx
	movzx	eax,num2; This will be X
	cdq				; Sign extend to edx
	inc		edx		; if eax > 0, set zf
	jnz		L1		; goto loop if positive
	neg		eax		; if negative, flip

	L1:
		mov		edx,0	; Clear remainder
		div		ebx		; x % y in edx
		mov		eax,ebx	; x = y
		mov		ebx,edx	; y = x % y
		cmp		ebx,0	; cmp x%y,0
		ja		L1		; Jump out when x % y = 0

	pop		edx;
	pop		ebx;
	ret
GetGCD	ENDP
END main