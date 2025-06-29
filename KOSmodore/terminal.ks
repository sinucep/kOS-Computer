@lazyglobal off.

run once "/KOSmodore/rover.ks".
run once "/KOSmodore/keybT9.ks".
run once "/KOSmodore/keyT9masks.ks".
run once "/KOSmodore/logbook.ks".
run once "/KOSmodore/files.ks".
run once "/KOSmodore/GPS.ks".

global mybuttons to addons:kpm:buttons.
global mylabels to addons:kpm:labels.
global myflags to addons:kpm:flags.

// stupide info
function button05Press {
clearscreen.	
print "GUID: " + id.
print "monindex: " + monindex.
}

function MSetLabel{
	parameter nu.
	parameter stri.
	parameter monitors.
	
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		set mylabels:currentmonitor to x.
		mylabels:setlabel(nu, stri).
	}
}

function MSetFlag{
	parameter nu.
	parameter boo.
	parameter monitors.
	
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		 set myflags:currentmonitor to x. 
	     myflags:setstate(nu,FALSE).
	}
}
	
function MNOP{
}

function InitTerminalMAIN {
	parameter monitors.
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
	    
		//mylabels:setlabel(0," REC POS").
		//mylabels:setlabel(1," REC TRK").
		//mylabels:setlabel(2," REC SMP").
		mylabels:setlabel(0,"  Dest. ").
		mylabels:setlabel(1," Tracks ").
		mylabels:setlabel(2,"Data log").
		mylabels:setlabel(3,"  Rover ").
		mylabels:setlabel(4," Logbook").
		mylabels:setlabel(6,"  XXXX  ").   //assegnamento coatto a EXIT
		
		mylabels:setlabel(9," Reboot ").
		mylabels:setlabel(10," Exit OS").
		mylabels:setlabel(13,"Settings").
  
		//mybuttons:setdelegate(0,toggleFlag@:BIND(0)). 
		//mybuttons:setdelegate(1,toggleFlag@:BIND(1)). 
		//mybuttons:setdelegate(2,toggleFlag@:BIND(2)).
		mybuttons:setdelegate(0,DestinationsPAGE@).
		mybuttons:setdelegate(1,TrackPAGE@).
		mybuttons:setdelegate(2,SAMPLEPAGE@).	
		mybuttons:setdelegate(3,ROVERPAGE@).
		mybuttons:setdelegate(4,LogBookPage@).
		
		mybuttons:setdelegate(9,MyReboot@).
		mybuttons:setdelegate(10,exitos@).
		mybuttons:setdelegate(13,SettingsPage@).
		 
		myflags:setlabel(0,"Dest.").
		myflags:setlabel(1,"Track").	
		myflags:setlabel(2,"D.log").  
	}
}

// Destination
function InitTerminalDestination {

	parameter monitors.
	
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		
		mylabels:setlabel(0,"Set Here").
		mylabels:setlabel(1," Type D.").
		
		mylabels:setlabel(7,"Clear D.").
		mylabels:setlabel(8,"Save D. ").
		mylabels:setlabel(9,"QSave D.").
		mylabels:setlabel(10," Load D.").
		mylabels:setlabel(12," Draw D.").
		mylabels:setlabel(13," Hide D.").
		
		
		mybuttons:setdelegate(0,toggleFlag@:BIND(0)).
		mybuttons:setdelegate(1,TypeRealNum@:BIND(55,"Type latitude: ",0, true)).
		mybuttons:setdelegate(2,GDestination@).
		mybuttons:setdelegate(7,ClrGPSPOS@).
		mybuttons:setdelegate(8,SaveDests@).
		mybuttons:setdelegate(9,SaveDestRND@).
		mybuttons:setdelegate(10,ListDests@).
		mybuttons:setdelegate(12,GDestination@).
		mybuttons:setdelegate(13,HideTRK@).
	
		mybuttons:setdelegate(-2,MMAIN@).         //CANCEL
		
		myflags:setlabel(0,"Dest.").  
	}
}

// load Destination - P51
function InitTerminalDestinationLoad {

	parameter monitors.
	
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
				
		mybuttons:setdelegate(-2,DestinationsPAGE@).         //CANCEL
		mybuttons:setdelegate(-1,EnterListselect@).   //ENTER
		mybuttons:setdelegate(-3,listaFileUp@).       //UP
		mybuttons:setdelegate(-4,listaFileDown@).     //DOWN	
	}
}

