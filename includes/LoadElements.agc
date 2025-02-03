`=================================================================================================================
` Project	: SolarSimulator.agc
` File		: LoadElements.agc
` Created	: 10/24/2023
` Updated	: 01/29/2025
` Author	: W. Jean Floyd
`=================================================================================================================

Function LoadElements(d#)

	Remstart Description of Orbital Parameters
	
	Planet.name=						Full Name
	Planet.sname=					Short Name
   Planet.incli=			(i)		inclination 
   Planet.l_of_anode=		(o)		longitude of ascending node
   Planet.l_of_peri=		(p)		longitude of perihelion
   Planet.dist=				(au)	mean distance
   Planet.daily_motion=	(n)		daily motion along orbit (deg/day)
   Planet.ecc=				(e)		eccentricity
   Planet.mean_long=		(l)		mean longitude
   Planet.mean_anom=		(m)		mean anomaly
   Planet.mass=				(mass)Mass (kg)
   Planet.radius=			(r)		Radius (meters)
   Planet.spin=						Planet spin rate (deg/day)
   Planet.tilt=						Planet tilt angle (deg)
	
	EPOCH								January 1 2000
	
	Remend 
	
	CommonMultiplier=initialspeed#*360
		
	`MERCURY
	Mercury.name=					"Mercury"
	Mercury.sname=					"Mer"
   Mercury.incli=					007.004986
   Mercury.l_of_anode=			048.330893
   Mercury.l_of_peri=				077.456119
   Mercury.dist=					000.3870978
   Mercury.daily_motion=			004.092353
   Mercury.ecc=						000.2056324
   Mercury.mean_long=				252.250906
   Mercury.mean_anom=				Mercury.daily_motion * d# + Mercury.mean_long - Mercury.l_of_peri
   Mercury.mass=					003.30200E23
   Mercury.radius=					002.44E6
   Mercury.spin=					CommonMultiplier*-.017050  `24/(58.65*24)
   Mercury.tilt=					007.0
 	
 	`VENUS
	Venus.name=						"Venus"
   Venus.sname=						"Ven"
   Venus.incli=						003.394662
   Venus.l_of_anode=				075.67992
   Venus.l_of_peri=				131.563703
   Venus.dist=						000.7233300
   Venus.daily_motion=			001.602158
   Venus.ecc=						000.006772
   Venus.mean_long=				181.979501
	Venus.mean_anom=				Venus.daily_motion * d# + Venus.mean_long - Venus.l_of_peri
   Venus.mass=						004.8685E24
   Venus.radius=					006.0518E6
   Venus.spin=						CommonMultiplier*.004115  `24/(243*24)
   Venus.tilt=						177.0
           
  	ProgressBar(Bn)
	
	`EARTH
	Earth.name=						"Earth"
   Earth.sname=						"Ear"
   Earth.incli=						000.00041
   Earth.l_of_anode=				349.2
   Earth.l_of_peri=				102.937348
   Earth.dist=						001.000001
   Earth.daily_motion=			000.9855796
   Earth.ecc=						000.016709
   Earth.mean_long=				100.466457
   Earth.mean_anom=				Earth.daily_motion * d# + Earth.mean_long - Earth.l_of_peri
   Earth.mass=						005.97219E24
   Earth.radius=					006.37101E6
   Earth.spin=						CommonMultiplier*-1.002758  `24/23.934
   Earth.tilt=						023.0
		
	`MARS
	Mars.name=						"Mars"
   Mars.sname=						"Mar"
   Mars.incli=						001.849726
   Mars.l_of_anode=				049.558093
   Mars.l_of_peri=					336.060234
   Mars.dist=						001.523679
   Mars.daily_motion=				000.5240613
   Mars.ecc=							000.093401
   Mars.mean_long=					355.433000
   Mars.mean_anom=					Mars.daily_motion * d# + Mars.mean_long - Mars.l_of_peri
   Mars.mass=						006.4185E23
   Mars.radius=						003.3899E6
   Mars.spin=						CommonMultiplier*-.974698  `24/24.623
   Mars.tilt=						025.0
	
	`JUPITER
	Jupiter.name=					"Jupiter"
   Jupiter.sname=					"Jup"
   Jupiter.incli=					001.303267
   Jupiter.l_of_anode=			100.464407
   Jupiter.l_of_peri=				014.331207
   Jupiter.dist=					005.202603
   Jupiter.daily_motion=			000.08309618
   Jupiter.ecc=						000.048498
   Jupiter.mean_long=				034.351519
   Jupiter.mean_anom=				Jupiter.daily_motion * d# + Jupiter.mean_long - Jupiter.l_of_peri
   Jupiter.mass=					001.89813E27
   Jupiter.radius=					006.9911E7
   Jupiter.spin=					CommonMultiplier*-2.438529  `24/9.842
   Jupiter.tilt=					003.0
	
	ProgressBar(Bn)
				
	`SATURN
 	Saturn.name=						"Saturn"
   Saturn.sname=					"Sat"
   Saturn.incli=					002.488879
   Saturn.l_of_anode=				113.665503
   Saturn.l_of_peri=				093.057237
   Saturn.dist=						009.554909
   Saturn.daily_motion=			000.03328656
   Saturn.ecc=						000.055548
   Saturn.mean_long=				050.077444
   Saturn.mean_anom=				Saturn.daily_motion * d# + Saturn.mean_long - Saturn.l_of_peri
   Saturn.mass=						005.68319E26
   Saturn.radius=					005.8232E7
   Saturn.spin=						CommonMultiplier*-2.345353  `24/10.233
   Saturn.tilt=						026.7
	
 	`URANUS
 	Uranus.name=						"Uranus"
   Uranus.sname=					"Ura"
   Uranus.incli=					000.773197
   Uranus.l_of_anode=				074.005957
   Uranus.l_of_peri=				173.005291
   Uranus.dist=						019.218446
   Uranus.daily_motion=			000.01162295
   Uranus.ecc=						000.046381
   Uranus.mean_long=				314.055005
   Uranus.mean_anom=				Uranus.daily_motion * d# + Uranus.mean_long - Uranus.l_of_peri
   Uranus.mass=						008.68103E25
   Uranus.radius=					002.5362E7
   Uranus.spin=						CommonMultiplier*.857143  `24/28
   Uranus.tilt=						098.0
		
	`NEPTUNE
 	Neptune.name=					"Neptune"
   Neptune.sname=					"Nep"
   Neptune.incli=					001.769953
   Neptune.l_of_anode=			131.784057
   Neptune.l_of_peri=				048.120276
   Neptune.dist=					030.110387
   Neptune.daily_motion=			000.005919282
   Neptune.ecc=						000.009456
   Neptune.mean_long=				304.348665
   Neptune.mean_anom=				Neptune.daily_motion * d# + Neptune.mean_long - Neptune.l_of_peri
   Neptune.mass=					001.0241E26
   Neptune.radius=					002.4624E7
   Neptune.spin=					CommonMultiplier*-1.043478  `24/20
   Neptune.tilt=					030.0
	
EndFunction




