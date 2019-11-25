; Answer to Q1 : Implement a Neural N/W
;By Mayukh Ghosh MT2018513
;Sigmoid function value in S23
;logic function output in R0


  	    AREA    appcode ,CODE,READONLY
			
        EXPORT __main
		IMPORT printMsg	
        ENTRY
		
__main FUNCTION
	
		
       
		MOV R4, #1		;This is for choice of logic_
		
		BAL choice
		
choice					; switch-case equivalent
		CMP R4,#0		; and operation 
		
		BEQ logic_and
		
		CMP R4,#1		; or operation
		
		BEQ logic_or
		
		CMP R4,#2		; not operation
		
		BEQ logic_not
		CMP R4,#3		; nand operation
		
		BEQ logic_nand
		
		CMP R4,#4		; nor operation
		
		BEQ logic_nor
		
		CMP R4,#5       ; xor operation 
		
		BEQ logic_xor
		
		CMP R4,#6		; xnor operation
		
		BEQ logic_xnor
		
		
logic_and
		VLDR.F32 S10,=-0.1
		
		VLDR.F32 S11,=0.2
		
		VLDR.F32 S12,=0.2
		
		VLDR.F32 S13,=-0.2
		B	testvector
		
logic_or
		VLDR.F32 S10,=-0.1
		
		VLDR.F32 S11,=0.7
		
		VLDR.F32 S12,=0.7
		
		VLDR.F32 S13,=-0.1
		B	testvector
		
logic_not
		VLDR.F32 S10,=0.5
		
		VLDR.F32 S11,=-0.7
		
		VLDR.F32 S12,=0
		
		VLDR.F32 S13,=0.1
		
		B	testvector
		
logic_nand
		VLDR.F32 S10,=0.6
		
		VLDR.F32 S11,=-0.8
		
		VLDR.F32 S12,=-0.8
		
		VLDR.F32 S13,=0.3
		
		B	testvector
		
logic_nor
		VLDR.F32 S10,=0.5
		
		VLDR.F32 S11,=-0.7
		
		VLDR.F32 S12,=-0.7
		
		VLDR.F32 S13,=0.1
		B  	testvector
		
logic_xor		
		VLDR.F32 S10,=-5
		
		VLDR.F32 S11,=20
		
		VLDR.F32 S12,=10
		
		VLDR.F32 S13,=1
		B	testvector

logic_xnor
		VLDR.F32 S10,=-5
		
		VLDR.F32 S11,=20
		
		VLDR.F32 S12,=10
		
		VLDR.F32 S13,=1
		B	testvector
		
testvector
		VLDR.F32 S14,=1
		
		VLDR.F32 S15,=0
		
		VLDR.F32 S16,=0
		
		B neuronoutput
		
neuronoutput
		VMUL.F32 S17,S10,S14;
		
		VMUL.F32 S18,S11,S15;
		
		VMUL.F32 S19,S12,S16;
		
		VADD.F32 S20,S17,S18
		
		VADD.F32 S20,S20,S19
		
		VADD.F32 S20,S20,S13   
		
		VMOV.F32 S2, S20;
		
		B sig
		
		



sig	   

			
		MOV R0,#13; no of terms
		
        MOV R1,#1;counter
				
	    LDR R3,= 0x00000001 ; sum temp
		
	    VMOV.F S0,R3 ;  final sum
		
	   
	    VCVT.F32.U32 S0,S0
	   
	   
	   
	    LDR R8,= 0x00000001 ; temp var
		
	    VMOV.F S1,R8 ; 
		
		
	    VCVT.F32.U32 S1,S1
	
       		
		
	   
        LDR R6,= 0x00000001 ; temp for fact calc
		
        VMOV.F S6,R6 ; 
		
		
        VCVT.F32.U32 S6,S6
		



L1      CMP R1,R0; compare counter and n

        BLE L; check if counter < n 
		
        B final_result;
	
	
L    VMUL.F32 S1,S1,S2; t = t*z

		VMOV.F32 S3,S1;
		
        VMOV.F32 S5,R1; move from R1 to S5
		
        VCVT.F32.U32 S5, S5;
		
		VMUL.F32 S6,S6,S5
		
        VDIV.F32 S3,S3,S6;Divide t by factorial S6 and keep in S6
		
        VADD.F32 S0,S0,S3;exponential output e power z
		
		LDR R7,= 0x00000001 ; 
		
		VMOV.F S7,R7 ; 
		
		
		VCVT.F32.U32 S7,S7
		
		VDIV.F32 S7,S7,S0; To calculate 1/e^z
		
		LDR R9,= 0x00000001 ; 
		
		VMOV.F S9,R9 ; 
		
		
		VCVT.F32.U32 S9,S9;
		
		LDR R10,= 0x00000001 ; 
		
		VMOV.F S22,R10 ; 
		
		
		VCVT.F32.U32 S22,S22;
		
		
		VADD.F32 S21,S7,S9; To calculate 1+e^z
		
		VDIV.F32 S23,S22,S21; To calculate Sigmoid function value : 1/(1+e^z)
		
		
		
		ADD R1,R1,#1;increase counter 
		
        B L1;compare
		B final_result	

final_result
		
		VLDR.F32 S24, =0.5
		
		VCMP.F32 S23, S24
		
		VMRS APSR_NZCV, FPSCR
		
		MOVGT R0, #1
		
		MOVLT R0, #0
		
		BL printMsg
		
		B stop
		
stop    B stop
        ENDFUNC
        END