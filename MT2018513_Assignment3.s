;Implement a simple neural N/W     
;Mayukh Ghosh	
;MT2018513
	 
	 AREA     neural, CODE, READONLY
     
	 IMPORT displayMsgnot
	 IMPORT displayMsgnand
	 IMPORT displayMsgnor	 
	 IMPORT displayMsgand
	 IMPORT displayMsgor
	 
	 EXPORT __main
     ENTRY 
	 
__main  FUNCTION	


		VLDR.F32 S16,=0.5	;Threshold value
		
		
GATE_AND MOV R6,#0

NXTVECTORAND	BL VECTORS

		ADD R6,R6,#1
		
		VLDR.F32 S2,=-0.1      ;w0
		
		VLDR.F32 S10,=0.2	   ;w1	
		
		VLDR.F32 S11,=0.2	   ;w2
		
		VLDR.F32 S13,=-0.2	   
		
		VMOV.F32 S12,R0;
		
		VMOV.F32 S15,R1;
		
		VMOV.F32 S14,R3;
		VCVT.F32.S32 S12,S12		   ;x0 
		
		VCVT.F32.S32 S15,S15		   ;x1 
		VCVT.F32.S32 S14,S14		   ;x2
		
		VLDR.F32 S17,=1		   
		
		VMUL.F32 S2,S2,S12	   
		
		VMUL.F32 S10,S10,S15   
		
		VMUL.F32 S11,S11,S14   
		
		VMUL.F32 S13,S13,S17   
		
		VADD.F32 S2,S2,S10	  
		
		VADD.F32 S11,S11,S13   
		
		VADD.F32 S6,S2,S11	   
		
		BL SIGMOID_NEURON 
		
		VCMP.F32 S8,S16	
		
		VMRS APSR_nzcv, FPSCR
		
		BLE LOGICZEROAND				
		
		B LOGICLOGICONEAND				
		
LOGICZEROAND	MOV R2,#0		

		B NEXTAND
LOGICLOGICONEAND	MOV R2,#1

		B NEXTAND
		
NEXTAND	BL displayMsgand			

		CMP R6,#4
		
		BLT NXTVECTORAND
		
		B GATE_OR


GATE_OR MOV R6,#0

NXTVECTOROR	BL VECTORS

		ADD R6,R6,#1
		
		VLDR.F32 S2,=-0.1      ;w0
		
		VLDR.F32 S10,=0.7	   ;w1	
		
		VLDR.F32 S11,=0.7	   ;w2
		
		VLDR.F32 S13,=-0.1	   ; 
		
		VMOV.F32 S12,R0
		
		VMOV.F32 S15,R1
		
		VMOV.F32 S14,R3
		
		VCVT.F32.S32 S12,S12		   ;x0 
		
		VCVT.F32.S32 S15,S15		   ;x1 
		
		VCVT.F32.S32 S14,S14		   ;x2 
		
		VLDR.F32 S17,=1		   ;
		
		VMUL.F32 S2,S2,S12	   
		
		VMUL.F32 S10,S10,S15   
		
		VMUL.F32 S11,S11,S14   
		
		VMUL.F32 S13,S13,S17   
		
		VADD.F32 S2,S2,S10	   
		
		VADD.F32 S11,S11,S13   
		
		VADD.F32 S6,S2,S11	   
		
		BL SIGMOID_NEURON 
		
		VCMP.F32 S8,S16
		
		VMRS APSR_nzcv, FPSCR
		BLE LOGICZEROOR
		B LOGICLOGICONEOR
LOGICZEROOR	MOV R2,#0
		B NEXTOR

LOGICLOGICONEOR		MOV R2,#1

		B NEXTOR
		
NEXTOR	BL displayMsgor
		CMP R6,#4
		BLT NXTVECTOROR
		B GATE_NOT
		
GATE_NOT MOV R6,#0
NXTVECTORNOT	BL VECTORSNOT
		ADD R6,R6,#1
		
		VLDR.F32 S2,=0.5      ;w0
		
		VLDR.F32 S10,=0.5	   ;w1	
		
		VLDR.F32 S11,=-0.7	   ;w2
		VLDR.F32 S13,=0.1	   ; 
		
		VMOV.F32 S12,R0
		
		VMOV.F32 S15,R1
		
		VMOV.F32 S14,R3
		
		VCVT.F32.S32 S12,S12		   ;x0 
		
		VCVT.F32.S32 S15,S15		   ;x1 
		
		VCVT.F32.S32 S14,S14		   ;x2 
		VLDR.F32 S17,=1		   
		
		VMUL.F32 S2,S2,S12	   
		VMUL.F32 S10,S10,S15  
		
		VMUL.F32 S11,S11,S14   
		VMUL.F32 S13,S13,S17   
		
		VADD.F32 S2,S2,S10	   
		VADD.F32 S11,S11,S13   
		
		VADD.F32 S6,S2,S11	   
		
		BL SIGMOID_NEURON 

		VCMP.F32 S8,S16
		VMRS APSR_nzcv, FPSCR
		BLE LOGICZERONOT
		
		B LOGICLOGICONENOT
LOGICZERONOT	MOV R2,#0
		B NEXTNOT

LOGICLOGICONENOT	MOV R2,#1

		B NEXTNOT
		
NEXTNOT	BL displayMsgnot
		CMP R6,#2
		BLT NXTVECTORNOT
		B GATE_NAND	
		
		


LOGICZERO	MOV R2,#5