// Type RealNum Accept - P55 (latitude) - p56 (lng)
function InitTermTypeRealNum {
	parameter monitors.
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		ClearTerminal(x).
		SetNumbersOnly(x).
	
	    mybuttons:setdelegate(-2,TypeRealNumCancel@).         //CANCEL
	}
}


// Save FIle 0 - P52 dest - p33 track - p83 Data Log
function InitTermFileSave {

	parameter monitors.
	
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		SetBasicSymbols(x).
	
		mylabels:setlabel(7,"  [...] ").
		mylabels:setlabel(8," - + & .").
		
		mybuttons:setdelegate(7,cicleset@).
		mybuttons:setdelegate(8,punct3@).
	
		mybuttons:setdelegate(-5,T9LEFT@).        //LEFT
		mybuttons:setdelegate(-6,T9space@).       //RIGHT
				
		mybuttons:setdelegate(-2,EscSaveFile@).         //CANCEL
		mybuttons:setdelegate(-1,saveas@).   //ENTER
	}
}

// Save File 1 - P53 dest - p34 track - p84 Data Log
function InitTermFileSave1 {
	parameter monitors.
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		SetBasicSymbolsLower(x).

		mylabels:setlabel(7,"  [...] ").
		mylabels:setlabel(8," - + & .").
		
		mybuttons:setdelegate(7,cicleset@).
		mybuttons:setdelegate(8,punct3@).
	
		mybuttons:setdelegate(-2,EscSaveFile@).         //CANCEL
		mybuttons:setdelegate(-5,T9LEFT@).        //LEFT
		mybuttons:setdelegate(-6,T9space@).       //RIGHT
		mybuttons:setdelegate(-1,saveas@).   //ENTER
	}
}

// Save File 2 - P54 dest - p35 track - p85 Data Log
function InitTermFileSave2 {
parameter monitors.
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		SetBasicSymbolsNumbers(x).
  
		mylabels:setlabel(7,"  [...] ").
		mylabels:setlabel(8," - + & .").
		
		mybuttons:setdelegate(7,cicleset@).
		mybuttons:setdelegate(8,punct3@).
  
		mybuttons:setdelegate(-2,EscSaveFile@).         //CANCEL
		mybuttons:setdelegate(-5,T9LEFT@).        //LEFT
		mybuttons:setdelegate(-6,T9space@).       //RIGHT
		mybuttons:setdelegate(-1,saveas@).   //ENTER
 
	}
}


// TRACKS - page 30
function InitTerminalGPS {

	parameter monitors.
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		mylabels:setlabel(0," + Here ").
		mylabels:setlabel(1," - Last ").
		mylabels:setlabel(2," - First").
		mylabels:setlabel(3," View T.").
		mylabels:setlabel(4," Log TRK").
		mylabels:setlabel(7," CLR TRK ").
		mylabels:setlabel(8," Save T.").
		mylabels:setlabel(9," Load T.").
		//mylabels:setlabel(10,"QSave T.").
		mylabels:setlabel(12,"Draw TRK").
		mylabels:setlabel(13,"Hide TRK").
 
	
		mybuttons:setdelegate(0,AddHereToTrack@).
		mybuttons:setdelegate(1,RemoveLastFromTrack@).
		mybuttons:setdelegate(2,RemoveFirstFromTrack@).
		mybuttons:setdelegate(3,ViewTrack@).
		mybuttons:setdelegate(4,toggleFlag@:BIND(1)). 
		mybuttons:setdelegate(7,ClearGPSLOG@).
		//mybuttons:setdelegate(8,SaveGPSLOG@).
		mybuttons:setdelegate(8,SaveTrack@).
		mybuttons:setdelegate(9,ListTracks@).
		//mybuttons:setdelegate(10,SaveDestRND@).
		mybuttons:setdelegate(12,DrawTRK@).
		mybuttons:setdelegate(13,HideTRK@).	
		
		mybuttons:setdelegate(-2,MMAIN@).         //CANCEL
	}
}



// load Track - P31
function InitTerminalTrackload {

	parameter monitors.
	
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
				
		mybuttons:setdelegate(-2,TrackPAGE@).         //CANCEL
		mybuttons:setdelegate(-1,EnterListselect@).   //ENTER
		mybuttons:setdelegate(-3,listaFileUp@).       //UP
		mybuttons:setdelegate(-4,listaFileDown@).     //DOWN
	}
}

// TRACKS view - page 32
function InitTerminalViewTrack {

	parameter monitors.
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		
		mybuttons:setdelegate(-2,TrackPAGE@).         //CANCEL
	}
}

