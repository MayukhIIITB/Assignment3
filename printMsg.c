#include "stm32f4xx.h"

#include <stdio.h>

#include <string.h>


void displayMsgand(const int A, const int B, const int C, const int D)
{
	
	 char Msg[100];
	
	 char *pointer;
	
	ITM_SendChar('\n');
	ITM_SendChar('A');
	ITM_SendChar('N');
	ITM_SendChar('D');
	ITM_SendChar('\n');
	
	
	ITM_SendChar('X');
	ITM_SendChar('0');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('1');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('2');
	ITM_SendChar(' ');
	
	ITM_SendChar('Y');
	ITM_SendChar('\n');
	
	 
	 sprintf(Msg, "%x", A);//PRINT X0
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');
	
	 sprintf(Msg, "%x", B);//PRINT X1
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", C);//PRINT X2
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", D);//PRINT OUTPUT LOGIC=Y
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
	 }
		ITM_SendChar('\n');

}

void displayMsgor(const int A, const int B, const int C, const int D)
{
	 char Msg[100];
	 char *pointer;
	
	ITM_SendChar('\n');
	ITM_SendChar('O');
	ITM_SendChar('R');
	ITM_SendChar('\n');
	
	ITM_SendChar('X');
	ITM_SendChar('0');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('1');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('2');
	ITM_SendChar(' ');
	
	ITM_SendChar('Y');
	ITM_SendChar('\n');
	
	 
	 sprintf(Msg, "%x", A);//PRINT X0
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');
	
	 sprintf(Msg, "%x", B);//PRINT X1
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", C);//PRINT X2
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", D);//PRINT OUTPUT LOGIC=Y
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
	 }
		ITM_SendChar('\n');

}

void displayMsgnot(const int A, const int B, const int C, const int D)
{
	 char Msg[100];
	 char *pointer;
	
	ITM_SendChar('\n');
	ITM_SendChar('N');
	ITM_SendChar('O');
	ITM_SendChar('T');
	ITM_SendChar('\n');
	
	ITM_SendChar('X');
	ITM_SendChar('0');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('1');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('2');
	ITM_SendChar(' ');
	
	ITM_SendChar('Y');
	ITM_SendChar('\n');
	
	 
	 sprintf(Msg, "%x", A);//PRINT X0
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');
	
	 sprintf(Msg, "%x", B);//PRINT X1
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", C);//PRINT X2
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", D);//PRINT OUTPUT LOGIC=Y
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
	 }
		ITM_SendChar('\n');

}

void displayMsgnand(const int A, const int B, const int C, const int D)
{
	 char Msg[100];
	 char *pointer;
	
	ITM_SendChar('\n');
	ITM_SendChar('N');
	ITM_SendChar('A');
	ITM_SendChar('N');
	ITM_SendChar('D');
	ITM_SendChar('\n');
	
	ITM_SendChar('X');
	ITM_SendChar('0');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('1');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('2');
	ITM_SendChar(' ');
	
	ITM_SendChar('Y');
	ITM_SendChar('\n');
	
	 
	 sprintf(Msg, "%x", A);//PRINT X0
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');
	
	 sprintf(Msg, "%x", B);//PRINT X1
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", C);//PRINT X2
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", D);//PRINT OUTPUT LOGIC=Y
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
	 }
		ITM_SendChar('\n');

}


void displayMsgnor(const int A, const int B, const int C, const int D)
{
	 char Msg[100];
	 char *pointer;
	
	ITM_SendChar('\n');
	ITM_SendChar('N');
	ITM_SendChar('O');
	ITM_SendChar('R');
	ITM_SendChar('\n');
	
	ITM_SendChar('X');
	ITM_SendChar('0');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('1');
	ITM_SendChar(' ');
	
	ITM_SendChar('X');
	ITM_SendChar('2');
	ITM_SendChar(' ');
	
	ITM_SendChar('Y');
	ITM_SendChar('\n');
	
	 
	 sprintf(Msg, "%x", A);//PRINT X0
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');
	
	 sprintf(Msg, "%x", B);//PRINT X1
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", C);//PRINT X2
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
   }
	 ITM_SendChar(' ');
	 ITM_SendChar(' ');

	 sprintf(Msg, "%x", D);//PRINT OUTPUT LOGIC=Y
	 pointer = Msg ;
   while(*pointer != '\0')
	 {
      ITM_SendChar(*pointer);
      ++pointer;
	 }
		ITM_SendChar('\n');

}
