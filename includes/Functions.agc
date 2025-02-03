`=================================================================================================================
` Project	: SolarSimulator.agc
` File		: Functions.agc
` Created	: 01/25/2022
` Updated	: 01/31/2025
` Author	: W. Jean Floyd
`=================================================================================================================

`-------------------------------------------------------------------------------------------------
` Function to Update the Progress Bar on the Splash Screen
`-------------------------------------------------------------------------------------------------

Function ProgressBar(n)
	Inc n
	Bn=n
	SetSpriteScale(ProgressBar,Bn,.5):sync()
endfunction(Bn)

`-------------------------------------------------------------------------------------------------
` Function to Generate Accurate Orbit Paths
`-------------------------------------------------------------------------------------------------
		
Function MakeOrbitPaths()

d#=0

remstart  UPDATE THIS SECTION WITH THE NEW PLANET TYPE STATEMENT
//Mercury Orbit Ring
for merring= 1000 to 1351	

	d#=d#+6*initialspeed#

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

	SetObjectPosition(merring,XMer#*DisS#,ZMer#*DisS#,YMer#*DisS#)
	SetObjectLookat(merring,0,0,0,0)

next

//Venus Orbit Ring
for venring =2000 to 2673
	
	d#=d#+8*initialspeed#
	
	MVen# = el#[34]*d#+el#[36]-el#[32]
		if MVen# <0 then MVen#=MVen#+360
		if MVen# >360 then MVen#=MVen#-360
	
	vVen#=MVen#+Rads#*(((2*eVen#-eVen#^3/4)*sin(MVen#)) + (1.25*eVen#^2*sin(2*MVen#)) + (1.0833*eVen#^3*sin(3*MVen#)))
	rVen#=aVen#*(1-eVen#^2)/(1+eVen#*cos(vVen#))
	
	Venvop#=vVen#+pVen#-oVen#
		If Venvop#>360 then Venvop#=Venvop#-360
		If Venvop#<0 then Venvop#=Venvop#+360
	XVen#=rVen#*(cos(oVen#)*cos(Venvop#)-sin(oVen#)*sin(Venvop#)*cos(iVen#))
	YVen#=rVen#*(sin(oVen#)*cos(Venvop#)+cos(oVen#)*sin(Venvop#)*cos(iVen#))
	ZVen#=rVen#*(sin(Venvop#)*sin(iVen#))	
	
	SetObjectPosition(venring,XVen#*DisS#,ZVen#*DisS#,YVen#*DisS#)
	SetObjectLookat(venring,0,0,0,0)
next 

//Earth
	
	MEar# = el#[44]*d#+el#[46]-el#[42]
		if MEar# <0 then MEar#=MEar#+360
		if MEar# >360 then MEar#=MEar#-360
	
	vEar#=MEar#+Rads#*(((2*eEar#-eEar#^3/4)*sin(MEar#)) + (1.25*eEar#^2*sin(2*MEar#)) + (1.0833*eEar#^3*sin(3*MEar#)))
	rEar#=aEar#*(1-eEar#^2)/(1+eEar#*cos(vEar#))
	
	Earvop#=vEar#+pEar#-oEar#
		If Earvop#>360 then Earvop#=Earvop#-360
		If Earvop#<0 then Earvop#=Earvop#+360
	XEarth#=rEar#*(cos(oEar#)*cos(Earvop#)-sin(oEar#)*sin(Earvop#)*cos(iEar#))
	YEarth#=rEar#*(sin(oEar#)*cos(Earvop#)+cos(oEar#)*sin(Earvop#)*cos(iEar#))
	ZEarth#=rEar#*(sin(Earvop#)*sin(iEar#))	
	
	SetObjectPosition(Ear,XEarth#*DisS#,ZEarth#*DisS#,YEarth#*DisS#)
	//SetObjectPosition(EarthMoon,.2*XEarth#*DisS#,.2*ZEarth#*DisS#,.2*YEarth#*DisS#)	//Earth/Moon Object, Fix the .2, it's just a placeholder and isn't accurate

//Mars Orbit Ring
for marring =4000 to 4274
	
	d#=d#+60*initialspeed#	

	MMar# = el#[54]*d#+el#[56]-el#[52]
		if MMar# <0 then MMar#=MMar#+360
		if MMar# >360 then MMar#=MMar#-360
	
	vMar#=MMar#+Rads#*(((2*eMar#-eMar#^3/4)*sin(MMar#)) + (1.25*eMar#^2*sin(2*MMar#)) + (1.0833*eMar#^3*sin(3*MMar#)))
	rMar#=aMar#*(1-eMar#^2)/(1+eMar#*cos(vMar#))
	
	Marvop#=vMar#+pMar#-oMar#
		If Marvop#>360 then Marvop#=Marvop#-360
		If Marvop#<0 then Marvop#=Marvop#+360
	XMar#=rMar#*(cos(oMar#)*cos(Marvop#)-sin(oMar#)*sin(Marvop#)*cos(iMar#))
	YMar#=rMar#*(sin(oMar#)*cos(Marvop#)+cos(oMar#)*sin(Marvop#)*cos(iMar#))
	ZMar#=rMar#*(sin(Marvop#)*sin(iMar#))	
	
	SetObjectPosition(marring,XMar#*DisS#,ZMar#*DisS#,YMar#*DisS#)
	SetObjectLookat(marring,0,0,0,0)
next	
remend

//Jupiter Orbit Ring
for counter =jupring to jupringmax
	
	d#=d#+jupd*initialspeed#	
	
	MJup# = WrapAngle(Jupiter.daily_motion * d# + Jupiter.mean_long - Jupiter.l_of_peri)
		if MJup# <0 then MJup#=MJup#+360
		if MJup# >360 then MJup#=MJup#-360
	
	vJup# = MJup#+Rads#*(((2*Jupiter.ecc-Jupiter.ecc^.75)*sin(MJup#)) + (1.25*Jupiter.ecc^2*sin(2*MJup#)) + (1.0833*Jupiter.ecc^3*sin(3*MJup#)))
	rJup# = Jupiter.dist*(1-Jupiter.ecc^2)/(1+Jupiter.ecc*cos(vJup#))
	
	Jupvop#=WrapAngle(vJup#+Jupiter.l_of_peri-Jupiter.l_of_anode)
		If Jupvop#>360 then Jupvop#=Jupvop#-360
		If Jupvop#<0 then Jupvop#=Jupvop#+360
	
	XJup#=rJup#*(cos(Jupiter.l_of_anode)*cos(Jupvop#)-sin(Jupiter.l_of_anode)*sin(Jupvop#)*cos(Jupiter.incli))
	YJup#=rJup#*(sin(Jupiter.L_of_anode)*cos(Jupvop#)+cos(Jupiter.l_of_anode)*sin(Jupvop#)*cos(Jupiter.incli))
	ZJup#=rJup#*(sin(Jupvop#)*sin(Jupiter.incli))
		
	SetObjectPosition(counter,XJup#*DisS#,ZJup#*DisS#,YJup#*DisS#)
	SetObjectLookat(counter,0,0,0,0)
	`SetObjectRotation(counter,0,counter+360/jupringmax,0)
