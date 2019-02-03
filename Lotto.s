		AREA	Lotto, CODE, READONLY
		IMPORT	main
		EXPORT	start

;		works 3:03 12/9/17
start
		LDR	 R1, =TICKETS					;	ticketAddr = TICKETS
		LDR  R2, =COUNT						;	countAddr = COUNT
		LDR  R2, [R2]						;	count = Mem.word[countAddr]
		LDR  R3, =DRAW						;	drawAddr = DRAW
		LDR  R4, =MATCH4					;	match4Addr = MATCH4
		LDR  R5, =MATCH5					;	match5Addr = MATCH5
		LDR  R6, =MATCH6					;	match6Addr = MATCH6
		
whileA	CMP  R2, #0							;	while(count!=0)
		BEQ  ewhileA						;	{
		LDR  R0, =0							;		matches=0
		LDR  R7, =0							;		ticketCount = 0
whileB	CMP  R7, #6							;		while(ticketcount<6)
		BHS  ewhileB						;		{
		LDRB R8, [R1]						;			ticketNum = Mem.Byte[ticketAddr]
		MOV  R9, R3							;			tmpDraw = drawAddr
		LDR  R10, =0						;			drawCount = 0
whileC	CMP  R10, #6						;			while(drawCount<6)
		BHS  ewhileC						;			{
		LDRB R11, [R9]						;				drawNum = Mem.Byte[tmpDraw]
		CMP  R11, R8						;				if(drawNum = ticketNum)
		BNE  else							;				{
		ADD  R0, R0, #1						;					matches++
		LDR  R10, =6						;					drawCount = 6
		B    endelse						;				}
else										;				else {
		ADD  R10, R10, #1					;					drawCount++
endelse										;				}		
		ADD	 R9, R9, #1						;				tmpDraw++
		B	 whileC							;			}
ewhileC	
		ADD  R1, R1, #1						;			ticketAddr++
		ADD  R7, R7, #1						;			ticketCount++
		B	 whileB							;		}
ewhileB
		CMP  R0, #4							;		if(matches==4)
		BNE  fiveMatches					;		{
		LDR  R12, [R4]						;			match4 = Mem.Word[match4Addr]
		ADD  R12, R12, #1					;			match4++
		STR  R12, [R4]						;			Mem.Word[match4Addr] = match4
		B	 endifs							;		}
fiveMatches		
		CMP  R0, #5							;		else if(matches==5)
		BNE  sixMatches						;		{
		LDR  R12, [R5]						;			match5 = Mem.Word[match5Addr]
		ADD  R12, R12, #1					;			match5++
		STR  R12, [R5]						;			Mem.Word[match5Addr] = match5
		B    endifs							;		}
sixMatches
		CMP  R0, #6							;		else if(matches==6)
		BNE  endifs							;		{
		LDR  R12, [R6]						;			match6 = Mem.Word[match6Addr]
		ADD  R12, R12, #1					;			match6++
		STR  R12, [R6]						;			Mem.Word[match6Addr] = match6
endifs										;		}		

		SUB R2, R2,#1						;		count--
		B	whileA							;	}
ewhileA		
		
stop	B	stop 


		AREA	TestData, DATA, READWRITE
	
COUNT	DCD	3								;	Number of Tickets
TICKETS	DCB	3, 8, 11, 21, 22, 31			;	Tickets
		DCB	7, 23, 25, 28, 29, 32
		DCB	10, 11, 12, 22, 26, 30
	

DRAW	DCB	10, 11, 12, 22, 26, 30			; Lottery Draw

MATCH4	DCD	0
MATCH5	DCD	0
MATCH6	DCD	0

		END	
