run once "/KOSmodore/logbook.ks".
run once "/KOSmodore/keybT9.ks".
run once "/KOSmodore/interface.ks".
run once "/KOSmodore/datalog.ks".

function GoPage {
	parameter p.
	
	// Main
	if p = 1 {                     
		SPage(1).
		InitTerminalMAIN(monitors).
	}
	
	// Rover
	if p = 20 {
		SPage(20).
		InitTerminalROVER(monitors).
	}
	
	// Tracks
	if p = 30 {
		SPage(30).
		InitTerminalGPS(monitors).
		if LoadedTrack:length = 1{
			print "No track set." at(0,0).
		} else {
			print "Track of " + (LoadedTrack:length-1) + " spots set." at(0,0).
		}
	}
	
	// Select track file
	if p = 31 {
		SPage(31).	
		InitTermFileLoad(monitors).
		cd("KOSmodore").
		cd("tracks").
		LIST FILES IN li.
		cd("..").
		cd("..").
		listafile(li).
	}
	
	// View track
	if p = 32 {
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
	if p = 33 {
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
	
	if p = 34 {
		SPage(34).	
		InitTermFileSave1(monitors).
		Print "Type file name: " at(0,0).	
		print linea + "_" at(0,1).
		setxy(0,1).
	}
	
	if p = 35 {
		SPage(35).	
		InitTermFileSave2(monitors).
		Print "Type file name: " at(0,0).	
		print linea + "_" at(0,1).
		setxy(0,1).
	}
		
	// Logbook
	if p = 40 {
		SPage(40).
		InitTermLogBook(monitors).	
		local cou to 0.
		for lin in LBook[CurrentNote] {
			print lin at(0,cou).
			set cou to cou + 1.
		}
	}
	
	// Logbook write pages
	if p = 41 {
		local cou to 0.
		resetcicleset().
		SPage(41).
		InitTermLogBook1(monitors).	
		for lin in LBook[CurrentNote] {
			print lin at(0,cou).
			set cou to cou + 1.
		}
		setxy(0,LBook[CurrentNote]:LENGTH).
		print "_" at(0,LBook[CurrentNote]:LENGTH).
		//2 righe magiche che editano l'ultima riga del diario:
		//print "_"at(LBook[LBook:LENGTH-1]:LENGTH+1,LBook:LENGTH).
		//set linea to LBook[LBook:LENGTH-1][LBook[LBook:LENGTH-1]:LENGTH-1].
		print linea + "_" at(0,cou).
	}
	
	if p = 42 {
		local cou to 0.
		SPage(42).
		InitTermLogBook2(monitors).
		for lin in LBook[CurrentNote] {
			print lin at(0,cou).
			set cou to cou + 1.
		}
		setxy(0,LBook[CurrentNote]:LENGTH).
		print "_"at(0,LBook[CurrentNote]:LENGTH).
		print linea + "_" at(0,cou).
	}
	
	if p = 43 {
		local cou to 0.
		SPage(43).
		InitTermLogBook3(monitors).
		for lin in LBook[CurrentNote] {
			print lin at(0,cou).
			set cou to cou + 1.
		}
		setxy(0,LBook[CurrentNote]:LENGTH).
		print "_"at(0,LBook[CurrentNote]:LENGTH).
		print linea + "_" at(0,cou).
	}
	
	//Destinations
	if p = 50 {
		SPage(50).
		InitTerminalDestination(monitors).
		if GPSPOS:length = 0{
			print "No destination set." at(0,0).
		} else {
			print "Destination set:" at(0,0).
			print round(GPSPOS[0],4) + ", " + round(GPSPOS[1],4) at(0,1).
		}
	}

	if p = 51 {
		SPage(51).	
		InitTermFileLoad(monitors).
		cd("KOSmodore").
		cd("positions").
		LIST FILES IN li.
		cd("..").
		cd("..").
		listafile(li).
	}		

	// T9 save destination pages
	if p = 52 {
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
	
	if p = 53 {
		SPage(53).	
		InitTermFileSave1(monitors).
		Print "Type file name: " at(0,0).	
		print linea + "_" at(0,1).
		setxy(0,1).
	}
	
	if p = 54 {
		SPage(54).	
		InitTermFileSave2(monitors).
		Print "Type file name: " at(0,0).	
		print linea + "_" at(0,1).
		setxy(0,1).
	}
	
	// Datalog
	if p = 70 {
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
	
    // Select datalog file
	if p = 71 {
		SPage(71).	
		InitTermFileLoad(monitors).
		cd("KOSmodore").
		cd("sampling").
		LIST FILES IN li.
		cd("..").
		cd("..").
		listafile(li).
	}
	
	// Datalog view
	if p = 72 {
		// per capire quali sorgenti ci sono
		if SensLog[0]:LENGTH > 1 {
			set selcolumn to 1.
			set maxcolumn to SensLog[0]:LENGTH - 1.
		}
		ViewDataLogSource(selcolumn).
		InitTerminalViewDataLog(monitors).
	}
	
	// ask before changing source list and clean datalog
	if p = 74 {
		SPage(74).
		print "Changing sources will result in the" at(0,0).
		print "loss of the current data log." at(0,1).
		print "If you need it, save it first." at(0,2).
		print "Do you want to proceed clearing" at(0,3).
		print "the current log?" at(0,4).
		InitTermProceedToSource(monitors).
	}
	
	// Select data source
	if p = 75 {
		SPage(75).
		ClearSensLOG(). //clean the data log.
		InitTermShowDataSources(monitors).
		ShowAddedDSources(0).
	}
	
	// Add data source from list
	if p = 76	{
		SPage(76).	
		InitTermSelectDataSourcesAdd(monitors).
		ListaStr(DSnames(DataSources)).
	}
	
	// Delete data source from list
	if p = 77 {
		SPage(77).	
		InitTermSelectDataSourcesSub(monitors).
		ListaStr(DSnames(DataSourcesAdded)).
	}
	
	// T9 save data log pages
	if p = 83 {
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
	
	if p = 84 {
		SPage(84).	
		InitTermFileSave1(monitors).
		Print "Type file name: " at(0,0).	
		print linea + "_" at(0,1).
		setxy(0,1).
	}
	
	if p = 85 {
		SPage(85).	
		InitTermFileSave2(monitors).
		Print "Type file name: " at(0,0).	
		print linea + "_" at(0,1).
		setxy(0,1).
	}
	
	// Settings
	if p = 100 {
		SPage(100).	
		InitTermSettings(monitors).
		print "Marker thickness: " + SettingsL[0] at(0,0).
		print "Data log sampling interval (s): " + SettingsL[1] at(0,1).
		print "Track sampling interval (s): " + SettingsL[2] at(0,2).
	}
	
	// Programs
	if p = 200 {
		SPage(200).	
		InitTermPrograms(monitors).
	}
	
	// Select program file
	if p = 201 {
		SPage(201).	
		InitTermFileLoad(monitors).
		cd("KOSmodore").
		cd("kerboscript").
		LIST FILES IN li.
		cd("..").
		cd("..").
		listafile(li).
	}
	
	// Running kerboscript program page
	if p = 210 {
		SPageNoCLear(210).	
		ClearTerminal(monitors).
	}
	
	// Ended program page
	if p = 211 {
		SPageNoCLear(211).	
		InitTermEndedProgram(monitors).
	}
	
	// View basic prog
	if p = 220 {
		SPage(220).
		InitTermViewBas(monitors).	
		//set emptyprog to readjson("/KOSmodore/ksp-basic/Empty.bas").
		
		local cou to 0.
		
		for lin in emptyprog {
			print lin at(0,cou).
			set cou to cou + 1.
		}
	}
	
	// Select basic program file
	if p = 221 {
		SPage(221).	
		InitTermFileLoad(monitors).
		cd("KOSmodore").
		cd("ksp-basic").
		LIST FILES IN li.
		cd("..").
		cd("..").
		listafile(li).
	}
	


// View preprocessed basic prog

	if p = 222 {
		SPage(222).
		InitTermViewBas(monitors).	
		//set emptyprog to readjson("/KOSmodore/ksp-basic/Empty.bas").
		
		local cou to 0.
		local prrog to list().
		set prrog to preprocess(emptyprog).
		for lin in prrog {
			print lin at(0,cou).
			set cou to cou + 1.
		}
	}
	
// Running basic program page
	if p = 230 {
		SPageNoCLear(230).	
		ClearTerminal(monitors).
		local cou to 0.
		local prrog to list().
		local auxi to 0.
		
		set prrog to preprocess(emptyprog).
		clearscreen.
		for lin in prrog {
			//print lin at(0,cou).
			set auxi to lin:FIND(" ").
			if auxi = -1 {
				if lin:TOUPPER = "CLS" {          //non va non so perchè
					clearscreen.
					print "CLEARRRRRRRRRRRR".
				} 
			} else {
				//print "("+ lin:REMOVE(auxi,(lin:length-auxi)) + ")" at (0,cou+5).
				if lin:REMOVE(auxi,(lin:length-auxi)):TOUPPER = "PRINT" {
					//Print "PRINT " + lin:REMOVE(0,auxi+1) at (0,7+cou).
					
					//misteriosamente se uso sempre lo stesso nome per il file runpath
					//esegue sempre il primo che ha eseguito. per cui metto nomi diversi 
					log "PRINT " + lin:REMOVE(0,auxi+1) + "." to "print" + cou + ".ks".
					RUNPATH("print" + cou + ".ks").
					DELETEPATH("print" + cou + ".ks").
				}
			}
			wait 1.
			set cou to cou + 1.
		}
	}
	
// Edit basic prog 0
	if p = 237 {
		SPage(237).
		InitTermEditBas0(monitors).	
		set EditedLine to emptyprog:Length.
		//set emptyprog to readjson("/KOSmodore/ksp-basic/Empty.bas").
		
		local cou to 0.
		
		for lin in emptyprog {
			print lin at(0,cou).
			set cou to cou + 1.
		}
		set li to emptyprog.
		set lind to emptyprog:length.
		SetEditCursor(emptyprog).
		
	}
	
// Edit basic prog 1
	if p = 238 {
		SPage(238).
		InitTermEditBas1(monitors).	
		set EditedLine to emptyprog:Length.
		//set emptyprog to readjson("/KOSmodore/ksp-basic/Empty.bas").
		
		local cou to 0.
		
		for lin in emptyprog {
			print lin at(0,cou).
			set cou to cou + 1.
		}
		set li to emptyprog.
		set lind to emptyprog:length.
		SetEditCursor(emptyprog).
		
	}

// Edit basic prog 2
	if p = 239 {
		SPage(239).
		InitTermEditBas2(monitors).	
		set EditedLine to emptyprog:Length.
		//set emptyprog to readjson("/KOSmodore/ksp-basic/Empty.bas").
		
		local cou to 0.
		
		for lin in emptyprog {
			print lin at(0,cou).
			set cou to cou + 1.
		}
		set li to emptyprog.
		set lind to emptyprog:length.
		SetEditCursor(emptyprog).
		
	}

// Edit basic prog 3
	if p = 240 {
		SPage(240).
		InitTermEditBas3(monitors).	
		set EditedLine to emptyprog:Length.
		//set emptyprog to readjson("/KOSmodore/ksp-basic/Empty.bas").
		
		local cou to 0.
		
		for lin in emptyprog {
			print lin at(0,cou).
			set cou to cou + 1.
		}
		set li to emptyprog.
		set lind to emptyprog:length.
		SetEditCursor(emptyprog).
		
	}

	
// T9 save BAS pages
	if p = 243 {
		SPage(243).
		resetcicleset().
		InitTermFileSave(monitors).
		Print "Type file name: " at(0,0).	
		print linea + "_" at(0,1).
		setxy(0,1).
	}
	
	if p = 244 {
		SPage(244).	
		InitTermFileSave1(monitors).
		Print "Type file name: " at(0,0).	
		print linea + "_" at(0,1).
		setxy(0,1).
	}
	
	if p = 245 {
		SPage(245).	
		InitTermFileSave2(monitors).
		Print "Type file name: " at(0,0).	
		print linea + "_" at(0,1).
		setxy(0,1).
	}
	

}


// INF. HERE
function InfHerePAGE {
	SPage(999).
	Print "Latitude: " + round(SHIP:GEOPOSITION:LAT,3) + ", Longitude: "
		+ round(SHIP:GEOPOSITION:LNG,3) at (0,3). 
	print "Ground distance: " + round(SHIP:GEOPOSITION:distance,3) at (0,4).
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


