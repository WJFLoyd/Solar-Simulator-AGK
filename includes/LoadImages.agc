`=================================================================================================================
` Project	: SolarSimulator.agc
` File		: LoadImages.agc
` Created	: 01/25/2022
` Updated	: 01/29/2025
` Author	: W. Jean Floyd
`=================================================================================================================

Function LoadImages()
	
	`Folder for the High Resolution Planet Images (From vaious sources on the internet, JPL, NASA, etc)
		Folder$=		"hiresplanets/"  					
	
	`Folder for the low resolution images
	`Folder$=	"loresplanets/"	

	`Load images for each planet,for Earth's Moon, for Earth's Lights, Saturn Rings and the Orbital Plane
		LoadImage	(Sun,Folder$+        	"Sun.jpg")
		LoadImage	(Mer,Folder$+        	"Mer.jpg")
		LoadImage	(Ven,Folder$+        	"Ven.jpg")
	
		ProgressBar(Bn)
	
		LoadImage	(Ear,Folder$+        	"Ear.jpg")
		LoadImage	(Mar,Folder$+        	"Mar.jpg")
		LoadImage	(Jup,Folder$+        	"Jup.jpg")
		LoadImage	(Sat,Folder$+        	"Sat.jpg")
		LoadImage	(Ura,Folder$+        	"Ura.jpg")

		ProgressBar(Bn)
			
		LoadImage	(Nep,Folder$+        	"Nep.jpg")
		LoadImage	(EarthMoon,Folder$+  	"EarthMoon.jpg")
		LoadImage	(EarthLights,Folder$+	"EarthLights2.jpg")
		LoadImage	(SaturnRings,Folder$+	"SaturnRings.png")
		LoadImage	(Plane,			 		"Grid.png")
			
		ProgressBar(Bn)
	
		SetImageWrapU(Plane,1)
		SetImageWrapV(Plane,1)
		LoadImage	(MarNormal,Folder$+	"MarNormal.png") `Normal Map for Mars
		
	`Special image for the glow around the sun
		LoadImage	(SunFlare,Folder$+		"SunFlare.png")
	
	`Image for Earth's months orbital path
		LoadImage	(EarthMonths,Folder$+	"EarthMonths.png")	
				
	`Load the Sky image witn Constellations
		LoadImage	(Sky,Folder$+				"SkyMapDark.png")
		
		ProgressBar(Bn)
		
		LoadImage	(Constellations,Folder$+	"Constellations.png")	
		
EndFunction
