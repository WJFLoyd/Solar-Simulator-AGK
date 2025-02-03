`=================================================================================================================
` Project	: SolarSimulator.agc
` File		: LoadSounds.agc
` Created	: 11/24/2023
` Updated	: 12/12/2024
` Author	: W. Jean Floyd
`=================================================================================================================

Function LoadSounds()
	LoadMusicOGG(1,"Ethereal.ogg")			`Load Music File, Play it and Then Pause it Waiting for User Input
	PlayMusicOGG(1,1)
	PauseMusicOGG(1)
	PrintSound=Loadsound("hit3.wav")		`Load a Button Press Sound File
EndFunction