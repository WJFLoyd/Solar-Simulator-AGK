// File     : MousePrint.agc
// Created  : 01-25-2022
// Updated  : 11-13-2024

Function MousePrint()
	SetTextString	(42,"X "+str(GetPointerX(),0))					// Print Mouse Position
	SetTextPosition	(42,GetPointerX()+50,GetPointerY())

	SetTextString	(43,"Y "+str(GetPointerY(),0))
	SetTextPosition	(43,GetPointerX()+100,GetPointerY())
EndFunction