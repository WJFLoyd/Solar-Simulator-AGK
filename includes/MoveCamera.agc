`=================================================================================================================
` Project	: SolarSimulator.agc
` File		: MoveCamera.agc
` Created	: 01/26/2021
` Updated	: 11/13/2024
` Author	: W. Jean Floyd
`=================================================================================================================

function MoveCamera()
	`Make Sure the Sun Glow Plane is Always Facing the Camera
	SetObjectLookat(SunFlare,GetCameraX(1),GetCameraY(1),GetCameraZ(1),0)	

	`-------------------------------------------------------------------------------------------------
	` Go Back to Flight Mode After Exiting the Planet View Mode
	`-------------------------------------------------------------------------------------------------
	`If the user just exited the planet view mode [where ViewModeFlag=1], then reset everything back to normal flight mode.
	If ViewModeFlag=			On
		If GetRawKeyState(9)=	1 or GetRawKeyState(27)=1	//TAB Key or ESC Key Will Exit the View Planet Mode 
			ViewModeFlag=		Off					`Planet view mode off
			PathFlag=				On
			`gpup_emitterActive	(EffectOne,1)		`EmitterOne back on
			`gpup_emitterActive	(EffectTwo,1)		`EmitterTwo back on
			initialspeed#=		0.008333334			`.041666670			
			PointerDragX#=		0
			PointerDragY#=		0
  			SetCameraPosition	(1,Howfar*GetObjectWorldX(Planet),GetObjectWorldY(Planet),Howfar*GetObjectWorldZ(Planet))
  			for spritecount = 121 to 128			//Hide the Fact Sheet Sprites
				SetSpriteVisible(spritecount,0)
			next
			for counter=			2 to 9
				setobjectvisible(counter,1)
			next
			setobjectvisible	(SaturnRings,1)
			setobjectvisible	(EarthLights,1)
    		endif	
	else			

	`-------------------------------------------------------------------------------------------------
	` START FLIGHT MODE
	`-------------------------------------------------------------------------------------------------
	speed#=GetFrameTime()

	`Move faster while holding down the 'shift' key
	if GetRawKeyState(KEY_SHIFT) then speed#=15*GetFrameTime()
		
		VelocityZ#=SP_CurveValue(VelocityZ#,0,10.0)
		VelocityX#=SP_CurveValue(VelocityX#,0,10.0)
		VelocityY#=SP_CurveValue(VelocityY#,0,10.0)		
		
	`Move the Camera with W-A-S-D-Q-E-SpaceBar Keys
		if(GetRawKeyState(KEY_W)) 			then VelocityZ#=SP_CurveValue(VelocityZ#, speed#,10.0)	//W Key
		if(GetRawKeyState(KEY_S)) 			then VelocityZ#=SP_CurveValue(VelocityZ#,-speed#,10.0)	//S Key
		if(GetRawKeyState(KEY_A)) 			then VelocityX#=SP_CurveValue(VelocityX#,-speed#,10.0)	//A Key
		if(GetRawKeyState(KEY_D)) 			then VelocityX#=SP_CurveValue(VelocityX#, speed#,10.0)	//D Key
		if(GetRawKeyState(KEY_Q)) 			then VelocityY#=SP_CurveValue(VelocityY#,-speed#,10.0)	//Q Key
		if(GetRawKeyState(KEY_E)) 			then VelocityY#=SP_CurveValue(VelocityY#, speed#,10.0)	//E Key
		if(GetRawKeyState(KEY_Spacebar))	then VelocityY#=SP_CurveValue(VelocityY#, speed#,10.0)	//Space Bar Key
	
		MoveCameraLocalZ(1, VelocityZ# )
		MoveCameraLocalX(1, VelocityX# )
		MoveCameraLocalY(1, VelocityY# )
	
	`Rotate the Camera
		PointerX#=GetPointerX()
		PointerY#=GetPointerY()

		if GetRawMouseRightPressed()=1
			PointerStartX#=PointerX#
			PointerStartY#=PointerY#
			CameraAngleX#=GetCameraAngleX(1)
			CameraAngleY#=GetCameraAngleY(1)
		endif
	
		if GetRawMouseRightState()=1
			PointerDragX#=PointerX#-PointerStartX#
			PointerDragY#=PointerY#-PointerStartY#
		endif
        
			CameraAngleNewX#=SP_CurveAngle(CameraAngleNewX#,CameraAngleX#+PointerDragY#,45.0)//90
			CameraAngleNewY#=SP_CurveAngle(CameraAngleNewY#,CameraAngleY#+PointerDragX#,45.0)//90
        	        
			SetCameraRotation(1,CameraAngleNewX#,CameraAngleNewY#,0)

			`Rotate the Compass Accordingly
			SetSpriteAngle(50,CameraAngleNewX#)
			SetSpriteAngle(51,90+CameraAngleNewY#)
	endif
	`-------------------------------------------------------------------------------------------------
	` END FLIGHT MODE
	`-------------------------------------------------------------------------------------------------				
				
				
	`Get Mouse Click, If it is on a Sprite, Assign the sprite to HIT		
	if GetPointerPressed()=1					
		hit=GetSpriteHit(GetPointerX(),GetPointerY())
	endif
	
	`Press "1" for Mercury view
	if GetRawKeyPressed		(49) or hit=61 `Press the "1" button or click the mouse on the Mercury icon
  		Planet=					Mer
  		Howfar=					.71				`Place Cam on Sun Side of the Planet, .71 is 71% of the Distance from the Sun to the Planet
  		`gpup_emitterActive		(EffectTwo,0)	`Deactivate the Sun Emitter
  		`gpup_emitterActive		(EffectOne,0)	`Turn Off the Sun Emitter
  		PathFlag=					Off					`Turn off the Paths
  		NameFlag=					Off					`Turn off the Names
		ViewModeFlag=			On					`We are in ViewMode so Activate that Flag
		RotationFlag=			Off
  		initialspeed#=			0					`Stop Progressing the Time
  	 	SetCameraPosition		(1,Howfar*GetObjectWorldX(Planet),GetObjectWorldY(Planet),Howfar*GetObjectWorldZ(Planet))
    	SetCameraLookAt			(1,GetObjectWorldX(Planet),GetObjectWorldY(Planet),GetObjectWorldZ(Planet),0)
    	for spritecount = 		121 to 128		`Hide All of The Planet Description Sprites
			SetSpriteVisible	(spritecount,0)
		next
		for counter=				2 to 9				`Hide All Other Planets
			setobjectvisible	(counter,0)
		next
		setobjectvisible		(SaturnRings,0)`Hide the Rings of Saturn
		setobjectvisible		(EarthLights,0)`Hide the EarthLights
		SetObjectVisible		(2,1)				`Make the "Planet" Visible, In This Case it is Mer (Mercury)
		SetSpriteVisible		(121,1)			`Show the Mercury Description Sprite
	endif
	
	`Press "2" for Venus view
	if GetRawKeyPressed		(50) or hit=62
  		Planet=					Ven
  		Howfar=					.63
  		`gpup_emitterActive		(EffectTwo,0)
		PathFlag=					Off
  		NameFlag=					Off
		ViewModeFlag=			On
		RotationFlag=			Off
  		initialspeed#=			0
  		SetCameraPosition		(1,Howfar*GetObjectWorldX(Planet),GetObjectWorldY(Planet),Howfar*GetObjectWorldZ(Planet))
    	SetCameraLookAt			(1,GetObjectWorldX(Planet),GetObjectWorldY(Planet),GetObjectWorldZ(Planet),0)
  		for spritecount = 		121 to 128
			SetSpriteVisible	(spritecount,0)
		next
		for counter=				2 to 9
			setobjectvisible	(counter,0)
		next
		setobjectvisible		(SaturnRings,0)
		setobjectvisible		(EarthLights,0)`Hide the EarthLights
		SetObjectVisible		(3,1)
  		SetSpriteVisible		(122,1)
 	endif
	
	`Press "3" for Earth view
	if GetRawKeyPressed		(51) or hit=63
		Planet=					Ear
		Howfar=					.71
		`gpup_emitterActive		(EffectTwo,0)
		PathFlag=					Off
  		NameFlag=					Off
		ViewModeFlag=			On
		RotationFlag=			Off
  		initialspeed#=			0
  		SetCameraPosition		(1,Howfar*GetObjectWorldX(Planet),GetObjectWorldY(Planet),Howfar*GetObjectWorldZ(Planet))
    	SetCameraLookAt			(1,GetObjectWorldX(Planet),GetObjectWorldY(Planet),GetObjectWorldZ(Planet),0)
    	for spritecount = 		121 to 128
			SetSpriteVisible	(spritecount,0)
		next
    	for counter=				2 to 9
			setobjectvisible	(counter,0)`Hide all the Other Planets
		next
		setobjectvisible		(SaturnRings,0)`Hide SaturnRings
		setobjectvisible		(EarthLights,1)`Show EarthLights
		SetObjectVisible		(4,1)
    	SetSpriteVisible		(123,1)
 	endif
	
	`Press "4" for Mars view
	if GetRawKeyPressed		(52) or hit=64
  		Planet=					Mar
		Howfar=					.899
		`gpup_emitterActive		(EffectTwo,0)
		PathFlag=					Off
  		NameFlag=					Off
		ViewModeFlag=			On
		RotationFlag=			Off
  		initialspeed#=			0
  		SetCameraPosition		(1,Howfar*GetObjectWorldX(Planet),GetObjectWorldY(Planet),Howfar*GetObjectWorldZ(Planet))
    	SetCameraLookAt			(1,GetObjectWorldX(Planet),GetObjectWorldY(Planet),GetObjectWorldZ(Planet),0)
    	for spritecount = 		121 to 128
			SetSpriteVisible	(spritecount,0)
		next
		for counter=				2 to 9
			setobjectvisible	(counter,0)
		next
		setobjectvisible		(SaturnRings,0)
		setobjectvisible		(EarthLights,0)`Hide the EarthLights
		SetObjectVisible		(5,1)
  		SetSpriteVisible		(124,1)
	endif
	
	`Press "5" for Jupiter view
	if GetRawKeyPressed		(53) or hit=65
  		Planet=					Jup
		Howfar=					.4
		`gpup_emitterActive		(EffectTwo,0)
		PathFlag=					Off
  		NameFlag=					Off
		ViewModeFlag=			On
		RotationFlag=			Off
  		initialspeed#=			0
  		SetCameraPosition		(1,Howfar*GetObjectWorldX(Planet),GetObjectWorldY(Planet),Howfar*GetObjectWorldZ(Planet))
    	SetCameraLookAt			(1,GetObjectWorldX(Planet),GetObjectWorldY(Planet),GetObjectWorldZ(Planet),0)
    	for spritecount = 		121 to 128
			SetSpriteVisible	(spritecount,0)
		next
		for counter=				2 to 9
			setobjectvisible	(counter,0)
		next
		setobjectvisible		(SaturnRings,0)
		setobjectvisible		(EarthLights,0)`Hide the EarthLights
		SetObjectVisible		(6,1)
    	SetSpriteVisible		(125,1)
	endif
    	
	`Press "6" for Saturn view
	if GetRawKeyPressed		(54) or hit=66
  		Planet=					Sat
  		Howfar=					.74
  		`gpup_emitterActive		(EffectTwo,0)
		PathFlag=					Off
  		NameFlag=					Off
		ViewModeFlag=			On
		RotationFlag=			Off
  		initialspeed#=			0
  		SetCameraPosition		(1,Howfar*GetObjectWorldX(Planet),GetObjectWorldY(Planet),Howfar*GetObjectWorldZ(Planet))
    	SetCameraLookAt			(1,GetObjectWorldX(Planet),GetObjectWorldY(Planet),GetObjectWorldZ(Planet),0)
  		for spritecount = 		121 to 128
			SetSpriteVisible	(spritecount,0)
		next
		for counter=				2 to 9
			setobjectvisible	(counter,0)
		next
		setobjectvisible		(SaturnRings,1)
		setobjectvisible		(EarthLights,0)`Hide the EarthLights
		SetObjectVisible		(7,1)
    	SetSpriteVisible		(126,1)
    endif
    	
	`Press "7" for Uranus view
	if GetRawKeyPressed		(55) or hit=67
  		Planet=					Ura
  		Howfar=					.943
  		`gpup_emitterActive		(EffectTwo,0)
		PathFlag=					Off
  		NameFlag=					Off
		ViewModeFlag=			On
		RotationFlag=			Off
  		initialspeed#=			0
  		SetCameraPosition		(1,Howfar*GetObjectWorldX(Planet),GetObjectWorldY(Planet),Howfar*GetObjectWorldZ(Planet))
    	SetCameraLookAt			(1,GetObjectWorldX(Planet),GetObjectWorldY(Planet),GetObjectWorldZ(Planet),0)
  		for spritecount = 		121 to 128
			SetSpriteVisible	(spritecount,0)
		next
		for counter=				2 to 9
			setobjectvisible	(counter,0)
		next
		setobjectvisible		(SaturnRings,0)
		setobjectvisible		(EarthLights,0)`Hide the EarthLights
		SetObjectVisible		(8,1)
		SetSpriteVisible		(127,1)
	endif
    	
	`Press "8" for Neptune view
	if GetRawKeyPressed		(56) or hit=68
  		Planet=					Nep
  		Howfar=					.965
  		`gpup_emitterActive		(EffectTwo,0)
		PathFlag=					Off
  		NameFlag=					Off
		ViewModeFlag=			On
		RotationFlag=			Off
		initialspeed#=			0
  		SetCameraPosition		(1,Howfar*GetObjectWorldX(Planet),GetObjectWorldY(Planet),Howfar*GetObjectWorldZ(Planet))
    	SetCameraLookAt			(1,GetObjectWorldX(Planet),GetObjectWorldY(Planet),GetObjectWorldZ(Planet),0)
  		for spritecount = 		121 to 128
			SetSpriteVisible	(spritecount,0)
		next
		for counter=				2 to 9
			setobjectvisible	(counter,0)
		next
		setobjectvisible		(SaturnRings,0)
		setobjectvisible		(EarthLights,0)`Hide the EarthLights
		SetObjectVisible		(9,1)
    	SetSpriteVisible		(128,1)
	endif
endfunction

