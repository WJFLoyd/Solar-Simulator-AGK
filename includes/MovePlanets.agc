`=================================================================================================================
` Project	: SolarSimulator.agc
` File		: MovePlanets.agc
` Created	: 01/25/2022
` Updated	: 11/09/2024
` Author	: W. Jean Floyd
`=================================================================================================================

Function MovePlanets()
	d#=d#+initialspeed#			`Days since Epoch of 1/1/2000
	DaysElapsed#=d#-dstart#		`Elapsed Days Since Start
		
	`Convert Days Since Epoch to Gregorian Date [MDY]	
	ConvertJ2000toG(d#)
	SimYear#=		YearfromJD		`getYear(dseconds#)
	SimMonth#=	MonthfromJD		`getMonth(dseconds#)
	SimDay#=		DayfromJD			`getDay(dseconds#)

	`Update the Year/Month/Day TextStrings to Simulated Dates, Initially Setup in "CreateAllText.agc"		
	SetTextString(54,str(trunc(SimYear#)))	
	SetTextString(56,str(trunc(SimMonth#)))
	SetTextString(58,str(trunc(SimDay#)))

	`Rotate the Planets, Sun, Moon (NOT ACCURATE but a reasonable estimate) When Spin Button Active		
	if RotationFlag=On
		SetVirtualButtonImageUp	(10,ButtonOn)
		RotateObjectLocalY(Sun,CommonMultiplier*-.934944) `24/25.67
		RotateObjectLocalY(Mer,Mercury.spin)
		RotateObjectLocalY(Ven,Venus.spin)
		RotateObjectLocalY(Ear,Earth.spin)
		RotateObjectLocalY(Mar,Mars.spin)
		RotateObjectLocalY(Jup,Jupiter.spin)
		RotateObjectLocalY(Sat,Saturn.spin)
		RotateObjectLocalY(Ura,Uranus.spin)
		RotateObjectLocalY(Nep,Neptune.spin)
		`RotateObjectLocalY(EarthMoon,10.05)
	else
		`Otherwise Just Apply a Slow Rotation for Each Planet for Visual Effect
		RotationFlag=Off
		SetVirtualButtonImageUp	(10,ButtonOff)
		RotateObjectLocalY(Sun,.05)
		RotateObjectLocalY(Mer,-.1)
		RotateObjectLocalY(Ven,.1)
		RotateObjectLocalY(Ear,-.1)
		RotateObjectLocalY(Mar,-.1)
		RotateObjectLocalY(Jup,-.1)
		RotateObjectLocalY(Sat,-.1)
		RotateObjectLocalY(Ura,.1)
		RotateObjectLocalY(Nep,-.1)
		`RotateObjectLocalY(EarthMoon,.05)
	endif
		
	`MERCURY Movement Calculation Using Keplerian Equations..............................................................................................
		
	MMer# = WrapAngle(Mercury.daily_motion * d# + Mercury.mean_long - Mercury.l_of_peri)
	vMer# = MMer#+Rads#*(((2*Mercury.ecc-Mercury.ecc^.75)*sin(MMer#)) + (1.25*Mercury.ecc^2*sin(2*MMer#)) + (1.0833*Mercury.ecc^3*sin(3*MMer#)))
	rMer# = Mercury.dist*(1-Mercury.ecc^2)/(1+Mercury.ecc*cos(vMer#))
	Mervop#=WrapAngle(vMer#+Mercury.l_of_peri-Mercury.l_of_anode)
	
	XMer#=rMer#*(cos(Mercury.l_of_anode)*cos(Mervop#)-sin(Mercury.l_of_anode)*sin(Mervop#)*cos(Mercury.incli))
	YMer#=rMer#*(sin(Mercury.L_of_anode)*cos(Mervop#)+cos(Mercury.l_of_anode)*sin(Mervop#)*cos(Mercury.incli))
	ZMer#=rMer#*(sin(Mervop#)*sin(Mercury.incli))
	
	SetObjectPosition(Mer,XMer#*DisS#,ZMer#*DisS#,YMer#*DisS#)
		
	`VENUS Movement Calculation Using Keplerian Equations................................................................................................
	
	MVen# = WrapAngle(Venus.daily_motion * d# + Venus.mean_long - Venus.l_of_peri)
	vVen# = MVen#+Rads#*(((2*Venus.ecc-Venus.ecc^.75)*sin(MVen#)) + (1.25*Venus.ecc^2*sin(2*MVen#)) + (1.0833*Venus.ecc^3*sin(3*MVen#)))
	rVen# = Venus.dist*(1-Venus.ecc^2)/(1+Venus.ecc*cos(vVen#))
	Venvop#=WrapAngle(vVen#+Venus.l_of_peri-Venus.l_of_anode)
	
	XVen#=rVen#*(cos(Venus.l_of_anode)*cos(Venvop#)-sin(Venus.l_of_anode)*sin(Venvop#)*cos(Venus.incli))
	YVen#=rVen#*(sin(Venus.L_of_anode)*cos(Venvop#)+cos(Venus.l_of_anode)*sin(Venvop#)*cos(Venus.incli))
	ZVen#=rVen#*(sin(Venvop#)*sin(Venus.incli))
	
	SetObjectPosition(Ven,XVen#*DisS#,ZVen#*DisS#,YVen#*DisS#)
		
	`EARTH Movement Calculation Using Keplerian Equations...............................................................................................
	
	MEar# = WrapAngle(Earth.daily_motion * d# + Earth.mean_long - Earth.l_of_peri)
	vEar# = MEar#+Rads#*(((2*Earth.ecc-Earth.ecc^.75)*sin(MEar#)) + (1.25*Earth.ecc^2*sin(2*MEar#)) + (1.0833*Earth.ecc^3*sin(3*MEar#)))
	rEar# = Earth.dist*(1-Earth.ecc^2)/(1+Earth.ecc*cos(vEar#))
	Earvop#=WrapAngle(vEar#+Earth.l_of_peri-Earth.l_of_anode)
	
	XEar#=rEar#*(cos(Earth.l_of_anode)*cos(Earvop#)-sin(Earth.l_of_anode)*sin(Earvop#)*cos(Earth.incli))
	YEar#=rEar#*(sin(Earth.L_of_anode)*cos(Earvop#)+cos(Earth.l_of_anode)*sin(Earvop#)*cos(Earth.incli))
	ZEar#=rEar#*(sin(Earvop#)*sin(Earth.incli))
	
	SetObjectPosition(Ear,XEar#*DisS#,ZEar#*DisS#,YEar#*DisS#)
	SetObjectPosition(EarthMoon,.2*XEar#*DisS#,.2*ZEar#*DisS#,.2*YEar#*DisS#)	//Earth/Moon Object, Fix the .2, it's just a placeholder and isn't accurate

	`MARS Movement Calculation Using Keplerian Equations................................................................................................
	
	MMar# = WrapAngle(Mars.daily_motion * d# + Mars.mean_long - Mars.l_of_peri)
	vMar# = MMar#+Rads#*(((2*Mars.ecc-Mars.ecc^.75)*sin(MMar#)) + (1.25*Mars.ecc^2*sin(2*MMar#)) + (1.0833*Mars.ecc^3*sin(3*MMar#)))
	rMar# = Mars.dist*(1-Mars.ecc^2)/(1+Mars.ecc*cos(vMar#))
	Marvop#=WrapAngle(vMar#+Mars.l_of_peri-Mars.l_of_anode)
	
	XMar#=rMar#*(cos(Mars.l_of_anode)*cos(Marvop#)-sin(Mars.l_of_anode)*sin(Marvop#)*cos(Mars.incli))
	YMar#=rMar#*(sin(Mars.L_of_anode)*cos(Marvop#)+cos(Mars.l_of_anode)*sin(Marvop#)*cos(Mars.incli))
	ZMar#=rMar#*(sin(Marvop#)*sin(Mars.incli))
	
	SetObjectPosition(Mar,XMar#*DisS#,ZMar#*DisS#,YMar#*DisS#)
	
	`JUPITER Movement Calculation Using Keplerian Equations................................................................................................
	
	MJup# = WrapAngle(Jupiter.daily_motion * d# + Jupiter.mean_long - Jupiter.l_of_peri)
	vJup# = MJup#+Rads#*(((2*Jupiter.ecc-Jupiter.ecc^.75)*sin(MJup#)) + (1.25*Jupiter.ecc^2*sin(2*MJup#)) + (1.0833*Jupiter.ecc^3*sin(3*MJup#)))
	rJup# = Jupiter.dist*(1-Jupiter.ecc^2)/(1+Jupiter.ecc*cos(vJup#))
	Jupvop#=WrapAngle(vJup#+Jupiter.l_of_peri-Jupiter.l_of_anode)
	
	XJup#=rJup#*(cos(Jupiter.l_of_anode)*cos(Jupvop#)-sin(Jupiter.l_of_anode)*sin(Jupvop#)*cos(Jupiter.incli))
	YJup#=rJup#*(sin(Jupiter.L_of_anode)*cos(Jupvop#)+cos(Jupiter.l_of_anode)*sin(Jupvop#)*cos(Jupiter.incli))
	ZJup#=rJup#*(sin(Jupvop#)*sin(Jupiter.incli))
	
	SetObjectPosition(Jup,XJup#*DisS#,ZJup#*DisS#,YJup#*DisS#)
		
	`SATURN Movement Calculation Using Keplerian Equations
	MSat# = WrapAngle(Saturn.daily_motion * d# + Saturn.mean_long - Saturn.l_of_peri)
	vSat# = MSat#+Rads#*(((2*Saturn.ecc-Saturn.ecc^.75)*sin(MSat#)) + (1.25*Saturn.ecc^2*sin(2*MSat#)) + (1.0833*Saturn.ecc^3*sin(3*MSat#)))
	rSat# = Saturn.dist*(1-Saturn.ecc^2)/(1+Saturn.ecc*cos(vSat#))
	Satvop#=WrapAngle(vSat#+Saturn.l_of_peri-Saturn.l_of_anode)
	
	XSat#=rSat#*(cos(Saturn.l_of_anode)*cos(Satvop#)-sin(Saturn.l_of_anode)*sin(Satvop#)*cos(Saturn.incli))
	YSat#=rSat#*(sin(Saturn.L_of_anode)*cos(Satvop#)+cos(Saturn.l_of_anode)*sin(Satvop#)*cos(Saturn.incli))
	ZSat#=rSat#*(sin(Satvop#)*sin(Saturn.incli))
	
	SetObjectPosition(Sat,XSat#*DisS#,ZSat#*DisS#,YSat#*DisS#)
	
	`URANUS Movement Calculation Using Keplerian Equations
	MUra# = WrapAngle(Uranus.daily_motion * d# + Uranus.mean_long - Uranus.l_of_peri)
	vUra# = MUra#+Rads#*(((2*Uranus.ecc-Uranus.ecc^.75)*sin(MUra#)) + (1.25*Uranus.ecc^2*sin(2*MUra#)) + (1.0833*Uranus.ecc^3*sin(3*MUra#)))
	rUra# = Uranus.dist*(1-Uranus.ecc^2)/(1+Uranus.ecc*cos(vUra#))
	Uravop#=WrapAngle(vUra#+Uranus.l_of_peri-Uranus.l_of_anode)
	
	XUra#=rUra#*(cos(Uranus.l_of_anode)*cos(Uravop#)-sin(Uranus.l_of_anode)*sin(Uravop#)*cos(Uranus.incli))
	YUra#=rUra#*(sin(Uranus.L_of_anode)*cos(Uravop#)+cos(Uranus.l_of_anode)*sin(Uravop#)*cos(Uranus.incli))
	ZUra#=rUra#*(sin(Uravop#)*sin(Uranus.incli))
	
	SetObjectPosition(Ura,XUra#*DisS#,ZUra#*DisS#,YUra#*DisS#)

	`NEPTUNE Movement Calculation Using Keplerian Equations
	MNep# = WrapAngle(Neptune.daily_motion * d# + Neptune.mean_long - Neptune.l_of_peri)
	vNep# = MNep#+Rads#*(((2*Neptune.ecc-Neptune.ecc^.75)*sin(MNep#)) + (1.25*Neptune.ecc^2*sin(2*MNep#)) + (1.0833*Neptune.ecc^3*sin(3*MNep#)))
	rNep# = Neptune.dist*(1-Neptune.ecc^2)/(1+Neptune.ecc*cos(vNep#))
	Nepvop#=WrapAngle(vNep#+Neptune.l_of_peri-Neptune.l_of_anode)
	
	XNep#=rNep#*(cos(Neptune.l_of_anode)*cos(Nepvop#)-sin(Neptune.l_of_anode)*sin(Nepvop#)*cos(Neptune.incli))
	YNep#=rNep#*(sin(Neptune.L_of_anode)*cos(Nepvop#)+cos(Neptune.l_of_anode)*sin(Nepvop#)*cos(Neptune.incli))
	ZNep#=rNep#*(sin(Nepvop#)*sin(Neptune.incli))
	
	SetObjectPosition(Nep,XNep#*DisS#,ZNep#*DisS#,YNep#*DisS#)
	
	`Get all Screen X,Y Positions for the Sun and Each Planet
	screen_SunX#=GetScreenXFrom3d(GetObjectX(Sun),GetObjectY(Sun),GetObjectZ(Sun))
	screen_SunY#=GetScreenYFrom3d(GetObjectX(Sun),GetObjectY(Sun),GetObjectZ(Sun))
		
	screen_MerX#=GetScreenXFrom3d(GetObjectX(Mer),GetObjectY(Mer),GetObjectZ(Mer))
	screen_MerY#=GetScreenYFrom3d(GetObjectX(Mer),GetObjectY(Mer),GetObjectZ(Mer))
	
	screen_VenX#=GetScreenXFrom3d(GetObjectX(Ven),GetObjectY(Ven),GetObjectZ(Ven))
	screen_VenY#=GetScreenYFrom3d(GetObjectX(Ven),GetObjectY(Ven),GetObjectZ(Ven))
	
	screen_EarX#=GetScreenXFrom3d(GetObjectX(Ear),GetObjectY(Ear),GetObjectZ(Ear))
	screen_EarY#=GetScreenYFrom3d(GetObjectX(Ear),GetObjectY(Ear),GetObjectZ(Ear))
	
	screen_MarX#=GetScreenXFrom3d(GetObjectX(Mar),GetObjectY(Mar),GetObjectZ(Mar))
	screen_MarY#=GetScreenYFrom3d(GetObjectX(Mar),GetObjectY(Mar),GetObjectZ(Mar))
	
	screen_JupX#=GetScreenXFrom3d(GetObjectX(Jup),GetObjectY(Jup),GetObjectZ(Jup))
	screen_JupY#=GetScreenYFrom3d(GetObjectX(Jup),GetObjectY(Jup),GetObjectZ(Jup))
	
	screen_SatX#=GetScreenXFrom3d(GetObjectX(Sat),GetObjectY(Sat),GetObjectZ(Sat))
	screen_SatY#=GetScreenYFrom3d(GetObjectX(Sat),GetObjectY(Sat),GetObjectZ(Sat))
	
	screen_UraX#=GetScreenXFrom3d(GetObjectX(Ura),GetObjectY(Ura),GetObjectZ(Ura))
	screen_UraY#=GetScreenYFrom3d(GetObjectX(Ura),GetObjectY(Ura),GetObjectZ(Ura))
	
	screen_NepX#=GetScreenXFrom3d(GetObjectX(Nep),GetObjectY(Nep),GetObjectZ(Nep))
	screen_NepY#=GetScreenYFrom3d(GetObjectX(Nep),GetObjectY(Nep),GetObjectZ(Nep))
EndFunction