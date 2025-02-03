`=================================================================================================================
` Project	: SolarSimulator.agc
` File		: SetupDisplay.agc
` Created	: 11/24/2024
` Updated	: 11/24/2024
` Author	: W. Jean Floyd
`=================================================================================================================

Function SetupDisplay()
	`Show all errors
	SetErrorMode(2)	

	`Setup the Display Window and its Properties
	SetWindowTitle			("Solar Simulator")	`Title
	SetWindowSize			(Winx,Winy,1,0)		`Window Size, Winxand Winy are in "Declarations.agc" 
	SetWindowAllowResize	(0) 						`Disable window resizing
	SetVirtualResolution	(Winx,Winy) 			`Establish the virtual resolution (same size as screen)
	SetScissor				(0,0,0,0) 				`Use max screen space, no black borders
	SetGenerateMipmaps		(1)						`Used to Improve the Quality of Rendered Textures When Distance to Camera Changes
	SetResolutionMode		(1)						`Use Full Resolution Frame Buffer
	SetImmersiveMode		(1)						`Allows App to use the Entire Screen

	`Use the default fonts
	UseNewDefaultFonts		(1)
	SetPrintSize				(20)						`Set global size of printed text

	`Set the Sync Rate 	(FPS)
	`SetSyncRate				(0,0)						`Set FPS to Maximum Possible Capabilty of the Graphics Card
	SetVSync					(1)						`Links Frame Rate to the Monitor Refresh Rate, Overrides SetSyncRate() Command
EndFunction	