// Data Log page 70
function InitTerminalSampler {

	parameter monitors.
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		mylabels:setlabel(0,"+ sample").
		mylabels:setlabel(1,"   Log  ").
		mylabels:setlabel(2," Sources").
		
		mylabels:setlabel(4," View DL").
		mylabels:setlabel(7," CLR DL ").
		mylabels:setlabel(8," Save DL").
		mylabels:setlabel(9," Load DL").
				
		mybuttons:setdelegate(0,DataLogAdd@).  
		mybuttons:setdelegate(1,toggleFlag@:BIND(2)). 
		mybuttons:setdelegate(2,proceedtoSourcePage@).  
		mybuttons:setdelegate(4,ViewDataLogPage@).  
		mybuttons:setdelegate(7,ClearSensLOG@).
		//mybuttons:setdelegate(8,SaveGPSLOG@).
		mybuttons:setdelegate(8,SaveDataLog@).
		mybuttons:setdelegate(9,ListSamples@).
		
		mybuttons:setdelegate(-2,MMAIN@).         //CANCEL
		
		myflags:setlabel(2,"D.log").	
	}
}

// load samples - P71
function InitTerminalSamplingload {

	parameter monitors.
	
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
				
		mybuttons:setdelegate(-2,SamplePAGE@).         //CANCEL
		mybuttons:setdelegate(-1,EnterListselect@).   //ENTER
		mybuttons:setdelegate(-3,listaFileUp@).       //UP
		mybuttons:setdelegate(-4,listaFileDown@).     //DOWN
	}
}

// view data log - P72
function InitTerminalViewDataLog {

	parameter monitors.
	
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		
		mylabels:setlabel(1,"< Source").
		mylabels:setlabel(2,"Source >").
		
		mybuttons:setdelegate(1,PrevColumnSource@). 
		mybuttons:setdelegate(2,NextColumnSource@).  
				
		mybuttons:setdelegate(-2,SamplePAGE@).         //CANCEL
	}
}

// ROVER
function InitTerminalROVER {

	parameter monitors.
	
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		
		mylabels:setlabel(4,"Go Track").   // segui track
		mylabels:setlabel(5," Go Dest").  // vai a dest
		mylabels:setlabel(6,"  XXXX  ").  // assegnamento coatto a EXIT
		mylabels:setlabel(7,"Brake on").
		mylabels:setlabel(8," BRK off").
	
		mylabels:setlabel(10," Reboot ").
 
		mybuttons:setdelegate(4,gorovertrack@).
		mybuttons:setdelegate(5,goroverpos@).
		mybuttons:setdelegate(7,brakes_on@).
		mybuttons:setdelegate(8,brakes_off@).	
		mybuttons:setdelegate(10,MyReboot@).
	
		mybuttons:setdelegate(-2,MMAIN@).         //CANCEL
	}
}

// PAGE 40
function InitTermLogBook {
	parameter monitors.
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
  
		mylabels:setlabel(0," + Page ").
		mylabels:setlabel(1,"  Edit  ").
		mylabels:setlabel(2," Previus").
		mylabels:setlabel(3,"  Next  ").

		mybuttons:setdelegate(0,LbookNewPage@).
		mybuttons:setdelegate(1,LogBookPage1@).
		mybuttons:setdelegate(2,showPrevNote@).
		mybuttons:setdelegate(3,showNextNote@).
		
		mybuttons:setdelegate(-2,LeaveLBook@).         //CANCEL
		
	}
}

function InitTermLogBook1 {
	parameter monitors.
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		SetBasicSymbols(x).
  
		mylabels:setlabel(7,"  [...] ").
		mylabels:setlabel(8," - / : '").
		mylabels:setlabel(9," , . ! ?").
		 
		mybuttons:setdelegate(7,cicleset@).
		mybuttons:setdelegate(8,punct1@).
		mybuttons:setdelegate(9,punct2@).
			
		mybuttons:setdelegate(-2,LeaveLBook@).         //CANCEL
		mybuttons:setdelegate(-5,T9LEFT@).        //LEFT
		mybuttons:setdelegate(-6,T9space@).       //RIGHT
		mybuttons:setdelegate(-1,AddLineToLBook@).   //ENTER
		mybuttons:setdelegate(-3,LBookUp@).          //UP
		mybuttons:setdelegate(-4,LBookDown@).          //DOWN
 
	}
}

