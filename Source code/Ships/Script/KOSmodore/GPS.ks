global GPSPOS TO LIST().//////////////////
global Destin to LATLNG(0, 0).////////////

global GEOPOS to LATLNG(10, 20). 

function DRAWTRK {
	GTrack(LoadedTrack).
}

function AddHereToTrack{
	LoadedTrack:add(LIST()).
	LoadedTrack[LoadedTrack:LENGTH-1]:add(TIME:SECONDS).			
	LoadedTrack[LoadedTrack:LENGTH-1]:add(SHIP:GEOPOSITION:LAT).
	LoadedTrack[LoadedTrack:LENGTH-1]:add(SHIP:GEOPOSITION:LNG).
	Gopage(30).
}

function RemoveLastFromTrack{
	if LoadedTrack:LENGTH > 1{
		LoadedTrack:Remove(LoadedTrack:LENGTH-1).	
	}
	Gopage(30).
}

function RemoveFirstFromTrack{
	if LoadedTrack:LENGTH > 1{
		LoadedTrack:Remove(1).
	}
	Gopage(30).
}

function InitGPSLog {	
		LoadedTrack:add(LIST()).
	    LoadedTrack[LoadedTrack:LENGTH-1]:add(0).   //Time
		LoadedTrack[LoadedTrack:LENGTH-1]:add(101). //latitude
		LoadedTrack[LoadedTrack:LENGTH-1]:add(102). //longitude 
}

// old view track
//function ViewTrackold {
//	clearscreen.
//	local x to 0.
//	local y to 0.
//	FOR S IN LoadedTrack {
//		FOR SS IN S {
//			print round(SS,2) at (X,Y).
//			set x to x+9.
//		}		
//		set y to y+1.
//		set x to 0.
//	}	
//}



// SAVE GPS POS
function SaveGPSPOS {
	clearscreen.
	WRITEJSON(GPSPOS, "/KOSmodore/GPSpos.json").
	print "Saved to " + PATH() + "/KOSmodore/GPSpos.json".
}

// save POS to random file
function SaveDestRND {
GoPage(50).
	
	//if EXISTS("/KOSmodore/positions/+fname")
		
	if GPSPOS:length = 0 {
		 print "No destination set. Can't save." at(1,1).
	} else {
		local fname to "".
		FROM {local x is 8.} UNTIL x = 0 STEP {set x to x-1.} DO {
			set fname to fname + (floor(10*RANDOM())).
		}
		set fname to fname + ".pos".

		UNTIL not EXISTS("/KOSmodore/positions/" + fname) {
			set fname to "".
			FROM {local x is 8.} UNTIL x = 0 STEP {set x to x-1.} DO {
				set fname to fname + (floor(10*RANDOM())).
			}
			set fname to fname + ".pos".
		}
	

		WRITEJSON(GPSPOS, "/KOSmodore/positions/" + fname).

		print "----------------------------------------" at(0,14). //LUNGO GIUSTO
		print "Saved to:" at(1,15).
		//print PATH() + "/KOSmodore/positions/" + 
		print fname at (1,16).
	}
}


function ClrGPSPOS {
	GPSPOS:clear.
	if NPage = 50 {
		GoPage(50).
	}
}

//function RecTypedLat {      //registra la lat appena typed
	//set INPstr1 to linea.
	//GPSPOS:clear.
	//GPSPOS:add(linea:tonumber(-9999)). //se non è un numero valido restituisce -9999
//}

//function RecTypeLng {      //registra la lng appena typed
	//set INPstr2 to linea.
	//GPSPOS:add(linea:tonumber(-9999)).
	//DestinationsPAGE().
//}

function RecGPSPOS {

	GPSPOS:clear.
	GPSPOS:add(SHIP:GEOPOSITION:LAT).
	GPSPOS:add(SHIP:GEOPOSITION:LNG).
	set GeoPos to SHIP:GEOPOSITION.
   
	if NPage = 50 {
		GoPage(50).
	    //print "Set destination:" at(1,1).
		//print round(GPSPOS[0],4) + ", " + round(GPSPOS[1],4) at(1,2).
	}
}




// SAVE GPS LOG
function SaveGPSLOG {
clearscreen.
WRITEJSON(LoadedTrack, "/KOSmodore/tracks/GPSlog.json").

// decommentare se si vuole anche un file di testo
//DELETEPATH("/KOSmodore/tracks/GPSlog.txt").
//FOR S IN GPSLog {
//		FOR SS IN S {
//			LOG SS to "/KOSmodore/tracks/GPSlog.txt".
//		}		
//		LOG "" to "/KOSmodore/tracks/GPSlog.txt".
//	}

print "Saved to " + PATH() + "/KOSmodore/tracks/x".

//print "Saved to " + PATH() + "/KOSmodore/tracks/GPSlog.txt".

}

///////////////////////////////////// Load GPS LOG - DISUSO
function LoadGPSLOG {
clearscreen.
SET LoadedTrack TO READJSON("/KOSmodore/tracks/GPSlog.json").
print "Track loaded from /tracks/GPSlog.json".
}

// Clear GPS LOG
function ClearGPSLOG {
	LoadedTrack:clear.
	InitGPSLog().
	Gopage(30).
}

