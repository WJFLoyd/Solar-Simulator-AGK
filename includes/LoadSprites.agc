`=================================================================================================================
` Project	: SolarSimulator.agc
` File		: LoadSprites.agc
` Created	: 11/23/2023
` Updated	: 12/26/2024
` Author	: W. Jean Floyd
`=================================================================================================================/

Function LoadSprites()
	`-------------------------------------------------------------------------------------------------
	` Setup the Left and Right HUDs
	`-------------------------------------------------------------------------------------------------
	`Setup the Bottom Right HUD "BRH" and Left Data HUD And Direcional Indicators

	`Load Images for the HUD Sprites
	LoadImage				(50,"CompassOutside.png")	`Directional HUD Image
	LoadImage				(51,"CompassInside.png")	`Directional HUD Image
	LoadImage				(52,"Compass.png")			`Directional HUD Image
	LoadImage				(53,"DataHudVersion.png")	`Left Data HUD Image
	LoadImage				(54,"BottomRightHud.png")	`Load Right Bottom Fixed HUD
	LoadImage				(55,"PlanetHUD.png")
	
	`Create the HUD Sprites
	For SpriteCount=50 to 55
		CreateSprite		(SpriteCount,SpriteCount)
	next
	SetSpriteVisible		(52,0)							`Hide Part of the Directional HUD, We Don't Like This ATM
	
	`Set the HUD Sprite Locations and Parameters for the Bottom Right HUD
	SetSpritePosition		(54,2925,1045)					`Position the Main Bottom Right HUD		
	SetSpriteScale			(54,.5,.5)
	SetSpriteTransparency	(54,2)
	SetSpriteVisible		(54,1)

	`Set the HUD Sprite Locations and Parameters for the Directional HUD Compass								
	SetSpritePosition		(50,3090,1100)					`Set Directional HUD Sprite Characteristics
	SetSpritePosition		(51,3090,1100)

	SetSpriteTransparency	(50,2)
	SetSpriteTransparency	(51,2)
	SetSpriteScale			(50,.15,.15)
	SetSpriteScale			(51,.15,.15)

	`Set the HUD Sprite Locations and Parameters for the Left Data HUD								
	LeftHudTopLeftX=		315	`Also Used Later to Determine Text Placement (CreateAllText.AGC) Within the Sprite
	LeftHudTopLeftY=		150	`Also Used Later to Determine Text Placement (CreateAllText.AGC) Within the Sprite

	`Setup the Left Data HUD and Hide it Until Called by Buttons
	SetSpritePosition		(53,LeftHudTopLeftX,LeftHudTopLeftY)	
	SetSpriteScale			(53,.93,.9)
	SetSpriteTransparency	(53,2)
	SetSpriteVisible		(53,0)
	
	`PlanetHUD	
	SetSpriteScale			(55,.75,.75)
	SetSpritePosition		(55,1000,130)
	SetSpriteVisible		(55,0)

	`-------------------------------------------------------------------------------------------------
	` Planet Icon Sprites
	`-------------------------------------------------------------------------------------------------
	`Load Images for the Planet Icons
	LoadImage				(61,"MiniMer.png")			
	LoadImage				(62,"MiniVen.png")
	LoadImage				(63,"MiniEar.png")
	LoadImage				(64,"MiniMar.png")
	LoadImage				(65,"MiniJup.png")
	LoadImage				(66,"MiniSat.png")
	LoadImage				(67,"MiniUra.png")
	LoadImage				(68,"MiniNep.png")

	`Create the Sprites for the Planet Icons								
	for spritecount = 61 to 68						
		CreateSprite		(spritecount,spritecount)
		SetSpriteTransparency(spritecount,2)
		SetSpriteVisible	(spritecount,0)
		SetSpriteScale		(spritecount,.05,.05)
	next
	
	for spritecount=69 to 76
		CloneSprite(spritecount,spritecount-8)
		SetSpriteVisible(spritecount,0)
	next
	
	`-------------------------------------------------------------------------------------------------
	` Planet Fact Sheet Sprites
	`-------------------------------------------------------------------------------------------------	
	`Load Images for the Planet Fact Sheets
	LoadImage				(121,"MerFacts.png")
	LoadImage				(122,"VenFacts.png")
	LoadImage				(123,"EarFacts.png")
	LoadImage				(124,"MarFacts.png")
	LoadImage				(125,"JupFacts.png")
	LoadImage				(126,"SatFacts.png")
	LoadImage				(127,"UraFacts.png")
	LoadImage				(128,"NepFacts.png")

	`Create Planet Fact Sheet Sprites
	for spritecount = 121 to 128					
		CreateSprite		(spritecount,spritecount)
		SetSpriteTransparency(spritecount,0)
		SetSpriteScale		(spritecount,1,1)
		SetSpritePosition	(spritecount,2400,155)
		SetSpriteVisible	(spritecount,0)
	next

	`-------------------------------------------------------------------------------------------------
	` Slider Buttons
	`-------------------------------------------------------------------------------------------------	
	`Slider Button Images for On and Off
	LoadImage	(ButtonOn,   	"Square Button Black On.png")
	LoadImage	(ButtonOff,  	"Square Button Black Off.png")

	`Setup Starting Location and Spacing for the Slider Buttions
	BeginButtonX=		3372		`Beginning X Location of the Buttons
	BeginButtonY=		250		`Beginning Y Location of the Buttons
	ButtonSpacing=		50			`Vertical Spacing of the Buttons
	ButtonHeight=		55	
	HalfButtonHeight=	55/4
	
	`Add 8 Virtual Slider Buttons Using the Location and Spacing Parameters	
	For bcount=1 to 15 step 1	`Reserved to 20					
		AddVirtualButton				(bcount,BeginButtonX,BeginButtonY+bcount*ButtonSpacing,110)	
		SetVirtualButtonSize			(bcount,100,55)
		SetVirtualButtonImageUp		(bcount,ButtonOn)
		SetVirtualButtonImageDown	(bcount,ButtonOff)
		SetVirtualButtonAlpha			(bcount,125)
	next	
	
	`-------------------------------------------------------------------------------------------------
	` Plus-Minus Buttons
	`-------------------------------------------------------------------------------------------------	
	`Load Images for the Plus/Minus Button for Changing the Year, Month, and Day
	PlusUp=LoadImage		("PlusUp.png")												
	PlusDn=LoadImage		("PlusDn.png")												
	MinusUp=LoadImage		("MinusUp.png")												
	MinusDn=LoadImage		("MinusDn.png")												
	Bs=32 					`ButtonSize

	`Setup the Plus-Minus Buttons Using the Loaded Images
	`Start at 21
	AddVirtualButton				(21,Bs,Bs,Bs)		`Plus Year
	SetVirtualButtonImageUp		(21,PlusUp)
	SetVirtualButtonImageDown	(21,PlusDn)

	AddVirtualButton				(22,Bs*2,Bs,Bs)	`Minus Year
	SetVirtualButtonImageUp		(22,MinusUp)
	SetVirtualButtonImageDown	(22,MinusDn)

	AddVirtualButton				(23,Bs,Bs*2,Bs)	`Plus Month
	SetVirtualButtonImageUp		(23,PlusUp)
	SetVirtualButtonImageDown	(23,PlusDn)

	AddVirtualButton				(24,Bs*2,BS*2,Bs)	`Minus Month
	SetVirtualButtonImageUp		(24,MinusUp)
	SetVirtualButtonImageDown	(24,MinusDn)

	AddVirtualButton				(25,Bs,Bs*3,Bs)	`Plus Day
	SetVirtualButtonImageUp		(25,PlusUp)
	SetVirtualButtonImageDown	(25,PlusDn)

	AddVirtualButton				(26,Bs*2,Bs*3,32)	`/Minus Day
	SetVirtualButtonImageUp		(26,MinusUp)
	SetVirtualButtonImageDown	(26,MinusDn)
EndFunction