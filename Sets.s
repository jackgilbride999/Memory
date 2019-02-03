	AREA	Sets, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
		LDR R1, =AElems				; AddrA = AElems;
		LDR R2, [R1]				; AValue = Memory.Word[AddrA];
		LDR R3, =ASize				; ASize;
		LDR R3, [R3]				; ASize = [ASize];
		LDR R4, =0					; countA = 0;
		
		LDR R10, =CElems			; AddrC = CElems;
		LDR R11, =CSize				; CSize;
		LDR R11, [R11]				; CSize = CSize;
		
wh1		CMP R4, R3					; while (countA<ASize)
		BHS ewh1					; {
		LDR R5, =BElems				;	AddrB=BElems;
		LDR R6, [R5]				;	BValue = Memory.Word[AddrB];
		LDR R7, =BSize				;	BSize;
		LDR R7, [R7]				;	BSize = [BSize];
		LDR R8, =0					;	countB = 0;
		
		LDR R9, =0					;	boolean sameValue = false;
		
wh2		CMP R8, R7					;	while (countB<BSize
		BHS ewh2					;	&&
		CMP R9, #1					;	sameValue==false)
		BEQ ewh2					;	{
		
		CMP R6, R2					;		if(BValue=AValue)
		BNE endif					;		{
		LDR R9, =1					;			sameValue = true;
endif								;		}
	
		ADD R5, R5, #4				;		AddrB+=4;
		LDR R6, [R5]				;		BValue = Memory.Word[AddrB]
		ADD R8, R8, #1				;		countB++;
		B	wh2						;	}
ewh2								;
		CMP R9, #0					;	if(sameValue==false)
		BNE endif2					;	{
		STR R2, [R10]				;		CValue = AValue;
		ADD R10, R10, #4			;		AddrC+=4;
		ADD R11, R11, #1			;		CSize++;
endif2								;	}
	
		ADD R1, R1, #4				;	AddrA+=4;
		LDR R2, [R1]				;	AValue = Memory.Word[AddrA]
		ADD R4, R4, #1				;	countA++;
		B	wh1						;	}
ewh1								; }	

									;; STAGE 2 of Program, now check each element of B against A

		LDR R5, =BElems				; AddrB = BElems;
		LDR R6, [R5]				; BValue = Memory.Word[AddrB];
		LDR R7, =BSize				; BSize;
		LDR R7, [R7]				; BSize = [BSize];
		LDR R8, =0					; countB = 0;
		
wh3		CMP R8, R7					; while (countB<BSize)
		BHS ewh3					; {
		LDR R1, =AElems				;	AddrA=AElems;
		LDR R2, [R1]				;	AValue = Memory.Word[AddrA];
		LDR R3, =ASize				;	ASize;
		LDR R3, [R3]				;	ASize = [ASize];
		LDR R4, =0					;	countA = 0;
		
		LDR R9, =0					;	boolean sameValue = false;
		
wh4		CMP R4, R3					;	while (countA<ASize
		BHS ewh4					;	&&
		CMP R9, #1					;	sameValue==false)
		BEQ ewh4					;	{
		
		CMP R2, R6					;		if(AValue=BValue)
		BNE endif3					;		{
		LDR R9, =1					;			sameValue = true;
endif3								;		}
	
		ADD R1, R1, #4				;		AddrA+=4;
		LDR R2, [R1]				;		AValue = Memory.Word[AddrA]
		ADD R4, R4, #1				;		countA++;
		B	wh4						;	}
ewh4								;
		CMP R9, #0					;	if(sameValue==false)
		BNE endif4					;	{
		STR R6, [R10]				;		CValue = BValue;
		ADD R10, R10, #4			;		AddrC+=4;
		ADD R11, R11, #1			;		CSize++;
endif4								;	}
	
		ADD R5, R5, #4				;	AddrB+=4;
		LDR R6, [R5]				;	BValue = Memory.Word[AddrB]
		ADD R8, R8, #1				;	countB++;
		B	wh3						;	}
ewh3								; }	

		
stop	B	stop


	AREA	TestData, DATA, READWRITE
	
ASize	DCD	8						; Number of elements in A
AElems	DCD	4,6,2,13,19,7,1,3		; Elements of A

BSize	DCD	6						; Number of elements in B
BElems	DCD	13,9,1,9,5,8			; Elements of B

CSize	DCD	0						; Number of elements in C
CElems	SPACE	56					; Space in C

	END	
