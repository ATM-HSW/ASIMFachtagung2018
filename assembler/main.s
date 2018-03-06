__initial_sp	EQU	0x20000800
				PRESERVE8 ;8byte alignment of the stack (required by ARM) 
                THUMB		;as we will use THUMB2 instructions
                AREA    RESET, DATA, READONLY
__Vectors       DCD     __initial_sp              ; Top of Stack
                DCD     Reset_Handler             ; Reset Handler
                AREA    |.text|, CODE, READONLY	 ;|.text| is used for code sections produced by the C compiler

; Reset handler routine
				ENTRY	;entry point for the application (to avoid L6305W warning)
Reset_Handler   PROC	;indication that we have a function here (must end with ENDP). Synomin of FUNCTION-ENDFUNC
				LDR r1, = 0x40021014  		;address of RCC_AHBENR register 
				LDR r0, =0x20000
				LDR r2, [r1]
				ORRS r2,r0,r2
				STR r2, [r1]

				LDR r1, =0x48000000		 ;address of GPIOA_MODER register
				LDR r0, =0x400			;configure PA5 as output
				LDR r2, [r1]
				ORRS r2,r0,r2
				STR r2, [r1]

				LDR r1, =0x48000018	 	;address of GPIOA_BSRR register 
				LDR r0, =0x20         	;pin 5 on GPIOA set 
				LDR r2, =0x200000		;pin 5 on GPIOA clear 

; endless loop
loop
				STR r0, [r1]			; set PA5 (LED)
				LDR R3, =424242         ;set the counter to an initial value
delay1			SUBS R3 , #1
				CMP R3, #0    			;compare R3 to 0
				BNE delay1    			;branch (goto) "delay" if not equal

				STR r2, [r1]            ; clear PA5 (LED)
				LDR R3, =424242         ;set the counter to an initial value
delay2			SUBS R3 , #1
				CMP R3, #0    			;compare R3 to 0
				BNE delay2    			;(goto) "delay" if not equal
				B  loop					;jump to loop

				ENDP
				END
					