LOGICLOGICONE		MOV R2,#5

	
GATE_NAND MOV R6,#0
NXTVECTORNAND	BL VECTORS
		ADD R6,R6,#1
		VLDR.F32 S2,=0.6      ;w0
		
		VLDR.F32 S10,=-0.8	   ;w1	
		
		VLDR.F32 S11,=-0.8	   ;w2
		VLDR.F32 S13,=0.3	   ; 
		VMOV.F32 S12,R0
		
		VMOV.F32 S15,R1
		VMOV.F32 S14,R3
		VCVT.F32.S32 S12,S12		   ;x0 
		VCVT.F32.S32 S15,S15		   ;x1 
		VCVT.F32.S32 S14,S14		   ;x2 
		
		VLDR.F32 S17,=1		   
		
		
		VMUL.F32 S2,S2,S12	   
		VMUL.F32 S10,S10,S15   
		
		VMUL.F32 S11,S11,S14   
		VMUL.F32 S13,S13,S17   
		
		VADD.F32 S2,S2,S10	   
		VADD.F32 S11,S11,S13   
		
		VADD.F32 S6,S2,S11	   ;
		
		BL SIGMOID_NEURON 
		
		VCMP.F32 S8,S16
		VMRS APSR_nzcv, FPSCR
		
		BLE LOGICZERONAND
		
		B LOGICLOGICONENAND
		
LOGICZERONAND	MOV R2,#0

		B NEXTNAND

LOGICLOGICONENAND		MOV R2,#1

		B NEXTNAND
		
NEXTNAND	BL displayMsgnand
		CMP R6,#4
		
		BLT NXTVECTORNAND
		B GATE_NOR

GATE_NOR MOV R6,#0
NXTVECTORNOR	BL VECTORS
		ADD R6,R6,#1
		VLDR.F32 S2,=0.5      ;w0
		VLDR.F32 S10,=-0.7	   ;w1	
		VLDR.F32 S11,=-0.7	   ;w2
		VLDR.F32 S13,=0.1	  
		
		VMOV.F32 S12,R0
		VMOV.F32 S15,R1
		VMOV.F32 S14,R3
		
		
		VCVT.F32.S32 S12,S12		   ;x0 
		VCVT.F32.S32 S15,S15		   ;x1 
		VCVT.F32.S32 S14,S14		   ;x2 
		VLDR.F32 S17,=1		   
		
		VMUL.F32 S2,S2,S12	   
		VMUL.F32 S10,S10,S15   
		
		VMUL.F32 S11,S11,S14   
		VMUL.F32 S13,S13,S17   
		
		VADD.F32 S2,S2,S10	   
		VADD.F32 S11,S11,S13   
		
		VADD.F32 S6,S2,S11	   ;
		
		BL SIGMOID_NEURON 
		
		VCMP.F32 S8,S16
		VMRS APSR_nzcv, FPSCR
		BLE LOGICZERONOR
		B LOGICLOGICONENOR
LOGICZERONOR	MOV R2,#0
		B NEXTNOR

LOGICLOGICONENOR	MOV R2,#1

		B NEXTNOR
		
NEXTNOR	BL displayMsgnor
		CMP R6,#4
		BLT NXTVECTORNOR
		B stop
		

stop    B stop



VECTORS  PUSH {R9,LR}		
		CMP R6,#0
		
		BEQ VECTOR0
		CMP R6,#1
		
		BEQ VECTOR1
		
		CMP R6,#2
		
		BEQ VECTOR3
		CMP R6,#3
		
		BEQ VECTOR2

VECTOR0    MOV R0,#1			
		MOV R1,#0
		MOV R3,#0
		B B
		
VECTOR1    MOV R0,#1			
		MOV R1,#0
		MOV R3,#1
		B B

VECTOR3    MOV R0,#1			
		MOV R1,#1
		MOV R3,#0
		B B

VECTOR2    MOV R0,#1			
		MOV R1,#1
		MOV R3,#1
		B B
		
B		SUB LR, #0x01
		POP {R7,PC}
		BX LR
		
VECTORSNOT  PUSH {R10,LR}	
		CMP R6,#0
		BEQ VECTORNOT0
		CMP R6,#1
		BEQ VECTORNOT1

VECTORNOT0 MOV R0,#1			
		MOV R1,#0
		MOV R3,#0
		B BNOT
		
VECTORNOT1 MOV R0,#1			
		MOV R1,#0
		MOV R3,#1
		B BNOT
		
BNOT		SUB LR, #0x01
		POP {R10,PC}
		BX LR		


SIGMOID_NEURON	PUSH {R7,LR}
		BL EXPONENTIAL		
		VLDR.F32 S7,=1	
		
		VADD.F32 S9,S7,S0		;CALCULATE : 1 + e^-x
		VDIV.F32 S8,S7,S9		;CALCULATE : 1/(1 + e^-x)
		SUB LR, #0x01
		POP {R7,PC}
		BX LR
		
		

EXPONENTIAL		PUSH {R4,LR}
		VLDR.F32 S5,=-1			
		VMUL.F32 S3,S6,S5		
		MOV R8,#6 				
		
        MOV R5,#1  				
        VLDR.F32 S0,=1			
        VLDR.F32 S1,=1			

L    CMP R5,R8				
        BLE L1				
        B dec
		
dec	SUB LR, #0x01
		POP {R4,PC}
		BX LR

L1      VMUL.F32 S1,S1,S3	

        VMOV.F32 S4,R5			
		
        VCVT.F32.S32 S4,S4;		
		
        VDIV.F32 S1,S1,S4		
		
        VADD.F32 S0,S0,S1		
		
        ADD R5,R5,#1			
		
        B L					
        ENDFUNC
        END