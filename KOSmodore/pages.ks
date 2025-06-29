run once "/KOSmodore/logbook.ks".
run once "/KOSmodore/keybT9.ks".
run once "/KOSmodore/interface.ks".
run once "/KOSmodore/datalog.ks".



function MMAIN {
	InitTerminalMAIN(monitors).
	SPage(1).
}


function GoPos {
	SPage(10).	
	cd("KOSmodore").
	cd("positions").
	LIST FILES IN li.
	cd("..").
	cd("..").
	listafile(li).	
}

function GoTrack {
	SPage(11).
	cd("KOSmodore").
	cd("tracks").
	LIST FILES IN li.
	cd("..").
	cd("..").
	listafile(li).
}

// go to ROVER page
function ROVERPAGE {
	SPage(20).
	InitTerminalROVER(monitors).
	
}


//Track page
function TrackPAGE {
	SPage(30).
	InitTerminalGPS(monitors).
	if LoadedTrack:length = 1{
		print "No track set." at(0,0).
	} else {
		print "Track of " + (LoadedTrack:length-1) + " spots set." at(0,0).
	}
}

function ListTracks {
	SPage(31).	
	InitTerminalTrackload(monitors).
	cd("KOSmodore").
	cd("tracks").
	LIST FILES IN li.
	cd("..").
	cd("..").
	listafile(li).
}

function ViewTrack {
	SPageTile(32,"Time          Latitude      Longitude").
	local x to 0.
	local y to 0.
	
	InitTerminalViewTrack(monitors).
	
	FOR S IN LoadedTrack {
		if y>0 {
			FOR SS IN S {
				if x = 0 {
					print round(SS,1) at (0,Y).
				} else {
					print round(SS,7) at (X*14,Y).
				}
				set x to x+1.
			}		
		}
		set y to y+1.
		set x to 0.
	}	
}

// T9 save track pages
function SaveTrack {
	if LoadedTrack:LENGTH < 2 {
		 print "No track set. Can't save." at(0,0).
	}
	else {
		SPage(33).
		resetcicleset().
		InitTermFileSave(monitors).
		Print "Type file name: " at(0,0).	
		print linea + "_" at(0,1).
		setxy(0,1).
	}
}

function SaveTrack1 {
	SPage(34).	
	InitTermFileSave1(monitors).
	Print "Type file name: " at(0,0).	
	print linea + "_" at(0,1).
	setxy(0,1).
}

function SaveTrack2 {
	SPage(35).	
	InitTermFileSave2(monitors).
	Print "Type file name: " at(0,0).	
	print linea + "_" at(0,1).
	setxy(0,1).
}

// LogBookPage
function LogBookPage {
	local cou to 0.
	
	SPage(40).
	InitTermLogBook(monitors).	
	//for lin in LBook[LBook:LENGTH-1] {
	for lin in LBook[CurrentNote] {
		print lin at(0,cou).
		set cou to cou + 1.
	}

	//print lbook.
}

function LogBookPage1 {
	local cou to 0.
	resetcicleset().
	SPage(41).
	InitTermLogBook1(monitors).	
	for lin in LBook[CurrentNote] {
		print lin at(0,cou).
		set cou to cou + 1.
	}
	//setxy(LBook[LBook:LENGTH-1]:LENGTH+1,LBook:LENGTH).
    setxy(0,LBook[CurrentNote]:LENGTH).
	print "_"at(0,LBook[CurrentNote]:LENGTH).
	
	//2 righe magiche che editano l'ultima riga del diario:
	//print "_"at(LBook[LBook:LENGTH-1]:LENGTH+1,LBook:LENGTH).
	//set linea to LBook[LBook:LENGTH-1][LBook[LBook:LENGTH-1]:LENGTH-1].
	
	//	print "("+ linea+")"at (5,5).
	print linea + "_" at(0,cou).
	
}

function LogBookPage2 {
	local cou to 0.
	SPage(42).
	InitTermLogBook2(monitors).
	
	for lin in LBook[CurrentNote] {
		print lin at(0,cou).
		set cou to cou + 1.
	}
	//setxy(LBook[LBook:LENGTH-1]:LENGTH+1,LBook:LENGTH).
    setxy(0,LBook[CurrentNote]:LENGTH).
	print "_"at(0,LBook[CurrentNote]:LENGTH).
	print linea + "_" at(0,cou).
}

function LogBookPage3 {
	local cou to 0.
	SPage(43).
	InitTermLogBook3(monitors).
	//print linea at(1,4).
	for lin in LBook[CurrentNote] {
		print lin at(0,cou).
		set cou to cou + 1.
	}
	//setxy(LBook[LBook:LENGTH-1]:LENGTH+1,LBook:LENGTH).
    setxy(0,LBook[CurrentNote]:LENGTH).
	print "_"at(0,LBook[CurrentNote]:LENGTH).
	print linea + "_" at(0,cou).
}

