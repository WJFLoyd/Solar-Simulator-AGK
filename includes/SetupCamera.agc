`=================================================================================================================
` Project	: SolarSimulator.agc
` File		: SetupCamera.agc
` Created	: 01/25/2021
` Updated	: 12/13/2024
` Author	: W. Jean Floyd
`=================================================================================================================

Function SetUpCamera()
		
	`Lighting
	SetSunActive		(0)
	CreatePointLight	(1,0,0,0,1000,255,255,255)
	SetPointLightMode	(1,1)
	SetAmbientColor	(0,0,0)	
	
	`Camera
	SetCameraRange		(1,.01,11000)
	SetCameraPosition	(1,0,20,0)
	CameraAngleX#=		0
	CameraAngleY#=		0
	CameraAngleNewX#=	90
	CameraAngleNewY#=	90
	PointerDragX#=		-10
	PointerDragY#=		90  
	
  EndFunction