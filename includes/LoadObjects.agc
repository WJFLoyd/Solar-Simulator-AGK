`=================================================================================================================
`	Project	: SolarSimulator.agc
`	File		: LoadObjects.agc
`	Created	: 01/25/2022
`	Updated	: 12/15/2024
`	Author		: W. Jean Floyd
`=================================================================================================================

Function LoadObjects()
	`Set Number of Rows and Columns in Each Object Sphere	
	rows=		96						
	columns=	96				

	`-------------------------------------------------------------------------------------------------
	`Make 3D-Axis, Planets, Sun, and Moon Objects
	`-------------------------------------------------------------------------------------------------
	`Load 3D-Axis Data for X Y and Z Coordinate Model
	LoadObject		(2000,"AxisX.obj")
	CloneObject		(2001,2000)
	CloneObject		(2002,2000)
	CloneObject		(2003,2000)
	CloneObject		(2004,2000)
	CloneObject		(2005,2000)
	
	for icount=2000 to 2005
		SetObjectScale			(icount,.18,.01,.01)
		SetObjectTransparency(icount,1)
		SetObjectCullMode		(icount,0)                                               
		SetObjectLightMode	(icount,0)
		SetObjectVisible		(icount,0)
	next icount	
		
	SetObjectPosition	(2000,43,0,0)	
	SetObjectPosition	(2001,-45,0,0)	
	SetObjectPosition	(2002,0,43,0)	
	SetObjectPosition	(2003,0,-45,0)	
	SetObjectPosition	(2004,0,0,45)	
	SetObjectPosition	(2005,0,0,-43)	
	
	SetObjectRotation	(2002,0,0,90)
	SetObjectRotation	(2003,0,0,90)
	SetObjectRotation	(2004,0,90,0)
	SetObjectRotation	(2005,0,90,0)
		
	SetObjectColor		(2000,255,0,0,155)
	SetObjectColor		(2001,255,0,0,25)
	SetObjectColor		(2002,0,255,0,155)
	SetObjectColor		(2003,0,255,0,25)
	SetObjectColor		(2004,0,0,255,155)
	SetObjectColor		(2005,0,0,255,25)
	
	`Sun Object
	CreateObjectSphere		(Sun,1.8,rows,columns)		`Sun Sphere to Center Sun Sprite(1.8)
	SetObjectImage			(Sun,Sun,0)
	SetObjectPosition		(Sun,0,0,0)						`Sun Position
	SetObjectLightMode		(Sun,0)							`Set Sun Object Light Mode OFF
																																																	
	`Sun Glow, set to always point at the camera in SetupCamera.agc
	CreateObjectPlane		(SunFlare,3.2,3.0)   
	SetObjectImage			(SunFlare,SunFlare,0)
	SetObjectPosition		(SunFlare,0,0,0)	
	SetObjectTransparency(SunFlare,2)
	SetObjectLightMode		(SunFlare,0)
	
	`Sun Emitter (You Will Need the inc_gpup.agc Resource)
	`gpup_init()
	`EffectOne=gpup_loadEffect		("export/sun_porta_2",0,0,0,.72)
	`gpup_emitterActive				(EffectOne,1)
	`gpup_setParticleScale			(EffectOne,2) 	
	
	`Asteroid Belt Emitter [instead of using hundreds of objects, just used an emitter]
	`EffectTwo=gpup_loadEffect		("export/asteroids",0,0,0,4.7)
	`gpup_emitterActive				(EffectTwo,1)
	`gpup_setParticleScale			(EffectTwo,.3) 
	`gpup_SetBlendmode(EffectTwo,3)
	`gpup_SetBounciness(EffectTwo,0)
	
	`8 Planet Objects and Associated Image Assignements
	CreateObjectSphere(Mer,Mercury.radius/DiaS#,rows,columns)
	SetObjectImage(Mer,Mer,0)
		
	CreateObjectSphere(Ven,Venus.radius/DiaS#,rows,columns)
	SetObjectImage(Ven,Ven,0)
	
	CreateObjectSphere(Ear,Earth.radius/DiaS#,rows,columns)
	SetObjectImage(Ear,Ear,0)
	SetObjectNormalMap(Ear,EarNormal)
	
	CreateObjectSphere(Mar,Mars.radius/DiaS#,rows,columns)
	SetObjectImage(Mar,Mar,0)
	SetObjectNormalMap(Mar,MarNormal)
	
	CreateObjectSphere(Jup,Jupiter.radius/DiaS#,rows,columns)
	SetObjectImage(Jup,Jup,0)
		
	CreateObjectSphere(Sat,Saturn.radius/DiaS#,rows,columns)
	SetObjectImage(Sat,Sat,0)
	
	CreateObjectSphere(Ura,Uranus.radius/DiaS#,rows,columns)
	SetObjectImage(Ura,Ura,0)
	
	CreateObjectSphere(Nep,Neptune.radius/DiaS#,rows,columns)
	SetObjectImage(Nep,Nep,0)

	`Earth Lights	
	CreateObjectSphere	(EarthLights,.425,rows,columns)
	SetObjectImage		(EarthLights,EarthLights,0)
	SetObjectLightMode	(EarthLights,0)
	SetObjectTransparency(EarthLights,2)
	FixObjectToObject	(EarthLights,Ear)
			
	`Earth's Moon [NOT orbiting accurately]													
	CreateObjectSphere	(EarthMoon,Earth.radius*.2725/DiaS#,rows,columns)	
	SetObjectImage		(EarthMoon,EarthMoon,0)					
	SetObjectPosition	(EarthMoon,2/DisS#,0,0)		`Position Moon
	FixObjectToObject	(EarthMoon,Ear)				`Fix the Moon to the Earth

	`-------------------------------------------------------------------------------------------------
	`Planet Tilt Angles
	`-------------------------------------------------------------------------------------------------
	`Mercury Tilt to 7 Degrees
	RotateObjectLocalX	(Mer,Mercury.tilt)
	
	`Venus Tilt to 177 Degrees
	RotateObjectLocalX	(Ven,Venus.tilt)
	
	`Earth Tilt to 23 Degrees
	RotateObjectLocalX	(Ear,Earth.tilt)
	
	`Mars Tilt to 25 Degrees
	RotateObjectLocalX	(Mar,Mars.tilt)	
	
	`Jupiter Tilt to 3 Degrees
	RotateObjectLocalX	(Jup,Jupiter.tilt)
	
	`Saturn Tilt to 26.7 Degree
	RotateObjectLocalX	(Sat,Saturn.tilt)
	
	`Uranus Tilt to 98 Degrees
	RotateObjectLocalX	(Ura,Uranus.tilt)
	
	`Neptune Tilt to 30 Degrees
	RotateObjectLocalX	(Nep,Neptune.tilt)

	`-------------------------------------------------------------------------------------------------
	`Rings of Saturn
	`-------------------------------------------------------------------------------------------------
	`Saturns' Rings (This is NOT the Oribt Ring, This is the Material Orbiting the Planet)
	CreateObjectCylinder		(SaturnRings,.01,10,64)
	SetObjectImage				(SaturnRings,SaturnRings,0)
	SetObjectLightMode			(SaturnRings,1)
	SetObjectTransparency		(SaturnRings,2)
	SetObjectColorEmissive	(SaturnRings,35,35,35)
	SetObjectCullMode			(SaturnRings,0)
	FixObjectToObject			(SaturnRings,Sat)											`Fix Rings to Saturn
	RotateObjectLocalY			(SaturnRings,-.1*CommonMultiplier*(24/10.233))	`Rotate the Saturn Rings

	`-------------------------------------------------------------------------------------------------
	`Make the Sky Map 
	`-------------------------------------------------------------------------------------------------
	`Skymap Sphere
	CreateObjectSphere			(Sky,10000,32,32)						`Low poly skybox
	SetObjectImage 				(Sky,Sky,0)
	SetObjectTransparency		(Sky,2)
	SetObjectCullMode			(Sky,2)
	SetObjectPosition			(Sky,0,0,0)
	SetObjectLightMode			(Sky,0)

	`Constellation Sphere
	CreateObjectSphere			(Constellations,10000,32,32)		`Low poly skybox
	SetObjectImage 				(Constellations, Constellations,0)
	SetObjectTransparency		(Constellations,2)
	SetObjectCullMode			(Constellations,2)
	SetObjectPosition			(Constellations,0,0,0)
	SetObjectLightMode			(Constellations,0)
	
	`Sky Grid
	LoadObject					(300,"SphereGrid.obj")
	SetObjectScale				(300,15,15,15)
	SetObjectPosition			(300,0,0,0)
	SetObjectColorEmissive	(300,25,25,25)
	RotateObjectGlobalX		(300,90)
	SetObjectLightMode			(300,1)
	SetObjectTransparency		(300,2)
	SetObjectCullMode			(300,2)

	`-------------------------------------------------------------------------------------------------
	`Make the Orbital Rings/Orbital Path
	`-------------------------------------------------------------------------------------------------
	`Load the 3D Object that represents a typical orbit path and save it as Mercury's path
	LoadObject(MercuryOrbit,"Orbit.x")			//Mercury Orbital Path
	
	`Clone the 3D Object for each of the other planets using the Mercury path as the original object
	CloneObject		(VenusOrbit,	201)			//Venus Orbital Path
	CloneObject		(EarthOrbit,	201)			//Earth Orbital Path
	CloneObject		(MarsOrbit,		201)			//Mars Orbital Path
	`CloneObject		(JupiterOrbit,	201)			//Jupiter Orbital Path
	`CloneObject		(SaturnOrbit,	201)			//Saturn Orbital Path
	`CloneObject		(UranusOrbit,	201)			//Uranus Orbital Path
	`CloneObject		(NeptuneOrbit,	201)			//Neptune Orbital Path
	
	`EarthMonth Object as a Special Orbital Path for Earth
	LoadObject			(EarthMonths,"EarthMonths.obj")
	SetObjectRotation	(EarthMonths,180,-10,0)
	SetObjectScale		(EarthMonths,.040,.001,.041)
	SetObjectColor		(EarthMonths,255,255,255,155)
	SetObjectTransparency(EarthMonths,1)
	SetObjectCullMode	(EarthMonths,0)                                               
	SetObjectLightMode	(EarthMonths,0)
	
	`Scale, Position, and Rotate MERCURY Orbit Ring
	SetObjectScale		(MercuryOrbit,.00945,.1,.00963)	
	SetObjectPosition	(MercuryOrbit,-.046,-.014,-.236)
	RotateObjectLocalZ	(MercuryOrbit,-4.9)
	RotateObjectLocalX	(MercuryOrbit,-4.9)
	RotateObjectLocalY	(MercuryOrbit,0)
	
	`Scale, Position, and Rotate VENUS Orbit Ring
	SetObjectScale		(VenusOrbit,.0181,.1,.0181)
	SetObjectPosition	(VenusOrbit,.02,0,-.01)
	RotateObjectLocalZ	(VenusOrbit,-3.3)
	RotateObjectLocalX	(VenusOrbit,-.7)
	RotateObjectLocalY	(VenusOrbit,0)
			
	`Scale, Position, and Rotate EARTH Orbit Ring
	SetobjectScale		(EarthOrbit,.025,.1,.025)
		
	`Scale, Position, and Rotate MARS Orbit Ring
	SetobjectScale		(MarsOrbit,.0380,.1,.038)
	SetObjectPosition	(MarsOrbit,-.39,.01,.18)
	RotateObjectLocalZ	(MarsOrbit,-1.2)
	RotateObjectLocalX	(MarsOrbit,-1.2)
	RotateObjectLocalY	(MarsOrbit,0)

	`Set Color, Trans, Cull, and Light Modes for Orbital Path Objects
	For kk= 201 to 204
		SetObjectColor			(kk,255,255,255,55)
		SetObjectTransparency(kk,1)
		SetObjectCullMode		(kk,0)                                               
		SetObjectLightMode	(kk,0)            
	next kk

	`Delete Earth Orbit because we are using EarthMonths on the orbital plane				
	DeleteObject(203) 

	`-------------------------------------------------------------------------------------------------
	`Make the Solar System Equatorial Plane Object and Mesh UV
	`-------------------------------------------------------------------------------------------------
	CreateObjectPlane		(400,200,200)
	SetObjectRotation		(400,90,0,0)
	SetObjectMeshUVScale	(400,1,0,25,25)
	SetObjectColor			(400,255,255,255,100)
	SetObjectImage			(400,Plane,0)
	SetObjectTransparency	(400,1)
	SetObjectCullMode		(400,0)                                               
	SetObjectLightMode		(400,0)
	SetObjectPosition		(400,0,0,0)  
	SetObjectVisible		(400,0)

	`-------------------------------------------------------------------------------------------------
	`Generate Planet Orbits Using Small Planes and the Move Planets Function
	`-------------------------------------------------------------------------------------------------
	remstart
	`Only Making Paths for Jupiter and Beyond.  Inner Planets use a Different 3d Object.  Here is a start for the code if needed.

	`Mercury Orbital Path
	for counter=merring to merring+351
		Createobjectplane	(counter,.0232,.02)						
		SetObjectColor		(counter,150,150,150,55)
		SetObjectTransparency(counter,1)
		SetObjectCullMode	(counter,0)                                               
		SetObjectLightMode(counter,0)  
	next counter

	`Venus Orbital Path		
	for counter=venring to venring+673
		Createobjectplane	(counter,.0232,.02)						
		SetObjectColor		(counter,150,150,150,55)
		SetObjectTransparency(counter,1)
		SetObjectCullMode	(counter,0)                                               
		SetObjectLightMode(counter,0)  
	next counter

	`Earth Orbital Path	(not currently active)	
	for counter=earring to earring+673
		Createobjectplane	(counter,.0232,.0325)						
		SetObjectColor		(counter,150,150,150,100)
		SetObjectTransparency(counter,1)
		SetObjectCullMode	(counter,0)                                               
		SetObjectLightMode(counter,0)  
	next counter

	`Mars Orbital Path		
	for counter=marring to marring+274
		Createobjectplane	(counter,.1,.02)						
		SetObjectColor		(counter,150,150,150,55)
		SetObjectTransparency(counter,1)
		SetObjectCullMode	(counter,0)                                               
		SetObjectLightMode(counter,0)  
	next counter
	remend
	
	ht=.1 `.05

	`Jupiter Orbital Path		
	for counter=jupring to jupringmax
		Createobjectplane	(counter,.45,.1)`.04)						
		SetObjectColor		(counter,142,76,16,55)
		SetObjectTransparency(counter,1)
		SetObjectCullMode	(counter,0)                                               
		SetObjectLightMode(counter,0)  
	next counter
	
	`Saturn Orbital Path		
	for counter=satring to satringmax
		Createobjectplane	(counter,.65,.1)`.04)					
		SetObjectColor		(counter,189,176,144,55)
		SetObjectTransparency(counter,1)
		SetObjectCullMode	(counter,1)                                               
		SetObjectLightMode(counter,0)  
	next counter
	
	`Uranus Orbital Path		
	for counter=uraring to uraringmax
		Createobjectplane	(counter,2.27,.1)`.05)
		SetObjectColor		(counter,169,219,226,55)
		SetObjectTransparency(counter,1)
		SetObjectCullMode	(counter,1)                                               
		SetObjectLightMode(counter,0)  
	next counter
	
	`Neptune Orbital Path		
	for counter=nepring to nepringmax
		Createobjectplane	(counter,2.7,.1)`.05)
		SetObjectColor		(counter,100,109,255,55)
		SetObjectTransparency(counter,1)
		SetObjectCullMode	(counter,1)                                               
		SetObjectLightMode(counter,0)  
	next counter

	remstart
	`Asteroid Belt. Old Code.  New Code Uses and Emitter	
	
	LoadObject			(AsteroidBelt,"AsteroidsX.x")
	SetObjectRotation	(AsteroidBelt,180,0,0)
	SetObjectScale		(AsteroidBelt,.0037,.0037,.0037)
	SetObjectColor		(AsteroidBelt,25,25,25,0)
	SetObjectTransparency(AsteroidBelt,0)
	SetObjectCullMode	(AsteroidBelt,0)
	SetObjectLightMode	(AsteroidBelt,1)
	
	remend
EndFunction