//Destination
function DestinationsPAGE {
	SPage(50).
	InitTerminalDestination(monitors).
	if GPSPOS:length = 0{
		print "No destination set." at(0,0).
	} else {
		print "Destination set:" at(0,0).
		print round(GPSPOS[0],4) + ", " + round(GPSPOS[1],4) at(0,1).
	}
}
function ListDests {
	SPage(51).	
	InitTerminalDestinationload(monitors).
	cd("KOSmodore").
	cd("positions").
	LIST FILES IN li.
	cd("..").
	cd("..").
	listafile(li).
}

// T9 save destination pages
function SaveDests {
	if GPSPOS:length = 0 {
		 print "No destination set. Can't save." at(0,0).
	}
	else {
		SPage(52).
		resetcicleset().
		InitTermFileSave(monitors).
		Print "Type file name: " at(0,0).	
		print linea + "_" at(0,1).
		setxy(0,1).
	}
}

function SaveDests1 {
	SPage(53).	
	InitTermFileSave1(monitors).
	Print "Type file name: " at(0,0).	
	print linea + "_" at(0,1).
	setxy(0,1).
}

function SaveDests2 {
	SPage(54).	
	InitTermFileSave2(monitors).
	Print "Type file name: " at(0,0).	
	print linea + "_" at(0,1).
	setxy(0,1).
}

function TypeRealNum {                       //type latitude
		parameter page,label, y, cls. 
		if cls {
			SPage(page).
		} else {
			SPageNoClear(page).
		}
		resetcicleset().
		InitTermTypeRealNum(monitors).
		Print label at(0,y).	
		print linea + "_" at(0,y+1).
		setxy(0,y+1).
}


// SAMPLE page
function SamplePAGE {
	SPage(70).
	InitTerminalSampler(monitors).	
	
	if SensLog:Length = 1 { //perché c'è lo header
		print "No data log set." at(0,0).
	} else {	
	
		print "LOG of " + (SensLog:length-1) + " samples set." at(0,0).
	}
	print "SOURCES:" at(0,1).
	ShowAddedDSources(2).
}


function ListSamples {
	SPage(71).	
	InitTerminalSamplingload(monitors).
	cd("KOSmodore").
	cd("sampling").
	LIST FILES IN li.
	cd("..").
	cd("..").
	listafile(li).
}

function ViewDataLogPage {
	//local source to -1.
	
	
	// per capire quali sorgenti ci sono
	
	if SensLog[0]:LENGTH > 1 {
		set selcolumn to 1.
		set maxcolumn to SensLog[0]:LENGTH - 1.
		//set source to SensLog[0][selcolumn].
	}
	
	ViewDataLogSource(selcolumn).
	
	
	InitTerminalViewDataLog(monitors).
}

function proceedtoSourcePage {
	SPage(74).
	print "Changing sources will result in the" at(0,0).
	print "loss of the current data log." at(0,1).
	print "If you need it, save it first." at(0,2).
	print "Do you want to proceed deleting" at(0,3).
	print "the current log?" at(0,4).
	InitTermProceedToSource(monitors).
}

function DataSourcePage {
	SPage(75).
	ClearSensLOG(). //clean the data log.
	InitTermShowDataSources(monitors).
	ShowAddedDSources(0).
}

function AddDataSource {
	SPage(76).	
	InitTermSelectDataSourcesAdd(monitors).
	ListaStr(DSnames(DataSources)).
}

function DelDataSource {
	SPage(77).	
	InitTermSelectDataSourcesSub(monitors).
	ListaStr(DSnames(DataSourcesAdded)).
}

// T9 save data log pages
function SaveDataLog {
	if SensLog:LENGTH < 2 {
		 print "No data log set. Can't save." at(0,0).
	}
	else {
		SPage(83).
		resetcicleset().
		InitTermFileSave(monitors).
		Print "Type file name: " at(0,0).	
		print linea + "_" at(0,1).
		setxy(0,1).
	}
}

function SaveDataLog1 {
	SPage(84).	
	InitTermFileSave1(monitors).
	Print "Type file name: " at(0,0).	
	print linea + "_" at(0,1).
	setxy(0,1).
}

function SaveDataLog2 {
	SPage(85).	
	InitTermFileSave2(monitors).
	Print "Type file name: " at(0,0).	
	print linea + "_" at(0,1).
	setxy(0,1).
}

function SettingsPage {
	SPage(100).	
	InitTermSettings(monitors).
	print "Marker thickness: " + SettingsL[0] at(0,0).
	print "Data log sampling interval (s): " + SettingsL[1] at(0,1).
	print "Track sampling interval (s): " + SettingsL[2] at(0,2).
}


	

// INF. HERE
function InfHerePAGE {
	SPage(999).
	Print "Latitude: " + round(SHIP:GEOPOSITION:LAT,3) + ", Longitude: "
		+ round(SHIP:GEOPOSITION:LNG,3) at (0,3). 
	print "Ground distance: " + round(SHIP:GEOPOSITION:distance,3) at (0,4).
}

