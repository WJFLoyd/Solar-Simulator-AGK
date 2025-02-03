`=================================================================================================================
` Project	: SolarSimulator.agc
` File		: main.agc
` Created	: 01/25/2022
` Updated	: 01/29/2025
` Author	: W. Jean Floyd
`=================================================================================================================

`Sources
`https://thecynster.home.blog/2019/11/08/calculating-the-julian-date-and-j2000/

`This will use the default rendering system which will first try to use Vulkan 
`and if that's not possible on the hardware it will fall back to OpenGL
	#renderer 	"Prefer Best"

`All of the Include Files are saved in LoadIncludes.agc
	#include 		"Includes/LoadIncludes.agc"

`Setup the Display Parameters (errormode, display, resolution, sync rate, and main font style)
	SetupDisplay()		
					
`Include Files
	LoadIncludes()							`Set the include files

`Load the Splash Screen Image and Make it A Sprite and Update the Progress Bar
	SplashScreen=LoadImage("SplashScreen.jpg")
	SplashScreen=CreateSprite(SplashScreen)
	SetSpritePosition(SplashScreen,0,0)
	SetSpriteDepth(SplashScreen,0)

`Make a Sprite to be Used for the Progress Bar While the Program Loads
	ProgressBar=LoadImage("ProgressBar.png")
	ProgressBar=CreateSprite(ProgressBar)
	SetSpritePosition		(ProgressBar,1330,1157)							
	SetSpriteScale			(ProgressBar,Bn,.5)
	SetSpriteDepth			(ProgressBar,0)
	sync()

`Startup Parameters
	DiaS#	= 15000000 							`Planet Diameter Scale
	DisS#	= 3									`Planet Distance from Sun Scale
	
	`Set Epoch Date	
	Year	= 2000
	Month	= 1
	Day		= 1
	Hour	= 12
	minute	= 0
	Hour	= Hour+minute/60
	dele#	= FNday(Year,Month,Day,Hour)	`Date of the Elements set as Epoch Date
	
	`Set Current Date
	Year	= val(left(CurrentDate$,4))
	Month	= val(left(right(CurrentDate$,5),2))
	Day		= val(right(CurrentDate$,2))
	Hour	= 12
	Minute	= 0
	Hour	= Hour+minute/60
	dpos#	= FNday(Year,Month,Day,Hour)	`Set Start Date for Start Positions
		
	StartYear#	=Year
	StartMonth#	=Month
	StartDay#		=Day
	
	d#    = dpos#-dele#						`Days since Epoch
	dstart#= d#									`Save the Start Information for Days Since Epoch
	
	
`Load Planet Elements (LoadElements.agc) and Update the Progress Bar
	LoadElements(d#):ProgressBar(Bn)

`Load All Images and Update the Progress Bar
	LoadImages():ProgressBar(Bn)

`Load Sounds and Update the Progress Bar	
	LoadSounds():ProgressBar(Bn)

`Setup the Camera and Update the Progress Bar	
	SetUpCamera():ProgressBar(Bn)

`Load Objects [planets, orbit objects, sun, moon, etc] and Update the Progress Bar	
	LoadObjects():ProgressBar(Bn)

`Make Orbital Paths for Planets
	MakeOrbitPaths()							`Generate Accurate Orbit Paths Using Planes
	d#=dstart#									`Reset to Original Start Date After Making the Orbit Paths

`Load the Sprites
	LoadSprites()								`Need to do this just before the Loop to avoid interfernce with the splashscreen
	
`Create the Text	
	CreateAllText()								

`Start the Program so When the SplashScreen Fades the Start Up Conditions will be Visible
	MoveCamera	() 								`Move the camera via key presses (WASD) and the mouse
	MovePlanets	()								`Move the planets to their final position in each frame
		
`Fade the Splash Screen and Progress Bar
	For AlphaCount = 255 to 0 step -1
		SetSpriteColorAlpha(SplashScreen,AlphaCount)
		SetSpriteColorAlpha(ProgressBar,AlphaCount)
		sync()
	next AlphaCount

`Delete the Splash Screen and Progress Bar	
	deletesprite(SplashScreen):deletesprite(800)

`Initialize the Button Start Positions
	DataFlag=		Off	
	NameFlag=		On			
	LineFlag=		Off
	GridFlag=		Off
	MusicFlag=	Off		
	PathFlag=		On				
	PlaneFlag=	Off
	AxisFlag=		Off
	ViewModeFlag=Off					

`-------------------------------------------------------------------------------------------------
` MAIN LOOP START
`-------------------------------------------------------------------------------------------------
	do
		GetInput		()		`Get inputs (key presses and mouse inputs) from the user
  	 	MoveCamera	()		`Move the camera via key presses (WASD) and the mouse
 		MovePlanets	()		`Move the planets to their final position in each frame
 		PrintData		()		`Print some data to the screen and modify visible items
		`gpup_update	()		`Update the emitters used with "AGK Studio Particle Editor"
		Sync			()		`Redraw the screen
	loop
`-------------------------------------------------------------------------------------------------
` MAIN LOOP END
`-------------------------------------------------------------------------------------------------



