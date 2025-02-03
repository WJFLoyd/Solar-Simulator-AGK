`=================================================================================================================
` Project	: SolarSimulator.agc
` File		: CreateAllText.agc
` Created	: 01/17/2021
` Updated	: 01/01/2025
` Author	: W. Jean Floyd
`=================================================================================================================

Function CreateAllText()
	`-------------------------------------------------------------------------------------------------
	` Set General Text Color
	`-------------------------------------------------------------------------------------------------
						
	`Displays a One-Line Help Message at the Bottom of the Screen
	NewText(40,"Distances and Sizes are compressed. Orbits and Locations Accurate by Date. Hold Right Mouse Button While Pressing W A S D Q E Space Bar to Free Fly. Press P for Print Data.",22,0,255,255,255,255,1,409,1407)
	
	`Setup Text for FPS Counter
	NewText(49,"FPS: ",			21,1,255,255,255,255,1,3388,1403)
		
	`Setup Text Current Time 
	NewText(50,"Local Time: ",	21,1,255,255,255,255,1,3208,1403)
		
	`Setup Hud Directional Numbers for the Navigation Cross at the Bottom Right of the Screen
	NewText(51,"NewX",				21,1,255,255,0,255,1,3220,1245)	
	NewText(52,"NewY",				21,1,0,255,255,255,1,3220,1265)		
	
	`Text for Speed in Bottom Right Corner of the HUD
	NewText(89,"Speed",			35,1,255,255,255,255,1,3372,1060)
		
	`Spare Text ID
	NewText(90,"",					21,1,255,255,255,255,0,0,0)
	
	`Text for Buttons on the Right Side of the Screen	
	`Call Function NewText(n,a$,textsize,textalign,r,g,b,t,v,x,y)	
	BeginTextX=BeginButtonX+10 //-60 Pixels to the Left of the Virtual Button
	BeginTextY=2+BeginButtonY-HalfButtonHeight  //Button Spacing Declared in LoadSprite.agc
	
	NewText	(91,	"Data",	20,1,255,255,255,355,1,BeginTextX,BeginTextY+ButtonSpacing*1)
	NewText	(92,	"Names",	20,1,255,255,255,255,1,BeginTextX,BeginTextY+ButtonSpacing*2)
	NewText	(93,	"Lines",	20,1,255,255,255,255,1,BeginTextX,BeginTextY+ButtonSpacing*3)
	NewText	(94,	"Grid",	20,1,255,255,255,255,1,BeginTextX,BeginTextY+ButtonSpacing*4)
	NewText	(95,	"Music",	20,1,255,255,255,255,1,BeginTextX,BeginTextY+ButtonSpacing*5)
	NewText	(96,	"Paths",	20,1,255,255,255,255,1,BeginTextX,BeginTextY+ButtonSpacing*6)
	NewText	(97,	"Plane",	20,1,255,255,255,255,1,BeginTextX,BeginTextY+ButtonSpacing*7)
	NewText	(98,	"Axis",	20,1,255,255,255,255,1,BeginTextX,BeginTextY+ButtonSpacing*8)
	NewText	(99,	"Cons",	20,1,255,255,255,255,1,BeginTextX,BeginTextY+ButtonSpacing*9)
	NewText	(100,	"Spin",	20,1,255,255,255,255,1,BeginTextX,BeginTextY+ButtonSpacing*10)
	NewText	(101,	"Spare",	20,1,255,255,255,255,1,BeginTextX,BeginTextY+ButtonSpacing*11)
	NewText	(102,	"Spare",	20,1,255,255,255,255,1,BeginTextX,BeginTextY+ButtonSpacing*12)
	NewText	(103,	"Spare",	20,1,255,255,255,255,1,BeginTextX,BeginTextY+ButtonSpacing*13)
	NewText	(104,	"Spare",	20,1,255,255,255,255,1,BeginTextX,BeginTextY+ButtonSpacing*14)
	NewText	(105,	"EXIT",	20,1,255,255,255,255,1,BeginTextX,BeginTextY+ButtonSpacing*15)
	`Set the Button Text to BOLD
	For count = 91 to 105
		SetTextBold(count,1)
	next	
	
	`Text for the Date Information at the Top Left of the Screen
	`Call Function NewText(n,a$,textsize,textalign,r,g,b,t,v,x,y)	
		
	NewText(53,"Simulated YEAR",	24,0,255,255,255,255,1,96,19)
	NewText(54,"SimYear",				24,2,255,255,255,255,1,310,19)
	
	NewText(55,"Simulated MONTH",	24,0,255,255,255,255,1,96,52)
	NewText(56,"SimMonth",			24,2,255,255,255,255,1,310,52)
	
	NewText(57,"Simulated DAY",		24,0,255,255,255,255,1,96,84)
	NewText(58,"SimDay",				24,2,255,255,255,255,1,310,84)
			
	`Setup all of the Text for the Left HUD Window
	`Call Function NewText(n,a$,textsize,textalign,r,g,b,t,v,x,y)	
		
	ystart=LeftHudTopLeftY+	57 	`Position Text Based on HUD Sprite Location, Refer to LoadSprites.agc
	xstart1=LeftHudTopLeftX+	95		`Position Text Based on HUD Sprite Location, Refer to LoadSprites.agc	
	xstart2=xstart1+			350
	LeftHudTextSpacing=		50
	
	NewText(59,"d# [days]",			26,0,255,255,255,255,0,xstart1,ystart)
	NewText(60,"d# [days]",			26,2,255,255,255,255,0,xstart2,ystart)
	NewText(61,"dstart# [days]",	26,0,255,255,255,255,0,xstart1,ystart+LeftHudTextSpacing*1)
	NewText(62,"dstart# [days]",	26,2,255,255,255,255,0,xstart2,ystart+LeftHudTextSpacing*1)
	NewText(63,"Days Elapsed",		26,0,255,255,255,255,0,xstart1,ystart+LeftHudTextSpacing*2)
	NewText(64,"Days Elapsed",		26,2,255,255,255,255,0,xstart2,ystart+LeftHudTextSpacing*2)
	NewText(65,"Frame Time [s]",	26,0,255,255,255,255,0,xstart1,ystart+LeftHudTextSpacing*3)
	NewText(66,"Frame Time [s]",	26,2,255,255,255,255,0,xstart2,ystart+LeftHudTextSpacing*3)
	NewText(67,"PointerDragX",		26,0,255,255,255,255,0,xstart1,ystart+LeftHudTextSpacing*4)
	NewText(68,"PointerDragX",		26,2,255,255,255,255,0,xstart2,ystart+LeftHudTextSpacing*4)
	NewText(69,"PointerDragY",		26,0,255,255,255,255,0,xstart1,ystart+LeftHudTextSpacing*5)
	NewText(70,"PointerDragY",		26,2,255,255,255,255,0,xstart2,ystart+LeftHudTextSpacing*5)
	NewText(71,"CameraAngleX",		26,0,255,255,255,255,0,xstart1,ystart+LeftHudTextSpacing*6)
	NewText(72,"CameraAngleX",		26,2,255,255,255,255,0,xstart2,ystart+LeftHudTextSpacing*6)
	NewText(73,"CameraAngleY",		26,0,255,255,255,255,0,xstart1,ystart+LeftHudTextSpacing*7)
	NewText(74,"CameraAngleY",		26,2,255,255,255,255,0,xstart2,ystart+LeftHudTextSpacing*7)
	NewText(75,"CameraAngleNewX",	26,0,255,255,255,255,0,xstart1,ystart+LeftHudTextSpacing*8)
	NewText(76,"CameraAngleNewX",	26,2,255,255,255,255,0,xstart2,ystart+LeftHudTextSpacing*8)
	NewText(77,"CameraAngleNewY",	26,0,255,255,255,255,0,xstart1,ystart+LeftHudTextSpacing*9)
	NewText(78,"CameraAngleNewY",	26,2,255,255,255,255,0,xstart2,ystart+LeftHudTextSpacing*9)	
	NewText(79,"Timer()",				26,0,255,255,255,255,0,xstart1,ystart+LeftHudTextSpacing*10)	
	NewText(80,"Timer()",				26,2,255,255,255,255,0,xstart2,ystart+LeftHudTextSpacing*10)	
	NewText(81,"Days Per Second",	26,0,255,255,255,255,0,xstart1,ystart+LeftHudTextSpacing*11)	
	NewText(82,"Days Per Second",	26,2,255,255,255,255,0,xstart2,ystart+LeftHudTextSpacing*11)	
	NewText(83,"InitialSpeed",		26,0,255,255,255,255,0,xstart1,ystart+LeftHudTextSpacing*12)	
	NewText(84,"InitialSpeed",		26,2,255,255,255,255,0,xstart2,ystart+LeftHudTextSpacing*12)	
	NewText(85,"Mouse X",				26,0,255,255,255,255,0,xstart1,ystart+LeftHudTextSpacing*13)	
	NewText(86,"Mouse X",				26,2,255,255,255,255,0,xstart2,ystart+LeftHudTextSpacing*13)	
	NewText(87,"Mouse Y",				26,0,255,255,255,255,0,xstart1,ystart+LeftHudTextSpacing*14)	
	NewText(88,"Mouse Y",				26,2,255,255,255,255,0,xstart2,ystart+LeftHudTextSpacing*14)				
	
	`Create AGK Program WaterMark								
	NewText(150,"Solar System Simulator, an AGK Program",26,0,255,255,255,100,1,3,1406)
Endfunction


