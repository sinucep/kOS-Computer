@lazyGlobal off.

run once "/KOSmodore/texted.ks".

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
		
	if NPage = 41 or NPage = 42 or NPage = 43 {
		if symset > 2 { set symset to 0. }
		if symset = 0 {	GoPage(41). }
		if symset = 1 {	GoPage(42).	}
		if symset = 2 {	GoPage(43).	}
	}
	if NPage = 52 or NPage = 53 or NPage = 54 {
		if symset > 2 { set symset to 0. }
		if symset = 0 {	GoPage(52). }
		if symset = 1 {	GoPage(53).	}
		if symset = 2 {	GoPage(54).	}
	}
	if NPage = 33 or NPage = 34 or NPage = 35 {
		if symset > 2 { set symset to 0. }
		if symset = 0 {	GoPage(33). }
		if symset = 1 {	GoPage(34).	}
		if symset = 2 {	GoPage(35).	}
	}
	if NPage = 83 or NPage = 84 or NPage = 85 {
		if symset > 2 { set symset to 0. }
		if symset = 0 {	GoPage(83). }
		if symset = 1 {	GoPage(84).	}
		if symset = 2 {	GoPage(85).	}
	}
	if NPage = 207 or NPage = 208 or NPage = 209 {
		if symset > 2 { set symset to 0. }
		if symset = 0 {	GoPage(207). }
		if symset = 1 {	GoPage(208).	}
		if symset = 2 {	GoPage(209).	}
	}
	if NPage = 243 or NPage = 244 or NPage = 245 {
		if symset > 2 { set symset to 0. }
		if symset = 0 {	GoPage(243). }
		if symset = 1 {	GoPage(244).	}
		if symset = 2 {	GoPage(245).	}
	}
	if NPage = 263 or NPage = 264 or NPage = 265 {
		if symset > 2 { set symset to 0. }
		if symset = 0 {	GoPage(263). }
		if symset = 1 {	GoPage(264).	}
		if symset = 2 {	GoPage(265).	}
	}
	if NPage = 237 or NPage = 238 or NPage = 239 or NPage = 240{
		if symset > 3 { set symset to 0. }
		if symset = 0 {	GoPage(237). }
		if symset = 1 {	GoPage(238).	}
		if symset = 2 {	GoPage(239).	}
		if symset = 3 {	GoPage(240).	}
	}
	if NPage = 277 or NPage = 278 or NPage = 279 or NPage = 280{
		if symset > 3 { set symset to 0. }
		if symset = 0 {	GoPage(277). }
		if symset = 1 {	GoPage(278).	}
		if symset = 2 {	GoPage(279).	}
		if symset = 3 {	GoPage(280).	}
	}
}

function T9bu1par {
	parameter sa.
	set linea to linea + sa.
	print linea + "_" at(x,y).	
}

// versione per l'editor
function T9bu1parE {
	parameter sa, EdLine.
	
	set EdLine to EdLine:insert(cuX,sa).
	set CuX to Cux + 1.
	print EdLine at(0,Cuy).
	
	return EdLine.
}

function T9LEFT {         //back space
	if linea:length > 0 {
		set linea to linea:remove(linea:length-1,1).
		print linea + "_ " at(0,y).
	}
	//print " " at(CO,4).
	//set co to co - 1.
	
}

// versione per l'editor
function T9backspaceE {         //back space
	parameter EdLine.
	if CuX > 0 {
		set CuX to Cux - 1.
		set EdLine to EdLine:remove(CuX, 1).
		print EdLine + "  " at(0,Cuy). //duoble space for there is also the cursor to delete
	}
	return EdLine.
}

