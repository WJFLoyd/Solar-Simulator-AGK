`=================================================================================================================
` Project	: SolarSimulator.agc
` File		: LoadIncludes.agc
` Created	: 01/25/2022
` Updated	: 12/26/2024
` Author	: W. Jean Floyd
`=================================================================================================================

Function LoadIncludes()
		#include "Includes/Declarations.agc"
		#include "Includes/CreateAllText.agc"
		#include "Includes/Functions.agc"
		#include "Includes/GetInput.agc"
		`#include "Includes/inc_gpup.agc" `If you purchase the particle emitter, add the file to your includes folder and "uncomment" the associated code throughout
		#include "Includes/LoadElements.agc"
		#include "Includes/LoadImages.agc"
		#include "Includes/LoadObjects.agc"
		#include "Includes/LoadSounds.agc"
		#include "Includes/LoadSprites.agc"
		#include "Includes/MoveCamera.agc" 
		#include "Includes/MovePlanets.agc"
		#include "Includes/PrintData.agc"
		#include "Includes/SetupCamera.agc"
		#include "Includes/SetupDisplay.agc"
EndFunction
