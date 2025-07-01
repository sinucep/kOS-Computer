@lazyGlobal off.

local tpress to 0.
local conta to 0.
local symset to 0.
local tastopreced to 0. //quando premo un tasto diverso il contatore deve 
						//azzerarsi e l'unico modo per saperlo e memorizzarlo
global linea to "".

local x to 0.
local y to 0.

function setxy {
	parameter xx,yy.
	set x to xx.
	set y to yy.	
}

function resetcicleset{
set symset to 0.
}

function cicleset {
	set symset to symset + 1.
	if symset > 2 {
		set symset to 0.
	}
	
	if NPage = 41 or NPage = 42 or NPage = 43 {
		if symset = 0 {	LogBookPage1(). }
		if symset = 1 {	LogBookPage2().	}
		if symset = 2 {	LogBookPage3().	}
	}
	if NPage = 52 or NPage = 53 or NPage = 54 {
		if symset = 0 {	SaveDests(). }
		if symset = 1 {	SaveDests1().	}
		if symset = 2 {	SaveDests2().	}
	}
	if NPage = 33 or NPage = 34 or NPage = 35 {
		if symset = 0 {	SaveTrack(). }
		if symset = 1 {	SaveTrack1().	}
		if symset = 2 {	SaveTrack2().	}
	}
	if NPage = 83 or NPage = 84 or NPage = 85 {
		if symset = 0 {	SaveDataLog(). }
		if symset = 1 {	SaveDataLog1().	}
		if symset = 2 {	SaveDataLog2().	}
	}
}

function T9bu1par {
	parameter sa.
	
	set linea to linea + sa. //sa.
	print linea + "_" at(x,y).
	
	//set co to co + 1.
	//print sa at(CO,4).
	
}

function T9LEFT {         //back space
	
	if linea:length > 0 {
		set linea to linea:remove(linea:length-1,1).
		print linea + "_ " at(x,y).
	}
	//print " " at(CO,4).
	//set co to co - 1.
	
}

function T9bu3par {
	parameter sa, sb, sc, id, x, y.
    
	if (tpress > TIME:SECONDS - 0.6) {
		if not (tastopreced = id) {set conta to 0.}		
	}
	else {		
		set conta to 0.
	}
	set tastopreced to id.
	if (tpress > TIME:SECONDS - 0.6) and (conta = 3) {
		set conta to 0.
		set linea to linea:remove(linea:length-1,1).
	}
	if (tpress > TIME:SECONDS - 0.6) and (conta = 2) {
		set conta to conta + 1.
		set linea to linea:remove(linea:length-1,1) + sc.
		print linea + "_" at(x,y).
	}
	if (tpress > TIME:SECONDS - 0.6) and (conta = 1) {
		set conta to conta + 1.
		set linea to linea:remove(linea:length-1,1) + sb.
		print linea + "_" at(x,y).
	}
	if (conta = 0) {
		set conta to conta + 1.
		set linea to linea + sa.
		print linea + "_" at(x,y).
	}
	set tpress to TIME:SECONDS.	
}


function T9bu4par {
    
	parameter sa, sb, sc, sd, id, x, y.
	
	if (tpress > TIME:SECONDS - 0.6) {
		if not (tastopreced = id) {set conta to 0.}		
	}
	else {
		set conta to 0.
	}
	set tastopreced to id.
	if (tpress > TIME:SECONDS - 0.6) and (conta = 4) {
		set conta to 0.
		set linea to linea:remove(linea:length-1,1).
	}
	if (tpress > TIME:SECONDS - 0.6) and (conta = 3) {
		set conta to conta + 1.
		set linea to linea:remove(linea:length-1,1) + sd.
		print linea + "_" at(x,y).
	}
	
	if (tpress > TIME:SECONDS - 0.6) and (conta = 2) {
		set conta to conta + 1.
		set linea to linea:remove(linea:length-1,1) + sc.
		print linea + "_" at(x,y).
	}
	
	if (tpress > TIME:SECONDS - 0.6) and (conta = 1) {
		set conta to conta + 1.
		set linea to linea:remove(linea:length-1,1) + sb.
		print linea + "_" at(x,y).
	}
	if (conta = 0) {
		set conta to conta + 1.
		set linea to linea + sa.
		print linea + "_" at(x,y).
	}
	set tpress to TIME:SECONDS.	
}

function T9ABC { T9bu3par("A","B","C",1, x, y). }
function T9DEF { T9bu3par("D","E","F",2, x, y). }
function T9GHI { T9bu3par("G","H","I",3, x, y). }
function T9JKL { T9bu3par("J","K","L",4, x, y). }
function T9MNO { T9bu3par("M","N","O",5, x, y). }
function T9PQRS { T9bu4par("P","Q","R","S",6, x, y). }
function T9TUV { T9bu3par("T","U","V",7, x, y). }
function T9WXYZ { T9bu4par("W","X","Y","Z",8, x, y). }

function T9ABCl { T9bu3par("a","b","c",9, x, y). }
function T9DEFl { T9bu3par("d","e","f",10, x, y). }
function T9GHIl { T9bu3par("g","h","i",11, x, y). }
function T9JKLl { T9bu3par("j","k","l",12, x, y). }
function T9MNOl { T9bu3par("m","n","o",13, x, y). }
function T9PQRSl { T9bu4par("p","q","r","s",14, x, y). }
function T9TUVl { T9bu3par("t","u","v",15, x, y). }
function T9WXYZl { T9bu4par("w","x","y","z",16, x, y). }

function T9space {T9bu1par(" ").}

function T91 {T9bu1par("1").}
function T92 {T9bu1par("2").}
function T93 {T9bu1par("3").}
function T94 {T9bu1par("4").}
function T95 {T9bu1par("5").}
function T96 {T9bu1par("6").}
function T97 {T9bu1par("7").}
function T98 {T9bu1par("8").}
function T99 {T9bu1par("9").}
function T90 {T9bu1par("0").}
function T9dot {T9bu1par(".").}
function T9minus {T9bu1par("-").}

function T9123 { T9bu3par("1","2","3",17, x, y). }
function T9456 { T9bu3par("4","5","6",18, x, y). }
function T9789 { T9bu3par("7","8","9",19, x, y). }
function T90signs { T9bu3par("0","+","-",20, x, y). }
function parentesi { T9bu4par("(",")","=","#",21, x, y). }

//forbidden file name characters

// < (less than)
// > (greater than)
// : (colon - sometimes works, but is actually NTFS Alternate Data Streams)
// " (double quote)
// / (forward slash)
// \ (backslash)
// | (vertical bar or pipe)
// ? (question mark)
// * (asterisk)

function punct1 { T9bu4par("-","/",":","'",22, x, y). }
function punct2 { T9bu4par(",",".","!","?",23, x, y). }
function punct3 { T9bu4par("-","+","&",".",24, x, y). } // filename allowed