// versione per l'editor
function T9cancelE {         //canc
	parameter EdLine.
	if EdLine:length-CuX > 0 {
		set EdLine to EdLine:remove(CuX, 1).
		print EdLine + " " at(0,Cuy).
	}
	return EdLine.
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

// versione per l'editor
function T9bu3parE {
	parameter sa, sb, sc, id, EdLine.
    
	if (tpress > TIME:SECONDS - 0.6) {
		if not (tastopreced = id) {set conta to 0.}		
	}
	else {		
		set conta to 0.
	}
	set tastopreced to id.
	if (tpress > TIME:SECONDS - 0.6) and (conta = 3) {
		set conta to 0.
		set cux to cux - 1.
			set EdLine to EdLine:remove(cuX, 1).
	}
	if (tpress > TIME:SECONDS - 0.6) and (conta = 2) {
		set conta to conta + 1.
		set cux to cux - 1.
			set EdLine to EdLine:remove(cuX, 1).
			set EdLine to EdLine:insert(cuX, sc).
		set cux to cux + 1.
		print EdLine at(0,cuy).
	}
	if (tpress > TIME:SECONDS - 0.6) and (conta = 1) {
		set conta to conta + 1.
		set cux to cux - 1.
			set EdLine to EdLine:remove(cuX, 1).
			set EdLine to EdLine:insert(cuX, sb).
		set cux to cux + 1.
		print EdLine at(0,cuy).
	}
	if (conta = 0) {
			set EdLine to EdLine:insert(cuX,sa).
		set cux to cux + 1.
		set conta to conta + 1.
		print EdLine at(0,cuy).
	}
	set tpress to TIME:SECONDS.
	return EdLine.
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

// versione per l'editor
function T9bu4parE {
	parameter sa, sb, sc, sd, id, EdLine.
	
	if (tpress > TIME:SECONDS - 0.6) {
		if not (tastopreced = id) {set conta to 0.}		
	}
	else {
		set conta to 0.
	}
	set tastopreced to id.
	if (tpress > TIME:SECONDS - 0.6) and (conta = 4) {
		set conta to 0.
		set cux to cux - 1.
			set EdLine to EdLine:remove(cuX, 1).
	}
	if (tpress > TIME:SECONDS - 0.6) and (conta = 3) {
		set conta to conta + 1.
		set cux to cux - 1.
			set EdLine to EdLine:remove(cuX, 1).
			set EdLine to EdLine:insert(cuX, sd).
		set cux to cux + 1.
		print EdLine at(0,cuy).
	}
	
	if (tpress > TIME:SECONDS - 0.6) and (conta = 2) {
		set conta to conta + 1.
		set cux to cux - 1.
			set EdLine to EdLine:remove(cuX, 1).
			set EdLine to EdLine:insert(cuX, sc).
		set cux to cux + 1.
		print EdLine at(0,cuy).
	}
	
	if (tpress > TIME:SECONDS - 0.6) and (conta = 1) {
		set conta to conta + 1.
		set cux to cux - 1.
			set EdLine to EdLine:remove(cuX, 1).
			set EdLine to EdLine:insert(cuX, sb).
		set cux to cux + 1.
		print EdLine at(0,cuy).
	}
	if (conta = 0) {
			set EdLine to EdLine:insert(cuX,sa).
		set cux to cux + 1.
		set conta to conta + 1.
		print EdLine at(0,cuy).
	}
	set tpress to TIME:SECONDS.
	return EdLine.
}

function T9ABC { T9bu3par("A","B","C",1, x, y). }
function T9DEF { T9bu3par("D","E","F",2, x, y). }
function T9GHI { T9bu3par("G","H","I",3, x, y). }
function T9JKL { T9bu3par("J","K","L",4, x, y). }
function T9MNO { T9bu3par("M","N","O",5, x, y). }
function T9PQRS { T9bu4par("P","Q","R","S",6, x, y). }
function T9TUV { T9bu3par("T","U","V",7, x, y). }
function T9WXYZ { T9bu4par("W","X","Y","Z",8, x, y). }

function T9ABCe  { set emptyprog[cuY] to T9bu3parE("A","B","C",1, emptyprog[cuY]). }
function T9DEFe  { set emptyprog[cuY] to T9bu3parE("D","E","F",2, emptyprog[cuY]). }
function T9GHIe  { set emptyprog[cuY] to T9bu3parE("G","H","I",3, emptyprog[cuY]). }
function T9JKLe  { set emptyprog[cuY] to T9bu3parE("J","K","L",4, emptyprog[cuY]). }
function T9MNOe  { set emptyprog[cuY] to T9bu3parE("M","N","O",5, emptyprog[cuY]). }
function T9PQRSe { set emptyprog[cuY] to T9bu4parE("P","Q","R","S",6, emptyprog[cuY]). }
function T9TUVe  { set emptyprog[cuY] to T9bu3parE("T","U","V",7, emptyprog[cuY]). }
function T9WXYZe { set emptyprog[cuY] to T9bu4parE("W","X","Y","Z",8, emptyprog[cuY]). }

function T9ABCl { T9bu3par("a","b","c",9, x, y). }
function T9DEFl { T9bu3par("d","e","f",10, x, y). }
function T9GHIl { T9bu3par("g","h","i",11, x, y). }
function T9JKLl { T9bu3par("j","k","l",12, x, y). }
function T9MNOl { T9bu3par("m","n","o",13, x, y). }
function T9PQRSl { T9bu4par("p","q","r","s",14, x, y). }
function T9TUVl { T9bu3par("t","u","v",15, x, y). }
function T9WXYZl { T9bu4par("w","x","y","z",16, x, y). }

function T9ABCle  {set emptyprog[cuY] to T9bu3parE("a","b","c",9, emptyprog[cuY]). }
function T9DEFle  {set emptyprog[cuY] to T9bu3parE("d","e","f",10, emptyprog[cuY]). }
function T9GHIle  {set emptyprog[cuY] to T9bu3parE("g","h","i",11, emptyprog[cuY]). }
function T9JKLle  {set emptyprog[cuY] to T9bu3parE("j","k","l",12, emptyprog[cuY]). }
function T9MNOle  {set emptyprog[cuY] to T9bu3parE("m","n","o",13, emptyprog[cuY]). }
function T9PQRSle {set emptyprog[cuY] to T9bu4parE("p","q","r","s",14, emptyprog[cuY]). }
function T9TUVle  {set emptyprog[cuY] to T9bu3parE("t","u","v",15, emptyprog[cuY]). }
function T9WXYZle {set emptyprog[cuY] to T9bu4parE("w","x","y","z",16, emptyprog[cuY]). }

function T9strE {
parameter stri.
	set emptyprog[CuY] to T9bu1parE(stri, emptyprog[Cuy]).
	set cux to cux + stri:length-1.
}

function T9strCurE {
parameter stri,offset.
	set emptyprog[CuY] to T9bu1parE(stri, emptyprog[Cuy]).
	set cux to cux + offset-1.
}

function T9space {T9bu1par(" ").}
function T9spaceE {
	set emptyprog[CuY] to T9bu1parE(" ", emptyprog[Cuy]).
}

function T9CancE {
	
	if cuX < emptyprog[cuY]:length {	
		set emptyprog[cuY] to T9cancelE(emptyprog[cuY]).
	} else {
		if cuy < emptyprog:length-1 {
			set emptyprog[cuY] to emptyprog[cuY] + emptyprog[cuY+1].
			emptyprog:remove(cuY+1).
			ClsNoCur().
			local cou to 0.
		
			for lin in emptyprog {
				print lin at(0,cou).
				set cou to cou + 1.
			}
		}
	}
}


function T9backsE {
	if cuX > 0 {	
		set emptyprog[cuY] to T9backspaceE(emptyprog[cuY]).
	} else {
		if cuy > 0 {
			set cux to emptyprog[cuY-1]:length.
			set emptyprog[cuY-1] to emptyprog[cuY-1] + emptyprog[cuY].
			emptyprog:remove(cuY).
			set cuy to cuy -1.
			ClsNoCur().
			local cou to 0.
		
			for lin in emptyprog {
				print lin at(0,cou).
				set cou to cou + 1.
			}
		}
	}
}

function InsertLineKST {
	
	local stri to emptyprog[cuy].
	set emptyprog[cuy] to stri:substring(0,cux).
		
	emptyprog:insert(cuy+1,stri:remove(0,cux)).
	set cux to 0.
	set cuy to cuy +1.
	
	ClsNoCur().
		local cou to 0.
		
		for lin in emptyprog {
			print lin at(0,cou).
			set cou to cou + 1.
		}	
}

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

function T91e {set emptyprog[cuY] to T9bu1parE("1", emptyprog[cuY]).}
function T92e {set emptyprog[cuY] to T9bu1parE("2", emptyprog[cuY]).}
function T93e {set emptyprog[cuY] to T9bu1parE("3", emptyprog[cuY]).}
function T94e {set emptyprog[cuY] to T9bu1parE("4", emptyprog[cuY]).}
function T95e {set emptyprog[cuY] to T9bu1parE("5", emptyprog[cuY]).}
function T96e {set emptyprog[cuY] to T9bu1parE("6", emptyprog[cuY]).}
function T97e {set emptyprog[cuY] to T9bu1parE("7", emptyprog[cuY]).}
function T98e {set emptyprog[cuY] to T9bu1parE("8", emptyprog[cuY]).}
function T99e {set emptyprog[cuY] to T9bu1parE("9", emptyprog[cuY]).}
function T90e {set emptyprog[cuY] to T9bu1parE("0", emptyprog[cuY]).}
function T9dotE {set emptyprog[cuY] to T9bu1par(".", emptyprog[cuY]).}
function T9minusE {set emptyprog[cuY] to T9bu1par("-", emptyprog[cuY]).}

function T9123 { T9bu3par("1","2","3",17, x, y). }
function T9456 { T9bu3par("4","5","6",18, x, y). }
function T9789 { T9bu3par("7","8","9",19, x, y). }
function T90signs { T9bu3par("0","+","-",20, x, y). }
function parentesi { T9bu4par("(",")","=","#",21, x, y). }

function T9123e { set emptyprog[cuY] to T9bu3parE("1","2","3",17, emptyprog[cuY]). }
function T9456e { set emptyprog[cuY] to T9bu3parE("4","5","6",18, emptyprog[cuY]). }
function T9789e { set emptyprog[cuY] to T9bu3parE("7","8","9",19, emptyprog[cuY]). }
function T90signsE { set emptyprog[cuY] to T9bu3parE("0","+","-",20, emptyprog[cuY]). }
function parentesiE { set emptyprog[cuY] to T9bu4parE("(",")","=","#",21, emptyprog[cuY]). }

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
function punct2 { T9bu4par(".",",","!","?",23, x, y). }
function punct3 { T9bu4par("-","+","&",".",24, x, y). } // filename allowed

function punct1e { set emptyprog[cuY] to T9bu4parE("-","/",":","'",22, emptyprog[cuY]). }
function punct2e { set emptyprog[cuY] to T9bu4parE(".",",","!","?",23, emptyprog[cuY]). }

// filename allowed
function punct3e { set emptyprog[cuY] to T9bu4parE("-","+","&",".",24, emptyprog[cuY]). }
function punct4e { set emptyprog[cuY] to T9bu4parE("""","*","^","$",24, emptyprog[cuY]). }
function punct5e { set emptyprog[cuY] to T9bu4parE("<",">","@","/",24, emptyprog[cuY]). }
