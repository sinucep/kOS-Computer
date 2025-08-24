@lazyglobal off.

local lind2 to 0.
local hintlist to list().
local beginning to "".           //the beginning of the command sent by main
local beginninglength to 0.

//run once "/KOSmodore/interface.ks".

// cancella la pagina facendo sparire il cursore
function ClsNoCur {
	clearscreen.
	FROM {               //porta il cursore dove non lo vede nessuno
		local xx is 1.
	}
	UNTIL xx = 18 STEP {
		set xx to xx+1.
	} 
	DO {
		print " ".
	}
}

local secondoff to true.
local Bascommands to list(
	"CLS",
	"END",
	"MESSAGESEC",
	"PLAY",
	"PEEK",
	"POKE",
	"POS",
	"PRINT",
	"PRINT """"",
	"COLOR",
	"LOCATE",
	"GOTO",
	"REM",
	"RUNKS",
	"TEXT",
	"WAIT",
	
	// Color parameters
	"RED","GREEN","BLUE","YELLOW","CYAN","WHITE","ORANGE","PINK","MAGENTA",
	"VIOLET","BLACK","GRAY","BROWN","BACKGROUND","FOREGROUND"
	).
	
local Bascommandposes to list( //non usato, da ricontrollare
	"3",
	"3",
	"4",
	"4",
	"4",
	"3",
	"6",
	"7",
	"6",
	"7",
	"5",
	"3",
	"5").




function listastr {   //stampa una lista selezionalible di stringhe
	parameter lis.
	local cou to 0.
 
	FOR bod in lis {
		PRINT "  " + bod at(13, cou).
		set cou to cou + 1.
	}
	if lind2 > cou-1 {
		set lind2 to 0.
	}
	if lind2 < 0 {
		set lind2 to cou-1.
	}
	if lis:length > 0 {print ">" at(13,lind2). }
}

function ListaStrDown{
	parameter li.
    set lind2 to lind2 +1.
	listaStr(hintlist).
}

function ListaStrUp{
	parameter li.
	set lind2 to lind2 -1.
	listaStr(hintlist).
}

function makehintlist {
	parameter hi.
	local cou to 0.
	local sell to list().
	
	
	for lin in Bascommands {
		if lin:STARTSWITH(hi:toupper){
			sell:add(lin).
		}
	}
	return sell.
}

function clearlist {
	FROM {local ux is 0.}
		UNTIL ux = 17 STEP {set ux to ux+1.}
		DO { 
		print "                         " at(13,ux).
		
	}
}

//function printhints {
//	parameter hi.
//	local cou to 0.
//	
//	FROM {local ux is 0.}
//		UNTIL ux = 17 STEP {set ux to ux+1.}
//		DO { 
//		print "                                                " at(16,ux).
//		
//	}
//	
//	for lin in hintlist(hi) {
//		print lin at(18,cou).
//		set cou to cou + 1.
//	}
//}

//function printedit2frameHD {
//	clsnocur().
//	Print " Back                                                                  End/Home " at(0,0).  
//	Print " space                                                                          " at(0,1).
//	Print "                                                                                " at(0,2).
//	Print "                                                                                " at(0,3).
//	Print " Space                                                                Next hint " at(0,4).
//	Print "                                                                                " at(0,5).
//	Print "                                                                                " at(0,6).
//	Print "                                                                         Select " at(0,7).
//	Print "                                                                           hint " at(0,8).
//
//	Print "                                                                          Cycle " at(0,11).
//	Print "                                                                            set "  at(0,12).
//
//	FROM {local ux is 0.}
//		UNTIL ux = 17 STEP {set ux to ux+1.}
//		DO { 
//		print "|" at(14,ux).
//		print "|" at(65,ux).
//	}
//	//print core:messages:length at (12,3).
//	//core:messages:clear().
//	//print core:messages:length at (12,4).
//}
	
function printedit2frameLD {
	clsnocur().
	
	FROM {local ux is 0.}
		UNTIL ux = 17 STEP {set ux to ux+1.}
		DO { 
		print "[/hw]" at(0,ux).
	
	}
	
	Print "Back                                End/" at(5,0).  
	Print "space                               home" at(5,1).
	Print "                                        " at(5,2).
	Print "                                    Next" at(5,3).
	Print "Space                               hint" at(5,4).
	Print "                                        " at(5,5).
	Print "                                        " at(5,6).
	Print "                                   Enter" at(5,7).
	Print "                                    hint" at(5,8).
	Print "                                   Cycle" at(5,11).
	Print "                                    menu" at(5,12).

	FROM {local ux is 0.}
		UNTIL ux = 17 STEP {set ux to ux+1.}
		DO { 
		print "|" at(11,ux).
		print "|" at(38,ux).
	}
	//print core:messages:length at (12,3).
	//core:messages:clear().
	//print core:messages:length at (12,4).
}	


clsnocur().
PRINT "[/hw]Second processor ready." at(0,0).

until 2=3 {
until not secondoff {

WAIT UNTIL NOT CORE:MESSAGES:EMPTY. // make sure we've received something
	local RECEIVED TO CORE:MESSAGES:POP.
	IF RECEIVED:CONTENT = " dualedit" {
		printedit2frameLD().
		set hintlist to makehintlist(beginning).  //assuming cursor is at the line beginning when editor starts
		ListaStr(hintlist).                       //
		set secondoff to false.
	}
}


until secondoff {
	WAIT UNTIL NOT CORE:MESSAGES:EMPTY. // make sure we've received something
	local RECEIVED TO CORE:MESSAGES:POP.
	
	
	
	//IF RECEIVED:CONTENT = " dualedit" {
		
		
	//}
	
	IF RECEIVED:CONTENT = " ready" {
		clsnocur().
		
		PRINT "[/hw]Second processor ready." at(0,0).
		set secondoff to true.
	}
	IF not RECEIVED:CONTENT:STARTSWITH(" ") {
		//printhints(RECEIVED:CONTENT).
		set beginninglength to RECEIVED:CONTENT:length.
		set beginning to RECEIVED:CONTENT.
		clearlist().
		set hintlist to makehintlist(beginning).
		ListaStr(hintlist).
		//PRINT "receved: "+ beginning at (16,14).
	}
	IF RECEIVED:CONTENT = " down" {ListaStrDown(hintlist).}
	
	IF RECEIVED:CONTENT = " enter" {
		local ending TO hintlist[lind2]:remove(0,beginninglength).
		//local MESSAGE to list().
		//MESSAGE:add(ending).
		//MESSAGE:add(Bascommandposes[lind2]).
		local P TO PROCESSOR("main").
		//P:CONNECTION:SENDMESSAGE(MESSAGE).
		
		
		clearlist().
		//PRINT "beginning: "+ beginning at (16,15).
		set hintlist to makehintlist(hintlist[lind2]).
		ListaStr(hintlist).
		
		P:CONNECTION:SENDMESSAGE(ending).
	}
	//PRINT "Other message:                                  " at (16,10).
	//PRINT "Other message: (" + RECEIVED:CONTENT+")" at (16,10).
	
}
	}
	
	
















