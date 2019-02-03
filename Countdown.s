		AREA	Countdown, CODE, READONLY
		IMPORT	main
		EXPORT	start
		
		
		;;Program works 11:19, 8/12/2017
start
		LDR		R1, =cdWord					;	addrA=cdWord
		LDR		R2, =cdLetters				;	addrB=cdLetters

		LDR 	R0, = 1						;	sameChar=true
whileA	LDRB	R3, [R1]					;	while(charA[addrA]
		CMP		R3, #0						;	!=0
		BEQ 	ewhileA						;	&&
		CMP		R0, #1						;	sameChar==true)
		BNE		ewhileA						;	{
		LDR		R0, =0						;		sameChar=false
		MOV 	R5, R2						;		tmp = addrB
whileB	LDRB	R4, [R5]					;		while(charB[tmp]
		CMP		R4, #0						;		!=0
		BEQ		ewhileB						;		&&
		CMP		R0, #0						;		sameChar==false)
		BNE		ewhileB						;		{
		CMP		R3, R4						;			if(charA==charB)
		BNE		endif						;			{
		LDR		R0,=1						;				sameChar=true
		MOV		R4, #'*'					;				charB = *
		STRB	R4, [R5]					;				charB[tmp] = *
endif										;			}
		ADD		R5, R5, #1					;			tmp++
		B		whileB						;		}
ewhileB
		ADD		R1, R1, #1					;		addrA++
		B		whileA						;	}
ewhileA	
	
stop	B		stop



		AREA	TestData, DATA, READWRITE
	
cdWord
		DCB	"beets",0

cdLetters
		DCB	"daetebzsb",0
		
		END	
