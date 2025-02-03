`=================================================================================================================
` Project	: SolarSimulator.agc
` File		: PrintData.agc
` Created	: 05/05/2022
` Updated	: 01/01/2025
` Author	: W. Jean Floyd
`=================================================================================================================

Function PrintData()
	`Print Some Right HUD Data
	`Print the FPS counter in the HUD			
	SetTextString(49,str(ScreenFPS(),2))
	
	`Print the Current Time and Animation Speed in the HUD							
	SetTextString(50,GetCurrentTime())
	SetTextstring(89,str(Round(screenfps()*initialspeed#)))///.04166667)))
			
	`Print NewX and NewY in the Navigation Compass, Lower Right of Screen
	SetTextString(51,str(Trunc(CameraAngleNewX#)))
	SetTextString(52,str(Trunc(CameraAngleNewY#)))

	`-------------------------------------------------------------------------------------------------
	` FLAG CHECKING AND REACTION TO VIRTUAL BUTTON PRESSES
	`-------------------------------------------------------------------------------------------------

	`DATA DataFlag-Left HUD Data display  	  		
	If DataFlag=On
		SetVirtualButtonImageUp	(1,ButtonOn)
		SetSpriteVisible			(53,1)	`Make the Left Data HUD Visible
		SetTextVisible				(40,1)	`Help Line at the bottom
						
		For textcount=59 to 88
			SetTextVisible(textcount,1)
		next	
				
		SetTextString(60,str(d#,3))
		SetTextString(62,str(dstart#,3))
		SetTextString(64,str(DaysElapsed#,3))
		SetTextString(66,str(GetFrameTime(),3))
		SetTextString(68,str(PointerDragX#,3))
		SetTextString(70,str(PointerDragY#,3))
		SetTextString(72,str(CameraAngleX#,3))
		SetTextString(74,str(CameraAngleY#,3))
		SetTextstring(76,str(CameraAngleNewX#,3))
		SetTextstring(78,str(CameraAngleNewY#,3))
		SetTextString(80,str(Timer(),3))
		SetTextString(82,str(screenfps()*initialspeed#,3))
		SetTextString(84,str(initialspeed#,3))
		SetTextstring(86,str(GetRawMouseX(),3))
		SetTextstring(88,str(GetRawMouseY(),3))
	else	
		DataFlag=Off
		SetVirtualButtonImageUp	(1,ButtonOff)
		SetSpriteVisible		(53,0)
		SetTextVisible			(40,0)
		for textcount=59 to 88 step 1
			SetTextVisible		(textcount,0)
		next
	endif
	
	`NAME NameFlag-Print Planet Names
	If NameFlag=On
		SetVirtualButtonImageUp	(2,ButtonOn)
		SetSpritePosition(61,10,screen_MerY#-20)
		SetSpritePosition(62,10,screen_VenY#-20)
		SetSpritePosition(63,10,screen_EarY#-20)
		SetSpritePosition(64,10,screen_MarY#-20)
		SetSpritePosition(65,10,screen_JupY#-20)
		SetSpritePosition(66,10,screen_SatY#-20)
		SetSpritePosition(67,10,screen_UraY#-20)
		SetSpritePosition(68,10,screen_NepY#-20)
			
		if GetObjectInScreen(Mer)=1
			SetSpriteVisible(61,1)
		else
			SetSpriteVisible(61,0)
		endif
		
		if GetObjectInScreen(Ven)=1
			SetSpriteVisible(62,1)
		else
			SetSpriteVisible(62,0)
		endif
		
		if GetObjectInScreen(Ear)=1
			SetSpriteVisible(63,1)
		else
			SetSpriteVisible(63,0)
		endif
		
		if GetObjectInScreen(Mar)=1
			SetSpriteVisible(64,1)
		else
			SetSpriteVisible(64,0)
		endif
		
		if GetObjectInScreen(Jup)=1
			SetSpriteVisible(65,1)
		else
			SetSpriteVisible(65,0)
		endif
		
		if GetObjectInScreen(Sat)=1
			SetSpriteVisible(66,1)
		else
			SetSpriteVisible(66,0)
		endif
		
		if GetObjectInScreen(Ura)=1
			SetSpriteVisible(67,1)
		else
			SetSpriteVisible(67,0)
		endif
		
		if GetObjectInScreen(Nep)=1
			SetSpriteVisible(68,1)
		else
			SetSpriteVisible(68,0)
		endif
	else
		NameFlag=Off
		SetVirtualButtonImageUp(2,ButtonOff)
		For yy = 61 to 68
			SetSpriteVisible(yy,0)
		next yy
		LineFlag=Off
	endif			

	`LINES LineFlag-Draw a line from the sun to each planet
	if LineFlag=On
		SetVirtualButtonImageUp(3,ButtonOn)
				
		if GetObjectinScreen(Sun) and GetObjectinScreen(Mer) then drawline(getspritex(61)+20,getspritey(61)+20,screen_MerX#,screen_MerY#,50,155,55)
		if GetObjectinScreen(Sun) and GetObjectinScreen(Ven) then drawline(getspritex(62)+20,getspritey(62)+20,screen_VenX#,screen_VenY#,50,155,55)
		if GetObjectinScreen(Sun) and GetObjectinScreen(Ear) then drawline(getspritex(63)+20,getspritey(63)+20,screen_EarX#,screen_EarY#,50,155,55)
		if GetObjectinScreen(Sun) and GetObjectinScreen(Mar) then drawline(getspritex(64)+20,getspritey(64)+20,screen_MarX#,screen_MarY#,50,155,55)
		if GetObjectinScreen(Sun) and GetObjectinScreen(Jup) then drawline(getspritex(65)+20,getspritey(65)+20,screen_JupX#,screen_JupY#,50,155,55)
		if GetObjectinScreen(Sun) and GetObjectinScreen(Sat) then drawline(getspritex(66)+20,getspritey(66)+20,screen_SatX#,screen_SatY#,50,155,55)
		if GetObjectinScreen(Sun) and GetObjectinScreen(Ura) then drawline(getspritex(67)+20,getspritey(67)+20,screen_UraX#,screen_UraY#,50,155,55)
		if GetObjectinScreen(Sun) and GetObjectinScreen(Nep) then drawline(getspritex(68)+20,getspritey(68)+20,screen_NepX#,screen_NepY#,50,155,55)
	else
		LineFlag=Off
		SetVirtualButtonImageUp(3,ButtonOff)
	endif		

	`GRID GridFlag-Print the sky grid
	if GridFlag=On
		SetVirtualButtonImageUp(4,ButtonOn)
		SetObjectVisible(300,1)
	else		
		GridFlag=Off
		SetVirtualButtonImageUp(4,ButtonOff)
		SetObjectVisible(300,0)
	endif

	`MUSIC MusicFlag-Play music
	If MusicFlag=Off
		PauseMusicOGG(1)
 		SetVirtualButtonImageUp(5,ButtonOff)
	else
 		MusicFlag=On
 		ResumeMusicOGG(1)
 		SetVirtualButtonImageUp(5,ButtonOn)
	endif
		
	`PATH PathFlag-Show orbit paths
	if PathFlag=On
		SetVirtualButtonImageUp(6,ButtonOn)
		for objectcount=jupring to jupringmax
			if getobjectexists(objectcount)=1
				SetObjectVisible(objectcount,1)
			endif
		next
		for objectcount=satring to satringmax
			if getobjectexists(objectcount)=1
				SetObjectVisible(objectcount,1)
			endif
		next
		for objectcount=uraring to uraringmax
			if getobjectexists(objectcount)=1
				SetObjectVisible(objectcount,1)
			endif
		next
		for objectcount=nepring to nepringmax
			if getobjectexists(objectcount)=1
				SetObjectVisible(objectcount,1)
			endif
		next
		for objectcount= 201 to 204
			if getobjectexists(objectcount)=1
				SetObjectVisible(objectcount,1)
			endif
		next
			SetObjectVisible(EarthMonths,1)
	else		
		PathFlag=Off
		SetVirtualButtonImageUp(6,ButtonOff)
		for objectcount=jupring to jupringmax
			if getobjectexists(objectcount)=1
				SetObjectVisible(objectcount,0)
			endif
		next
		for objectcount=satring to satringmax
			if getobjectexists(objectcount)=1
				SetObjectVisible(objectcount,0)
			endif
		next
		for objectcount=uraring to uraringmax
			if getobjectexists(objectcount)=1
				SetObjectVisible(objectcount,0)
			endif
		next
		for objectcount=nepring to nepringmax
			if getobjectexists(objectcount)=1
				SetObjectVisible(objectcount,0)
			endif
		next
		for objectcount= 201 to 208
			if getobjectexists(objectcount)=1
				SetObjectVisible(objectcount,0)
			endif
		next
			SetObjectVisible(EarthMonths,0)
	endif																																																																								
	
	`PLANE PlaneFlag-Show Solar System Plane
	If PlaneFlag=On
 		SetVirtualButtonImageUp(7,ButtonOn)
 		SetObjectVisible(400,1)
	else
 		PlaneFlag=Off
 		SetVirtualButtonImageUp(7,ButtonOff)
		SetObjectVisible(400,0)
	endif
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																
	`AXIS AxisFlag-Show Axis Overlay
	If AxisFlag=On
		SetVirtualButtonImageUp(8,ButtonOn)
 		for icount=2000 to 2005
 			SetObjectVisible(icount,1)
 		next icount	
	else
		AxisFlag=Off
		SetVirtualButtonImageUp(8,ButtonOff)
		for icount=2000 to 2005
			SetObjectVisible(icount,0)
		next icount	
	endif

	`CONSTELLATIONS ConstellationsFlag-Show Constellations Overlay
	If ConstellationsFlag=On
		SetVirtualButtonImageUp(9,ButtonOn)
		SetObjectVisible(Constellations,1)
	else
		ConstellationsFlag=Off
		SetVirtualButtonImageUp(9,ButtonOff)
		SetObjectVisible(Constellations,0)
	endif
EndFunction

