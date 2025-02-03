`=================================================================================================================
` Project	: SolarSimulator.agc
` File		: GetInput.agc
` Created	: 11/26/2024
` Updated	: 01/01/2025
` Author	: W. Jean Floyd
`=================================================================================================================

Function GetInput()
	`-------------------------------------------------------------------------------------------------
	` VIRTUAL BUTTON PRESSES TO ACTIVATE FLAGS  
	`-------------------------------------------------------------------------------------------------

	`1 DATA Virtual button 1 click or press the P to See the Data HUD (Left Side of Screen)
	if GetRawKeyPressed (KEY_P)=1 or GetVirtualButtonPressed(1) =1
		PlaySound(PrintSound,50)
		if DataFlag=On
			DataFlag=Off
		else
			DataFlag=On
		endif
	endif
	
	`2 NAME Virtual Button 2 Click for the Planet Icons on the Left Side of the Screen (Names)
	if GetVirtualButtonPressed(2) =1
		PlaySound(PrintSound,50)
		If NameFlag=On
			NameFlag=Off
		else
			NameFlag=On
		endif
	endif	
	
	`3 LINE Virtual Button 3 Click for the Lines Between the Planets and the Left Side Planet Icons
	if GetVirtualButtonPressed(3) =1
		PlaySound(PrintSound,25)
		if LineFlag=On
			LineFlag=Off
		else
			LineFlag=On
		endif
		If LineFlag=On then NameFlag=On //Can't Have Lines Without the Names Visible
	endif	

	`4 GRID Virtual Button 4 Click for the World Grid Line on the Skybox
	if GetVirtualButtonPressed(4) =1
		PlaySound(PrintSound,25)
		if GridFlag=On
			GridFlag=Off
		else
			GridFlag=On
		endif
	endif				
										
	`5 MUSIC Virtual Button 5 Click to Activate the Music								
	if GetVirtualButtonPressed(5)=1
   		PlaySound(PrintSound,25)
		if MusicFlag=On
			MusicFlag=Off
		else
			MusicFlag=On
		endif	
	endif
	
	`6 PATH Virtual Button 6 Click to Make the Planet Paths Visible or Not Visible									
	if GetVirtualButtonPressed(6)=1
   		PlaySound(PrintSound,25)
		if PathFlag=On
			PathFlag=Off
		else
			PathFlag=On
		endif	
	endif	
	
	`7 PLANE Virtual Button 7 Click to Show the Solar System Equatorial Plane									
	if GetVirtualButtonPressed(7)=1
   		PlaySound(PrintSound,25)
		if PlaneFlag=On
			PlaneFlag=Off
		else
			PlaneFlag=On
		endif	
	endif				

	`8 AXIS Virtual Button 8 Click to Show the XYZ Coordinate System									
	if GetVirtualButtonPressed(8)=1
   		PlaySound(PrintSound,25)
		if AxisFlag=On
			AxisFlag=Off
		else
			AxisFlag=On
		endif	
	endif				

	`9 CONS Virtual Button 9 Click to Display a Constellation Map
	if GetVirtualButtonPressed(9)=1
   		PlaySound(PrintSound,25)
		if ConstellationsFlag=On
			ConstellationsFlag=Off
		else
			ConstellationsFlag=On
		endif	
	endif		

	`10 SPIN Virtual Button 10 to Spin the Planets Accurately (Spin Rate, Not Accurate Rotation Position, ie. Hour)
	if GetVirtualButtonPressed(10)=1
		PlaySound(PrintSound,25)
		if RotationFlag=On
			RotationFlag=Off
		else
			RotationFlag=On	
		endif	
	endif	

	`11 SPARE Virtual Button 11 Click to Exit the Simulation and Program
	if GetVirtualButtonPressed(11)=1
		PlaySound(PrintSound,25)
	endif	

	`12 SPARE Virtual Button 12 Click to Exit the Simulation and Program
	if GetVirtualButtonPressed(12)=1
		PlaySound(PrintSound,25)
	endif	

	`13 SPARE Virtual Button 13 Click to Exit the Simulation and Program
	if GetVirtualButtonPressed(13)=1
		PlaySound(PrintSound,25)
	endif	

	`14 SPARE Virtual Button 14 Click to Exit the Simulation and Program
	if GetVirtualButtonPressed(14)=1
		PlaySound(PrintSound,25)
	endif	

	`15 EXIT Virtual Button 15 Click to Exit the Simulation and Program
	if GetVirtualButtonPressed(15)=1
		PlaySound(PrintSound,75)
		Sync()		//Sync() to Show the Button Moved to the Off Position
		Sleep(300) 	//Wait 300 msec Before Exiting
		end
	endif	

	`-------------------------------------------------------------------------------------------------
	` KEYBOARD AND MOUSE BUTTON INPUTS
	`-------------------------------------------------------------------------------------------------
	`AXIS If User Clicks on the XYZ Boxes at the Bottom of the Screen
	if GetRawMouseLeftPressed()
 	 	if GetRawMousex()<3440 and GetRawMouseX()> 3398  
 			If GetRawMouseY()<1389 and GetRawMouseY()>1313
 				PlaySound(PrintSound,25)
  				if AxisFlag=On
					AxisFlag=Off
				else
					AxisFlag=On
				endif	
  			endif
  		endif	
  	endif	

	`+ Key Increases Speed of Simulation			
	if GetRawKeyPressed(KEY_Plus) 							//+ Key
   		PlaySound(PrintSound,25)
  		//initialspeed#=initialspeed#+.04166667				//5 Days per Second at 120 FPS
  		initialspeed#=initialspeed#+.008333334 				//1 Day per Second at 120 FPS
  	endif

	`- Key Decreases Speed of Simulation			  	 	
  	if GetRawKeyPressed(KEY_Minus) 							//- Key
  		PlaySound(PrintSound,25)
  		//initialspeed#=initialspeed#-.04166667
  		initialspeed#=initialspeed#-.008333334
  	endif	

	`Increases Speed of Simulation if User Clicks on the "+" or "++" Symbol			 	
 	if GetRawMouseLeftPressed()=1
 		if GetRawMousex()<3423 and GetRawMouseX()> 3398 
 			If GetRawMouseY()<1078 and GetRawMouseY()>1052
 				PlaySound(PrintSound,25)
  				//initialspeed#=initialspeed#+.04166667		//5 Days per Second at 120 FPS
  				initialspeed#=initialspeed#+.008333334		//1 Day per Second at 120 FPS
  			endif
  			If GetRawMouseY()<1099 and GetRawMouseY()>1078
 				PlaySound(PrintSound,25)
  				//initialspeed#=initialspeed#+(5*.04166667)	//5 Days per Second at 120 FPS
  				initialspeed#=initialspeed#+(5*.008333334)	//1 Day per Second at 120 FPS
  			endif
  		endif	
  	endif	

	`Decreases Speed of Simulation if User Clicks on the "-" or "--" Symbol			 	
  	if GetRawMouseLeftPressed()
  		if GetRawMousex()<3344 and GetRawMouseX()> 3320 
 			If GetRawMouseY()<1078 and GetRawMouseY()>1052
 				PlaySound(PrintSound,25)
  				//initialspeed#=initialspeed#-.04166667		//5 Days per Second at 120 FPS
  				initialspeed#=initialspeed#-.008333334		//1 Day per Second at 120 FPS
  			endif
  			If GetRawMouseY()<1099 and GetRawMouseY()>1078
 				PlaySound(PrintSound,25)
  				//initialspeed#=initialspeed#-(5*.04166667)	//5 Days per Second at 120 FPS
  				initialspeed#=initialspeed#-(5*.008333334)	//1 Day per Second at 120 FPS
  			endif
  		endif	
  	endif

	`Click the Display of the Speed to Reset it to 0 Days, Stops the Simulation
 	if GetRawMouseLeftPressed()=1
 		if GetRawMousex()<3390 and GetRawMouseX()> 3346 
 			If GetRawMouseY()<1090 and GetRawMouseY()>1055
 				PlaySound(PrintSound,25)
  				initialspeed#=0
  			endif
  		endif	
  	endif	
  	 		 	  	 		 	
	`Press "T" for top view
	if GetRawKeyPressed(KEY_T)						//T Key
  		SetCameraPosition	(1,0,20,0)
  		CameraAngleX#=		0
		CameraAngleY#=		0
      	CameraAngleNewX#=	90
      	CameraAngleNewY#=	90
      	PointerDragX#=		-10
  		PointerDragY#=		90  
    	endif
	
	`Press "H" for side view
	if GetRawKeyPressed(KEY_H)						//H Key
  		SetCameraPosition	(1,15,0,0)
  		CameraAngleX#=		0
		CameraAngleY#=		0
      	CameraAngleNewX#=	0
      	CameraAngleNewY#=	0
      	PointerDragX#=		-90
  		PointerDragY#=		0
    	endif

	`Press "R" to reset d# to dstart#
	if GetRawKeyPressed(KEY_R)						//R Key
  		d#=dstart#
    	endif

	`Skip Forward a Year by Clicking on the Plus Sprite  
 	if GetVirtualButtonPressed(21)=1
   		PlaySound(PrintSound,50)
		d#=d#+365.25
	endif	
	
 	`Skip Backward a Year by Clicking on the Minus Sprite  
 	if GetVirtualButtonPressed(22)=1
   		PlaySound(PrintSound,50)
		d#=d#-365.25
	endif	
 
 	`Skip Forward a Month by Clicking on the Plus Sprite  
	if GetVirtualButtonPressed(23)=1
   		PlaySound(PrintSound,50)
		d#=d#+30.009
	endif	
 
 	`Skip Backward a Month by Clicking on the Minus Sprite  
 	if GetVirtualButtonPressed(24)=1
   		PlaySound(PrintSound,50)
		d#=d#-30.009
	endif	 
 
 	`Skip Forward a Day by Clicking on the Plus Sprite  
 	if GetVirtualButtonPressed(25)=1
   		PlaySound(PrintSound,50)
		d#=d#+1
	endif	
 
 	`Skip Backward a Day by Clicking on the Minus Sprite  
 	if GetVirtualButtonPressed(26)=1
   		PlaySound(PrintSound,50)
		d#=d#-1
	endif	 
EndFunction	