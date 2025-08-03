@lazyglobal off.

run once "/KOSmodore/runKS.ks".
run once "/KOSmodore/texted.ks".

global CuX to 0.
global CuY to 0.
global Cuc to "_".
global CuVisible to true.

function Cur {
	print Cuc at(Cux, Cuy).
}

//buffer state function (when you have to do something just once)
function bufTextEdit {
	CuReset().
	GoPage(237).
}

function CuReset { 
	set CuX to 0.
	set Cuy to 0.
}
	

function CuDel {   //what char there is in (x,y). Behind the cursor
	
	local cha to "".
	if cux < emptyprog[cuy]:length {
		set cha to emptyprog[cuy]:substring(cux,1).
	} else {
		set cha to " ".
	}
	print cha at(cux,cuy).
}

function CuRight {
	if cuX < 40 {
		if cux < emptyprog[Cuy]:length {
			CuDel().
			set cuX to cuX + 1.
			//Cur().
		}
	}
}

function CuLeft {
	if cuX > 0 {
		CuDel().
		set cuX to cuX - 1.
		//Cur().
	}
}

function CuDown {
	if cuY < 16 {
		if Cuy < emptyprog:length-1 {
			
			CuDel().
			set cuY to cuY + 1.
			//set Edline to emptyprog[Cuy].
			if emptyprog[Cuy]:length < CuX {
				set Cux to emptyprog[Cuy]:length.
			}
			//Cur().
		}
	}
}

function CuUp {
	if cuY > 0 {
		CuDel().
		set cuY to cuY - 1.
		if emptyprog[Cuy]:length < CuX {
				set Cux to emptyprog[Cuy]:length.
		}
		//Cur().
	}
}

