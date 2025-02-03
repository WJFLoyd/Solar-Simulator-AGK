`=================================================================================================================
` Project	: SolarSimulator.agc
` File		: Declarations.agc
` Created	: 01/25/2022
` Updated	: 01/31/2025
` Author	: W. Jean Floyd
`=================================================================================================================

#Constant Pi#	03.14159265
#Constant tPi#	06.28318531
#Constant degs#	00.01745329  
#Constant rads#	57.29577951
#Constant CurrentDate$ GetCurrentDate()

Global Winx=		3440
Global Winy=		1440

`Types for Planet Data
Type Planet
	name 			as string
	sname 			as string
	incli 			as float
	l_of_anode 	as float
	l_of_peri 	as float
	dist 			as float
	daily_motion	as float
	ecc 			as float
	mean_long 	as float
	mean_anom 	as float
	mass 			as float
	radius 		as float
	spin 			as float
	tilt 			as float
endtype	

Global Mercury 	as Planet
Global Venus 	as Planet
Global Earth 	as Planet
Global Mars 		as Planet
Global Jupiter 	as Planet
Global Saturn 	as Planet
Global Uranus 	as Planet
Global Neptune 	as Planet

`Object IDs
Global Sun = 			1
Global Mer = 			2
Global Ven = 			3
Global Ear = 			4
Global Mar = 			5
Global Jup = 			6
Global Sat = 			7
Global Ura = 			8
Global Nep = 			9

Global Sky = 			11
Global SunFlare=		14
Global EarthMoon = 	15
Global Constellations=16
Global Plane=			30
Global EarthLights=	12
Global SaturnRings=	92
Global EarthMonths=	93

Global MarNormal=		95
Global EarNormal=		96
Global MoonNormal=		97

Global MercuryOrbit=	201
Global VenusOrbit=		202
Global EarthOrbit=		203
Global MarsOrbit=		204
Global JupiterOrbit=	205
Global SaturnOrbit=	206
Global UranusOrbit=	207
Global NeptuneOrbit=	208

Global AxisXP=			2000 	`The Plus X AXIS
Global AxisXM=			2001 	`The Minus X AXIS
Global AxisYP=			2002 	`The Plus Y AXIS
Global AxisYM=			2003 	`The Minus Y AXIS
Global AxisZP=			2004	`The Plus Z AXIS
Global AxisZM=			2005	`The Minus Z AXIS

`Effects and Emitters (You will Need the "inc_gpup.agc" include file for the AppGameKit - Particle Editor Runtime Plugin,(c) Gabor Denes 2019.) 
Global EffectOne 		as integer
Global EffectTwo 		as integer

`Time and Date
Global Days# 			as float
Global DaysElapsed# 	as float
Global JD# 				as float
Global J2000# 			as float
Global d# 				as float
Global dstart#			as float
Global Since_J2000# 	as float
Global Days_Since_J2000# as float
Global StartYear		as float
Global StartMonth		as float
Global StartDay			as float

Global initialspeed#=0.008333334 `1/12 hours is 1 day per second at 120 fps
Global CommonMultiplier as float

Global Year#				as float
Global dele#				as float
Global dpos#				as float
Global CurrentMonth	as float
Global CurrentYear 	as float
Global CurrentDay 		as float
Global SimMonth#		as float
Global SimYear# 		as float
Global SimDay# 			as float
Global DayfromJD		as integer
Global MonthfromJD		as integer
Global YearfromJD		as integer

Global DiaS# 			as float
Global DisS# 			as float

`Used in MovePlanets.agc
Global Marvop# 		as float
Global Earvop# 		as float
Global XVen# 		as float
Global YVen# 		as float
Global ZVen# 		as float
Global XMer# 		as float
Global YMer# 		as float
Global ZMer# 		as float
Global XEarth# 		as float
Global YEarth# 		as float
Global ZEarth# 		as float
Global XMar# 		as float
Global YMar# 		as float
Global ZMar# 		as float
Global XJup# 		as float
Global YJup# 		as float
Global ZJup# 		as float
Global XSat# 		as float
Global YSat# 		as float
Global ZSat# 		as float
Global XUra# 		as float
Global YUra# 		as float
Global ZUra# 		as float
Global XNep# 		as float
Global YNep# 		as float
Global ZNep# 		as float

`Screen x/y Locations
Global screen_SunX# as float
Global screen_SunY# as float
Global screen_EarthMoonX# as float
Global screen_EarthMoonY# as float
Global screen_MerX# as float
Global screen_MerY# as float
Global screen_VenX# as float
Global screen_VenY# as float
Global screen_EarX# as float
Global screen_EarY# as float
Global screen_MarX# as float
Global screen_MarY# as float
Global screen_JupX# as float
Global screen_JupY# as float
Global screen_SatX# as float
Global screen_SatY# as float
Global screen_UraX# as float
Global screen_UraY# as float
Global screen_NepX# as float
Global screen_NepY# as float

`Flags
Global Off=0
Global On=1

Global DataFlag
Global NameFlag
Global LineFlag
Global GridFlag
Global MusicFlag
Global PathFlag
Global PlaneFlag
Global AxisFlag
Global ViewModeFlag
Global ConstellationsFlag
Global RotationFlag

`Sounds
Global PrintSound

