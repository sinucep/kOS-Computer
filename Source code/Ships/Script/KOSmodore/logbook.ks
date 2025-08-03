@lazyGlobal off.

global LBook to list(list()). //noooo correggi! a fare list(list()) crei subliste vuote!
//global LBookNote to list().      //pagina corrente del logbook 
//global EditedLine to 0.  //numero della righa editata
global CurrentNote to 0. // n di pagina corrente del logbook



function showNextNote {
	if CurrentNote < LBook:LENGTH-1 {
		set CurrentNote to CurrentNote + 1.
		GoPage(40).
	}
	
}

function LeaveLBook{
	set CurrentNote to LBook:LENGTH-1.
	GoPage(1).
}

function showPrevNote {
	if CurrentNote > 0 {
		set CurrentNote to CurrentNote - 1.
		GoPage(40).
	}
	
}

function AddLineToLBook{
	clearscreen.
	LBook[CurrentNote]:add(linea).
	//print linea.
	WRITEJSON(LBook, "/KOSmodore/logbook/logbook.json").
	set linea to "".
	GoPage(41).
}

function LBookUp{
	
}

function LBookDown{
}

function LbookNewPage{
	local stri to "".
	LBook:add(list()).
	
	local datetime to TIMESTAMP().
	set stri to "Time: " + datetime:full. //TIME:SECONDS.
	LBook[LBook:LENGTH-1]:add(stri).
	set stri to "Place: " + SHIP:body.
	LBook[LBook:LENGTH-1]:add(stri).
	set CurrentNote to LBook:LENGTH-1.
	GoPage(40).
}