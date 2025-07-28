@lazyGlobal off.

global emptyprog to list(). //it may be called "sourceprog". it contains the program as it is readed from file
global preprocprog to list(). //it contains the program withoyt the comments and the labels. informations about the labels for the GOTO command are stored in the GOTOInf list
global GOTOInf to list(list()). //it associate the position of GOTO line to the position where to jump
global editedline to 0. // edited line of a text (up and down to scroll)

function RunKS {
	//RUNPATH( "/KOSmodore/kerboscript/001.ks", 1, 2 ). 
	parameter fname.
	RUNPATH( "/KOSmodore/kerboscript/" + fname). 
}

// temporary utility to create an empty KSP-Basic file
function CreateEmpty {
	emptyprog:clear().
	FROM {local x is 0.} UNTIL x = 10 STEP {set x to x+1.} DO {
		emptyprog:add("").
	}
	writejson(emptyprog, "/KOSmodore/ksp-basic/Empty.bas").
	print "An empty 10 lines .BAS file created." at (0,0).
}

function preprocess {

//!!!!!!!!!!!!!!!!!!!!!!!!!
//   invece che caricare nella nuova lista solo le righe che non da eliminare
//   duplica la lista e semplicemente togli quelle da eliminare
//   puoi fare anche più funzioni tipo: togli commenti, togli righe vuote..
//!!!!!!!!!!!!!!!!!!!!!!!!!

	parameter prog.
	local pproced to list().
	local auxi to 0. //auxiliary nummber
	//local firstword to "".
	
	FROM {local x is 4.} UNTIL x = prog:LENGTH-1 STEP {set x to x+1.} DO {
		//set firstword to prog[x].
		
		//Remove REM comments
		if not(prog[x]:TOUPPER:startswith("REM ")) { 
		//	pproced:add(prog[x]).
		
		//Remove ' comments
			set auxi to prog[x]:FIND("'").
			if auxi = -1 {
				pproced:add(prog[x]).
			} else {
				pproced:add(prog[x]:REMOVE(auxi,(prog[x]:length-auxi))).
			}
		}
	}
	return pproced.
}

function ClearLine {
	set emptyprog[lind] to "".
	print "_                                       " at(0,lind).

}

function ClearBasFile {
	emptyprog:clear.
	// add also the header (version ecc.)
	emptyprog:add("").   //otherwise he doesn't know where to draw the cursor
	set lind to 0.
	GoPage(240).
}

function InsertLineKST {
	set lind to lind + 1.
	emptyprog:insert(lind,"").
	ClsNoCur().
		local cou to 0.
		
		for lin in emptyprog {
			print lin at(0,cou).
			set cou to cou + 1.
		}
	SetEditCursor(emptyprog).
	
}

function runbasic {

}

