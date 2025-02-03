// File: MakeOrbitRings.agc
// Created: 24-12-05

Function MakeOrbitRings()
//Mercury
	for d#=1 to 360
	MMer# = el#[24]*d#+el#[26]-el#[22]
		if MMer# <0 then MMer#=MMer#+360
		if MMer# >360 then MMer#=MMer#-360
	
	vMer#=MMer#+Rads#*(((2*eMer#-eMer#^3/4)*sin(MMer#)) + (1.25*eMer#^2*sin(2*MMer#)) + (1.0833*eMer#^3*sin(3*MMer#)))
	rMer#=aMer#*(1-eMer#^2)/(1+eMer#*cos(vMer#))
	
	Mervop#=vMer#+pMer#-oMer#
		If Mervop#>360 then Mervop#=Mervop#-360
		If Mervop#<0 then Mervop#=Mervop#+360
	XMer#=rMer#*(cos(oMer#)*cos(Mervop#)-sin(oMer#)*sin(Mervop#)*cos(iMer#))
	YMer#=rMer#*(sin(oMer#)*cos(Mervop#)+cos(oMer#)*sin(Mervop#)*cos(iMer#))
	ZMer#=rMer#*(sin(Mervop#)*sin(iMer#))	
	
	//SetObjectPosition(Mer,XMer#*DisS#,ZMer#*DisS#,YMer#*DisS#)
	MerOrbitPath=1000+d#
	CreateObjectBox(MerOrbitPath,1,1,1)
	SetObjectPosition(MerOrbitPath,XMer#*DisS#,ZMer#*DisS#,YMer#*DisS#)
	next
Endfunction	