next

//Saturn Orbit Ring
for counter= satring to satringmax
		
	d#=d#+satd*initialspeed#	
	
	MSat# = WrapAngle(Saturn.daily_motion * d# + Saturn.mean_long - Saturn.l_of_peri)
		if MSat# <0 then MSat#=MSat#+360
		if MSat# >360 then MSat#=MSat#-360
	
	vSat# = MSat#+Rads#*(((2*Saturn.ecc-Saturn.ecc^.75)*sin(MSat#)) + (1.25*Saturn.ecc^2*sin(2*MSat#)) + (1.0833*Saturn.ecc^3*sin(3*MSat#)))
	rSat# = Saturn.dist*(1-Saturn.ecc^2)/(1+Saturn.ecc*cos(vSat#))
	
	Satvop#=WrapAngle(vSat#+Saturn.l_of_peri-Saturn.l_of_anode)
		If Satvop#>360 then Satvop#=Satvop#-360
		If Satvop#<0 then Satvop#=Satvop#+360
	XSat#=rSat#*(cos(Saturn.l_of_anode)*cos(Satvop#)-sin(Saturn.l_of_anode)*sin(Satvop#)*cos(Saturn.incli))
	YSat#=rSat#*(sin(Saturn.L_of_anode)*cos(Satvop#)+cos(Saturn.l_of_anode)*sin(Satvop#)*cos(Saturn.incli))
	ZSat#=rSat#*(sin(Satvop#)*sin(Saturn.incli))
	
	SetObjectPosition(counter,XSat#*DisS#,ZSat#*DisS#,YSat#*DisS#)
	SetObjectLookat(counter,0,0,0,0)
next	

//Uranus Orbit Ring
for counter = uraring to uraringmax
	
	d#=d#+urad*initialspeed#		

	MUra# = WrapAngle(Uranus.daily_motion * d# + Uranus.mean_long - Uranus.l_of_peri)
		if MUra# <0 then MUra#=MUra#+360
		if MUra# >360 then MUra#=MUra#-360
	vUra# = MUra#+Rads#*(((2*Uranus.ecc-Uranus.ecc^.75)*sin(MUra#)) + (1.25*Uranus.ecc^2*sin(2*MUra#)) + (1.0833*Uranus.ecc^3*sin(3*MUra#)))
	rUra# = Uranus.dist*(1-Uranus.ecc^2)/(1+Uranus.ecc*cos(vUra#))
	
	Uravop#=WrapAngle(vUra#+Uranus.l_of_peri-Uranus.l_of_anode)
		If Uravop#>360 then Uravop#=Uravop#-360
		If Uravop#<0 then Uravop#=Uravop#+360
	XUra#=rUra#*(cos(Uranus.l_of_anode)*cos(Uravop#)-sin(Uranus.l_of_anode)*sin(Uravop#)*cos(Uranus.incli))
	YUra#=rUra#*(sin(Uranus.L_of_anode)*cos(Uravop#)+cos(Uranus.l_of_anode)*sin(Uravop#)*cos(Uranus.incli))
	ZUra#=rUra#*(sin(Uravop#)*sin(Uranus.incli))
	
	SetObjectPosition(counter,XUra#*DisS#,ZUra#*DisS#,YUra#*DisS#)
	SetObjectLookat(counter,0,0,0,0)
next	

//Neptune
for counter=nepring to nepringmax
	
	d#=d#+nepd*initialspeed#		
	
	MNep# = WrapAngle(Neptune.daily_motion * d# + Neptune.mean_long - Neptune.l_of_peri)
		if MNep# <0 then MNep#=MNep#+360
		if MNep# >360 then MNep#=MNep#-360
		
	vNep# = MNep#+Rads#*(((2*Neptune.ecc-Neptune.ecc^.75)*sin(MNep#)) + (1.25*Neptune.ecc^2*sin(2*MNep#)) + (1.0833*Neptune.ecc^3*sin(3*MNep#)))
	rNep# = Neptune.dist*(1-Neptune.ecc^2)/(1+Neptune.ecc*cos(vNep#))
	
	Nepvop#=WrapAngle(vNep#+Neptune.l_of_peri-Neptune.l_of_anode)
		If Nepvop#>360 then Nepvop#=Nepvop#-360
		If Nepvop#<0 then Nepvop#=Nepvop#+360
	XNep#=rNep#*(cos(Neptune.l_of_anode)*cos(Nepvop#)-sin(Neptune.l_of_anode)*sin(Nepvop#)*cos(Neptune.incli))
	YNep#=rNep#*(sin(Neptune.L_of_anode)*cos(Nepvop#)+cos(Neptune.l_of_anode)*sin(Nepvop#)*cos(Neptune.incli))
	ZNep#=rNep#*(sin(Nepvop#)*sin(Neptune.incli))
	
	SetObjectPosition(counter,XNep#*DisS#,ZNep#*DisS#,YNep#*DisS#)
	SetObjectLookat(counter,0,0,0,0)
next	

endfunction

`-------------------------------------------------------------------------------------------------
` Text Functions
`-------------------------------------------------------------------------------------------------
Function NewText(n,a$,textsize,textalign,r,g,b,t,v,x,y)
	CreateText(n,a$)
 	SetTextSize(n,textsize)
 	SetTextPosition(n,x,y)
 	SetTextAlignment(n,textalign)
 	SetTextColor(n,r,g,b,t)
 	SetTextVisible(n,v)
endfunction

function Text(iX as integer,iY as integer,iStr as string)
   tText=CreateText(iStr)
   SetTextPosition(tText,iX,iY)
   SetTextSize(tText,20)
   SetTextbold(tText,1)
   SetTextColor(tText,255,255,255,255)
endfunction

function CenterText(iX as integer,iY as integer,iStr as string)
   tText=CreateText(iStr)
   SetTextPosition(tText,iX-(GetTextTotalWidth(tText)*2.5),iY)
   SetTextSize(tText,20)
   SetTextbold(tText,1)
   SetTextColor(tText,255,255,255,255)
endfunction

`-------------------------------------------------------------------------------------------------
` CurveValue
`-------------------------------------------------------------------------------------------------
function CurveValue(current# as float,destination# as float,speed# as float)
   `if speed#<1.0 then speed#=1.0
   current#=current#+((destination#-current#)/speed#)
endfunction current#

`This command will return an auto-interpolated value based on a given speed. 
`function SP_CurveValue(current# as float, destination# as float, speed# as float)
	function SP_CurveValue(current# as float, destination# as float, speed# as float)
    		local diff# as float
    		if  speed# < 1.0  then speed# = 1.0
    		diff# = destination# - current#
    		current# = current# + ( diff# / speed# )
	endfunction current#

`-------------------------------------------------------------------------------------------------
` CurveAngle
`-------------------------------------------------------------------------------------------------
function CurveAngle(current# as float,destination# as float,speed# as float)
   current#=WrapAngle(CurveValue(0,WrapAngle(destination#+180-destination#)-180,speed#)+destination#)
endfunction current#

`This command will return an auto-interpolated angle based on a given speed. 
	function SP_CurveAngle(current# as float, destination# as float, speed# as float)
 		local diff# as float
		if speed# < 1.0 then speed# = 1.0
    		destination# = SP_WrapAngle( destination# )
    		current# = SP_WrapAngle( current# )
    		diff# = destination# - current#
    		if diff# <- 180.0 then diff# = ( destination# + 360.0 ) - current#
    		if diff# > 180.0 then diff# = destination# - ( current# + 360.0 )
    		current# = current# + ( diff# / speed# )
    		current# = SP_WrapAngle( current# )
 	endfunction current#

`-------------------------------------------------------------------------------------------------
` WrapValue
`-------------------------------------------------------------------------------------------------
function WrapAngle(angle# as float)
   angle#=(angle#/360)
   angle#=(angle#-floor(angle#))*360
endfunction angle#

`This command will return a value that does not exceed the range of 0 to 360. 
	function SP_WrapAngle( angle# as float) 
    	local iChunkOut as integer
    	local breakout as integer
    	iChunkOut = angle#
    	iChunkOut = iChunkOut - mod( iChunkOut, 360 )
    	angle# = angle# - iChunkOut
    	breakout = 100 //Normally the breakout is set to 10000
    	while angle# <= 0.0 or angle# >= 360.0 
        	if angle# <= 0.0 then angle# = angle# + 360.0
        	if angle# >= 360.0 then angle# = angle# - 360.0
        	dec breakout
        	if  breakout = 0  then exit
    	endwhile
    		if  breakout = 0  then angle# = 0.0
	endfunction angle#

`-------------------------------------------------------------------------------------------------

	function SP_Lerp(Start#,End#,Time#)
	endfunction Start#+Time#*(End#-Start#)

	function SP_Clamp(Value#,Min#,Max#)
		if Value#>Max# then Value#=Max#
		if Value#<Min# then Value#=Min#
	endfunction Value#

`-------------------------------------------------------------------------------------------------

`This command will return a value that represents the new X position of a point in 3D space
`currentXValue -- current value to calculate the new value from.
`angleValue -- angle value in degrees 0 to 360
`stepValue -- specifies how far in the specified direction you would like to calculate
	
	function CalculateNewXValue( currentXValue as float, angleValue as float, stepValue as float ) 
		result# = currentXValue + ( sin(angleValue) * stepValue )
	endfunction result#

`This command will return a value that represents the new Y position of a point in 3D space
`currentXValue -- current value to calculate the new value from.
`angleValue -- angle value in degrees 0 to 360
`stepValue -- specifies how far in the specified direction you would like to calculate
	function CalculateNewYValue( currentYValue as float, angleValue as float, stepValue as float ) 
		result# = currentYValue - ( sin(angleValue) * stepValue )
	endfunction result#

`This command will return a value that represents the new Z position of a point in 3D space
`currentXValue -- current value to calculate the new value from.
`angleValue -- angle value in degrees 0 to 360
`stepValue -- specifies how far in the specified direction you would like to calculate
	function CalculateNewZValue( currentZValue as float, angleValue as float, stepValue as float ) 
		result# = currentZValue + ( cos(angleValue) * stepValue )
	endfunction result#

`-------------------------------------------------------------------------------------------------

Function FNrange(x#)
	x#=tPi#*trunc(x#/tPi#)
EndFunction x#

`-------------------------------------------------------------------------------------------------

Function FNdegmin(x#)
	a#=trunc(x#)
	b#=x#-a#
	e#=trunc(60*b#)
	if e# >= 60
		e#=0
		a#=a#+1
	endif
EndFunction a#+e#/100	

`-------------------------------------------------------------------------------------------------

Function FNacos(x#)
	s#=atan((sqrt(1-x#*x#))/x#)
EndFunction s#

`-------------------------------------------------------------------------------------------------

Function FNasin(x#)
	s#=atan(x#/(sqrt(1-x#*x#)))
EndFunction s#

`-------------------------------------------------------------------------------------------------

Function FNatn2(y#,x#)
	a#=atan(y#/x#)
	if x# < 0 then a#=a#+(4*atan(1)) //Pi#
	if (y# < 0) and (x# > 0) then a#=a#+(4*atan(1))*2//tPi#
EndFunction a#

`-------------------------------------------------------------------------------------------------

Function DegSin#(x#)
    DegSin# = Sin(rads# * x#)
EndFunction DegSin#

`-------------------------------------------------------------------------------------------------

Function DegCos#(x#)
    DegCos# = Cos(rads# * x#)
EndFunction DegCos#

`-------------------------------------------------------------------------------------------------

Function DegTan#(x#)
    DegTan# = Tan(rads# * x#)
EndFunction DegTan#

`-------------------------------------------------------------------------------------------------

Function DegArcsin#(x#)
    DegArcsin# = degs# *Asin(x#)
EndFunction DegArcsin#

`-------------------------------------------------------------------------------------------------

Function DegArccos#(x#)
    DegArccos# = degs# * Acos(x#)
EndFunction DegArccos#

`-------------------------------------------------------------------------------------------------

Function DegArctan#(x#)
    DegArctan# = degs# * Atan(x#)
EndFunction DegArctan#

`-------------------------------------------------------------------------------------------------

Function DegAtan2#(y#, x#)
`this returns the angle in the range 0 to 360 instead of -180 to 180 - and swaps the arguments
    DegAtan2# = degs# * Atan2(x#, y#)
    If DegAtan2# < 0 Then DegAtan2# = DegAtan2# + 360
EndFunction DegAtan2#

`-------------------------------------------------------------------------------------------------

Function range2pi#(x#)
`returns an angle x in the range 0 to two pi rads
	range2pi# = x# - tPi# * trunc((x# / tPi#))
EndFunction range2Pi#

`-------------------------------------------------------------------------------------------------

Function range360#(x#)

`returns an angle x in the range 0 to 360 used to prevent the huge values of degrees
`that you get from mean longitude formulas this function is private to this module,
`you won't find it in the Function Wizard,and you can't use it on a spreadsheet.
`If you want it on the spreadsheet, just remove the 'private' keyword above.
	range360# = x# - 360 * trunc((x# / 360))
EndFunction range360#

`-------------------------------------------------------------------------------------------------

Function degdecimal#(days, minutes, seconds)
`converts from dms format to ddd format
    degdecimal# = days + minutes / 60 + seconds / 3600
EndFunction degdecimal#

`-------------------------------------------------------------------------------------------------
` Date Functions
`-------------------------------------------------------------------------------------------------

`-----[      FUNCTION to calculate Julian and J2000 Date	      ]-----
`-----[         Input is Year, Month, Day, and Hour		         ]-----  
`-----[            Hour input is a decimal input			         ]-----

Function FNday(Year as Integer,Month as Integer, Day as Integer, Hour as Integer)
	J2000#=(367*Year)-(7*(Year+((Month+9)/12))) / 4+(275*Month)/9+Day+1721013.5+Hour/24
EndFunction J2000#

function getCurrentDateInSeconds()
	d$= 	GetCurrentdate()
	day= 	val(right(d$,2))
	month= 	val(left(right(d$,5),2))
	year= 	val(left(d$,4))
	s= 		getDateInSeconds(year, month, day)
endfunction s

`-------------------------------------------------------------------------------------------------
						
function getDateInSeconds(year, month, day)
	seconds = (year-2000)*31556926 + month*2629743 + day*86400
endfunction seconds

`-------------------------------------------------------------------------------------------------
						
function getYear(seconds)
	year = (seconds / 31557600) + 2000		//Uses J2000 as starting point
endfunction year
 
`-------------------------------------------------------------------------------------------------
 
function getMonth(seconds)
	years = seconds / 31557600
	seconds = seconds - (years*31557600)
	month = seconds / 2629743
	month=month+1
endfunction month
 
`-------------------------------------------------------------------------------------------------
 
function getDay(seconds)
	years = seconds / 31557600 : seconds = seconds - (years*31557600)
	month = seconds / 2629743  : seconds = seconds - (month*2629743)
	day   = seconds / 86400
	day=day+1
endfunction day

`-------------------------------------------------------------------------------------------------
` Convert Julian [J2000] to Gregorian
`-------------------------------------------------------------------------------------------------
function convertJ2000toG(J2input)
	q=J2input+2451545  				//First convert to JD
	z=trunc(q)						//Take the integer
	w=trunc((z-1867216.25)/36524.25)	
	x=trunc(w/4)
	a=trunc(z+1+w-x)
	b=trunc(a+1524)
	c=trunc((b-122.1)/365.25)
	d=trunc(365.25*c)
	e=trunc((b-d)/30.6001)
	f=trunc(30.6001*e)
	
	DayfromJD=trunc(b-d-f+(q-z))
	
	if e-1 > 12
		MonthfromJD=trunc(e-13)
	else
		MonthfromJD=trunc(e-1)
	endif
	
	if MonthfromJD >2
		YearfromJD=trunc(c-4716)
	else
		YearfromJD=trunc(c-4715)
	endif
endfunction

function convertJDtoG(JDinput)
	q=JDinput  
	z=trunc(q)
	w=trunc((z-1867216.25)/36524.25)
	x=trunc(w/4)
	a=trunc(z+1+w-x)
	b=trunc(a+1524)
	c=trunc((b-122.1)/365.25)
	d=trunc(365.25*c)
	e=trunc((b-d)/30.6001)
	f=trunc(30.6001*e)
	
	DayfromJD=trunc(b-d-f+(q-z))
	
	if e-1 > 12
		MonthfromJD=trunc(e-13)
	else
		MonthfromJD=trunc(e-1)
	endif
	
	if MonthfromJD >2
		YearfromJD=trunc(c-4716)
	else
		YearfromJD=trunc(c-4715)
	endif
endfunction
