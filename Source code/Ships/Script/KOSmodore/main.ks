//-------------------------------------------------|
//                                                 |
//  KOSmodore64 main - by Francisco Bordin - 2025  |
//                                                 |
//-------------------------------------------------|

@lazyGlobal off.

run once "/KOSmodore/terminal.ks".
run once "/KOSmodore/GPS.ks".
run once "/KOSmodore/rover.ks".
run once "/KOSmodore/splashes.ks".
run once "/KOSmodore/interface.ks".
run once "/KOSmodore/graphics.ks".
run once "/KOSmodore/math.ks".
run once "/KOSmodore/sampling.ks".
run once "/KOSmodore/pages.ks".
run once "/KOSmodore/datalog.ks".
run once "/KOSmodore/settings.ks".

global fine to false. // per uscire dal programma e usare il terminale

//Addon KOSProp Monitor
global monitors to addons:kpm:getmonitorcount().
global id to addons:kpm:getguidshort(0).      // OR set id to addons:kpm:getguid(0).
global monindex to addons:kpm:getindexof(id). // If GETINDEXOF Returns -1, GUID Not Found. Works for Whole GUID and Short GUID

local LogStart is 0.
local GPSLogStart is 0.
local PosStart is 0.                      // just for to blink once POS flag

global SensLog TO LIST().
global LoadedTrack TO LIST().  
global endpos to LatLng(-90,8). 			  //destinazione provvissoria per il rover                   
global SENSELIST TO LIST().


LIST SENSORS IN SENSELIST.

InitTerminalMAIN(monitors).

function ExitOS {
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		ClearTerminal(x).
	}
	clearscreen.
	print "Exit main loop.".
	set fine to true.
}
	
function toggleFlag {
	parameter flagNum is 0.
    if flagNum = 0 {
		
		set PosStart to TIME:SECONDS.
		RecGPSPOS().
	}
	if flagNum = 1 {
		set GPSLogStart to TIME:SECONDS.
	}
	if flagNum = 2 {
		set LogStart to TIME:SECONDS.
	}
	
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO { 
		set myflags:currentmonitor to x. 
		
		if flagNum = 0 {
			myflags:setstate(0,TRUE).	
		}
		if flagNum = 1 {
			myflags:setstate(1,not (myflags:getstate(1))).
		}
		if flagNum = 2 {
			myflags:setstate(2,not (myflags:getstate(2))).	
		}
	}
}

function MyREBOOT {
	REBOOT.	
}

function goroverpos {

	if GPSPOS:Length = 0 {
		print "No destination set." at(1,1).
	} else {	
	
	clearScreen.
	brakes off.	
	set endPos to LatLng(GPSPOS[0], GPSPOS[1]).
	
	//solo per inizializzare qualcosa:
	set speedPID:setPoint to 1.   //speed
	set turnPID:setPoint to 0.     	//Direction
		
	global wanted_throttle to 0. // for now.
	lock wheelThrottle to wanted_throttle.
	global wanted_angle to 0.
	lock WHEELSTEERING to wanted_angle.
	
	set controlrover to 1.
	set roverstate to 1.
	} 	
}

function gorovertrack {
	
	if LoadedTrack:Length = 1 { //perché c'è lo header
		print "No track set." at(1,1).
	} else {	
		clearScreen.
		brakes off.	
		
		set speedPID:setPoint to 1.      //Speed
		set turnPID:setPoint to 0.      //Direction
			
		global wanted_throttle to 0. // for now.
		lock wheelThrottle to wanted_throttle.
		global wanted_angle to 0.
		lock WHEELSTEERING to wanted_angle.
	
		set roverstate to 1.
		set controlrover to 2.
	}
}
function DataLogAdd {
			SensLog:add(LIST()).
			SensLog[SensLog:LENGTH-1]:add(TIME:SECONDS).
			for ds in DataSourcesAdded {
				if ds = 1 {SensLog[SensLog:LENGTH-1]:add(ship:sensors:LIGHT).}
				if ds = 2 {SensLog[SensLog:LENGTH-1]:add(ship:sensors:TEMP).}
				if ds = 3 {SensLog[SensLog:LENGTH-1]:add(ship:sensors:PRES).}
				if ds = 4 {SensLog[SensLog:LENGTH-1]:add(ship:mass).}
				if ds = 10 {SensLog[SensLog:LENGTH-1]:add(ship:mass).}
				if ds = 20 {SensLog[SensLog:LENGTH-1]:add(ship:airspeed).}
				if ds = 21 {SensLog[SensLog:LENGTH-1]:add(ship:verticalspeed).}
				if ds = 22 {SensLog[SensLog:LENGTH-1]:add(ship:groundspeed).}
				if ds = 101 {SensLog[SensLog:LENGTH-1]:add(SHIP:GEOPOSITION:LAT).}
				if ds = 102 {SensLog[SensLog:LENGTH-1]:add(SHIP:GEOPOSITION:LNG).}
			}
			
			If Npage = 70 {
				SamplePAGE().
			}
			If Npage = 72 {
				ViewDataLogPage().
			}
}

//---------------------Initialize-----------------------

DataSourcesAdded:add(4). // default source: Vessel mass
InitSensLog().
InitGPSLog().
switch to 0. //con questa riga i file vengono salvati fisicamente (in archivio)
brakes on.   //for rovers..
SPage(0).
mainsplash().
riempisourcelist().
riempiSettings().

SET LBook TO READJSON("/KOSmodore/logbook/logbook.json").
print "Logbook loaded from logbook.json".
set CurrentNote to LBook:LENGTH-1.

//flags
 myflags:setstate(0,FALSE).
  myflags:setstate(1,FALSE).
  myflags:setstate(2,FALSE).

//----------------------Main Loop-----------------------

UNTIL fine {
// Pos flag label blink
if myflags:getstate(0) {
		if TIME:SECONDS > PosStart + 1{
			 MSetFlag(0,FALSE,monitors).
		}
	}

//LOGging
	if myflags:getstate(1) {
		if TIME:SECONDS > GPSLogStart {
			LoadedTrack:add(LIST()).
			LoadedTrack[LoadedTrack:LENGTH-1]:add(TIME:SECONDS).			
			LoadedTrack[LoadedTrack:LENGTH-1]:add(SHIP:GEOPOSITION:LAT).
			LoadedTrack[LoadedTrack:LENGTH-1]:add(SHIP:GEOPOSITION:LNG).
			
			If Npage = 30 {
				TrackPAGE().
			}
			If Npage = 32 {
				ViewTrack().
			}
			
			set GPSLogStart to GPSLogStart + SettingsL[2]. //  track sampling time interval
		}
	}
	
	if myflags:getstate(2) {
		if TIME:SECONDS > LogStart {		
			DataLogAdd().
			
			set LogStart to LogStart + SettingsL[1]. // data sampling time interval
		}
	}

//rover
	if controlrover = 1 {
		conroverPos(endPos).
	}
	if controlrover = 2 {
		ConRovertrack(LoadedTrack).
	}
	
}