`Buttons
Global ButtonOn=			70
Global ButtonOff=			71
Global BeginButtonX 		as integer
Global BeginButtonY 		as integer
Global ButtonSpacing		as integer
Global ButtonHeight		as Float
Global HalfButtonHeight as Float

`Raw Key Code
#constant KEY_ESC			27
#constant KEY_PAGEUP		33
#constant KEY_PAGEDOWN	34
#constant KEY_LEFT		37
#constant KEY_UP			38
#constant KEY_RIGHT		39
#constant KEY_DOWN		40
#constant KEY_END			35
#constant KEY_HOME		36
#constant KEY_SHIFT		16
#constant KEY_W			87
#constant KEY_S			83
#constant KEY_A			65
#constant KEY_D			68
#constant KEY_Q			81
#constant KEY_E			69
#constant KEY_Spacebar	32
#constant KEY_P			80
#constant KEY_Plus		107
#constant KEY_Minus		109
#constant KEY_T			84
#constant KEY_H 			72
#constant KEY_R 			82
	
global speed# 			as float

global CameraAngleNewX# 	as float
global CameraAngleNewY# 	as float
global OldCameraAngleNewX# as float
global OldCameraAngleNewY# as float
global PointerX#
global PointerY#
global PointerStartX#
global PointerStartY#
global PointerDragX#
global PointerDragY#
global OldPointerDragX# = 0
global OldPointerDragY# = 0
global CameraAngleX# 
global CameraAngleY#
global OldCameraAngleX# = 0
global OldCameraAngleY# = 0
global OldCameraAngleZ# = 0
global VelocityZ#
global VelocityX#
global VelocityY#
global OldVelocityZ#
global OldVelocityX#
global OldVelocityY#
global Howfar 				as float
global Planet 				as integer
Global LeftHudTopLeftX 	as integer
Global LeftHudTopLeftY 	as integer
	
Global merring =1000
Global merringmax=0

Global venring =2000
Global venringmax=0

Global earring =3000
Global earringmax=0

Global marring =4000
Global marringmax=0

Global jupring=5000
Global jupringmax=5207
Global jupd=2500

Global satring =6000
Global satringmax=6258
Global satd=5010

Global uraring =7000
Global uraringmax=7154
Global urad=23960

Global nepring =8000	
Global nepringmax=8207
Global nepd=35100

Global TopLeftX=1332
Global TopLeftY=1156
Global Spacing=20
Global Bn=0 `Progress Bar Counter
Global ProgressBar

`-------------------------------------------------------------------------------------------------
` Added Globals from AGK Functions List
`-------------------------------------------------------------------------------------------------

global OldMouseX as float : OldMouseX=GetRawMouseX()
global OldMouseY as float : OldMouseY=GetRawMouseX()
global OldMouseZ as float : OldMouseZ=GetRawMouseWheel()
global MouseMoveX as float
global MouseMoveY as float
global MinVec as Vec3Float
global MaxVec as Vec3Float
global MinMaxPos as Vec3Float
global MinMaxSize as Vec3Float
global CameraCurrent as integer : CameraCurrent=-1
global CamerasCount as integer : CamerasCount=-1
global EffectsCount as integer : EffectsCount=-1
global dim Cameras[] as CameraData
global dim Effects[] as EffectData
global dim Vector2Float[268] as Vec2Float
global dim Vector3Float[268] as Vec3Float
global dim Vector4Float[268] as Vec4Float
global dim Matrix4Float[268,4] as Vec4Float
global dim Vector4Integer[32] as Vec4Integer
global dim ShaderEffectDefineStr[] as string
global dim ShaderEffectDefineVal[] as integer
global dim ViewProjectVec[15] as float
global dim ViewProjectFrustumVec[32,5,3] as float
global dim AABBox[7] as Vec3Integer
for b=0 to 7
      AABBox[b].x=1:AABBox[b].y=1:AABBox[b].z=1
next b
   AABBox[1].x=-1:AABBox[2].y=-1:AABBox[3].x=-1:AABBox[3].y=-1
   AABBox[4].z=-1:AABBox[5].x=-1:AABBox[5].z=-1:AABBox[6].y=-1
   AABBox[6].z=-1:AABBox[7].x=-1:AABBox[7].y=-1:AABBox[7].z=-1

`-------------------------------------------------------------------------------------------------
` Added Types from AGK Functions List
`-------------------------------------------------------------------------------------------------

type Vec2Integer
   x as integer
   y as integer
endtype

type Vec2Float
   x as float
   y as float
endtype

type Vec3Integer
   x as integer
   y as integer
   z as integer
endtype

type Vec3Float
   x as float
   y as float
   z as float
endtype

type Vec4Integer
   x as integer
   y as integer
   z as integer
   w as integer
endtype

type Vec4Float
   x as float
   y as float
   z as float
   w as float
endtype

type CameraData
  InUse as integer
  Position as Vec3Float
  Angle as Vec3Float
  Direction as Vec3Float
  Backdrop as Vec3Integer
  Aspect as float
  Range as Vec2Float
  Fov as float
  Ortho as Vec2Float
  View as Vec4Float
  Image as integer
  ImageDepth as integer
  ImageSize as Vec2Float
  Object as integer[]
  ObjectCount as integer
  ObjectFreeUp as integer
  ObjectTotal as integer
  ObjectRestack as integer
  Quad as integer
endtype

type EffectData
  InUse as integer
  ShaderCount as integer
  Technique as integer
  Shader as integer[]
  TechniqueName as string[]
  ObjectCount as integer
  Object as integer[]
  ObjectFreeUp as integer
  ObjectTotal as integer
  ObjectRestack as integer
  MeshCount as integer
  Mesh as integer[]
  MeshObject as integer[]
  MeshFreeUp as integer
  MeshTotal as integer
  MeshRestack as integer
endtype

	