function InitTermLogBook2 {
	parameter monitors.
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		SetBasicSymbolsLower(x).

		mylabels:setlabel(7,"  [...] ").
		mylabels:setlabel(8," - / : '").
		mylabels:setlabel(9," , . ! ?").

		mybuttons:setdelegate(7,cicleset@).
		mybuttons:setdelegate(8,punct1@).
		mybuttons:setdelegate(9,punct2@).
	
		mybuttons:setdelegate(-2,MMAIN@).         //CANCEL
		mybuttons:setdelegate(-5,T9LEFT@).        //LEFT
		mybuttons:setdelegate(-6,T9space@).       //RIGHT
		mybuttons:setdelegate(-1,AddLineToLBook@).   //ENTER
		mybuttons:setdelegate(-3,LBookUp@).          //UP
		mybuttons:setdelegate(-4,LBookDown@).          //DOWN
	}
}

function InitTermLogBook3 {
	parameter monitors.
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		SetBasicSymbolsNumbers(x).
  
		mylabels:setlabel(7,"  [...] ").
		mylabels:setlabel(8," - / : '").
		mylabels:setlabel(9," , . ! ?").
		
		mylabels:setlabel(13," ( ) = #").
	
		mybuttons:setdelegate(7,cicleset@).
		mybuttons:setdelegate(8,punct1@).
		mybuttons:setdelegate(9,punct2@).
		
		mybuttons:setdelegate(13,parentesi@).
  
		mybuttons:setdelegate(-2,MMAIN@).         //CANCEL
		mybuttons:setdelegate(-5,T9LEFT@).        //LEFT
		mybuttons:setdelegate(-6,T9space@).       //RIGHT
		mybuttons:setdelegate(-1,AddLineToLBook@).   //ENTER
		mybuttons:setdelegate(-3,LBookUp@).          //UP
		mybuttons:setdelegate(-4,LBookDown@).          //DOWN
 
	}
}

// page 74 - the data log will be lost. proceed?
function InitTermProceedToSource{
		parameter monitors.
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		
		mylabels:setlabel(0,"   OK   ").
		mylabels:setlabel(1," Cancel ").
				
		mybuttons:setdelegate(0,DataSourcePage@).
		mybuttons:setdelegate(1,SamplePAGE@).
		
		mybuttons:setdelegate(-2,SamplePAGE@).             //CANCEL
	}
}

// page 75
function InitTermShowDataSources{
		parameter monitors.
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		
		mylabels:setlabel(0,"+ Source").
		mylabels:setlabel(1,"- Source").
				
		mybuttons:setdelegate(0,AddDataSource@).
		mybuttons:setdelegate(1,DelDataSource@).
		
		mybuttons:setdelegate(-2,SamplePAGE@).             //CANCEL
	}
}

// pages 76 
function InitTermSelectDataSourcesAdd{
		parameter monitors.
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		
		mybuttons:setdelegate(-2,SamplePAGE@).             //CANCEL
		mybuttons:setdelegate(-1,EnterListselect@).   //ENTER
		mybuttons:setdelegate(-3,listaStrUp@:bind(DSnames(DataSources))). //UP
		mybuttons:setdelegate(-4,listaStrDown@:bind(DSnames(DataSources))). //DOWN
	}
}

// p 77
function InitTermSelectDataSourcesSub{
		parameter monitors.
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		
		mybuttons:setdelegate(-2,SamplePAGE@).             //CANCEL
		mybuttons:setdelegate(-1,EnterListselect@).   //ENTER
		mybuttons:setdelegate(-3,listaStrUp@:bind(DSnames(DataSourcesAdded))). //UP
		mybuttons:setdelegate(-4,listaStrDown@:bind(DSnames(DataSourcesAdded))). //DOWN
	}
}

// page 100 - Settings
function InitTermSettings{
		parameter monitors.
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		
		mylabels:setlabel(0,"Set m.t.").
		mylabels:setlabel(1,"Set d.i.").
		mylabels:setlabel(2,"Set t.i.").
						
		mybuttons:setdelegate(0,TypeRealNum@:BIND(101,"Type marker thickness: ",0, true)).
		mybuttons:setdelegate(1,TypeRealNum@:BIND(102,"Type DL interval (s): ",0, true)).
		mybuttons:setdelegate(2,TypeRealNum@:BIND(103,"Type TRK interval (s): ",0, true)).

		mybuttons:setdelegate(-2,MMAIN@).             //CANCEL
	}
}