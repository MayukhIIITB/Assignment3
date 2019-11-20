; Answer to Q1 : Implement a Neural N/W
;By Mayukh Ghosh MT2018513
;Sigmoid function output in S7


  	    AREA    appcode ,CODE,READONLY
			
        EXPORT __main
			
        ENTRY
		
__main FUNCTION
	
		
       MOV R0,#13; no of terms
		
       MOV R1,#1;counter
				
	   LDR R3,= 0x00000001 ; sum temp
		
	   VMOV.F S0,R3 ;  final sum
		
	   
	   VCVT.F32.U32 S0,S0
	   
	   
	   
	   LDR R4,= 0x00000001 ; temp var
		
	   VMOV.F S1,R4 ; 
		
		
	   VCVT.F32.U32 S1,S1
		
	   
       LDR R5,= 0x00000002 ; z value
		
       VMOV.F S2,R5 ; 
		
       VCVT.F32.U32 S2,S2
		
		
	   
       LDR R6,= 0x00000001 ; temp for fact calc
		
       VMOV.F S6,R6 ; 
		
		
       VCVT.F32.U32 S6,S6
		



L1    CMP R1,R0; compare counter and n

        BLE L; check if counter < n 
		
        B stop;else stop
	
	
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
		
		VADD.F32 S7,S7,S9; To calculate 1+e^z
		
		VDIV.F32 S7,S9,S7; To calculate Sigmoid function value : 1/(1+e^z)
		
		ADD R1,R1,#1;increase counter 
		
        B L1;compare
		
stop    B stop
        ENDFUNC
        END