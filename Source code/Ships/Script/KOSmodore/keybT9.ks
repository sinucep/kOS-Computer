@lazyGlobal off.

run once "/KOSmodore/texted.ks".
run once "/KOSmodore/strings.ks".

local tpress to 0.
local conta to 0.
local symset to 0.
local tastopreced to 0. //quando premo un tasto diverso il contatore deve 
						//azzerarsi e l'unico modo per saperlo e memorizzarlo
//global linea to "".    
//global editline to "".   // global linea da distruggere, sarà sostituito da editline

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
	//rename
	if NPage = 37 or NPage = 38 or NPage = 39 {
		if symset > 2 { set symset to 0. }
		if symset = 0 {	GoPage(37). }
		if symset = 1 {	GoPage(38).	}
		if symset = 2 {	GoPage(39).	}
	}
	if NPage = 57 or NPage = 58 or NPage = 59 {
		if symset > 2 { set symset to 0. }
		if symset = 0 {	GoPage(57). }
		if symset = 1 {	GoPage(58).	}
		if symset = 2 {	GoPage(59).	}
	}
	if NPage = 87 or NPage = 88 or NPage = 89 {
		if symset > 2 { set symset to 0. }
		if symset = 0 {	GoPage(87). }
		if symset = 1 {	GoPage(88).	}
		if symset = 2 {	GoPage(89).	}
	}
	if NPage = 187 or NPage = 188 or NPage = 189 {
		if symset > 2 { set symset to 0. }
		if symset = 0 {	GoPage(187). }
		if symset = 1 {	GoPage(188).	}
		if symset = 2 {	GoPage(189).	}
	}
	if NPage = 197 or NPage = 198 or NPage = 199 {
		if symset > 2 { set symset to 0. }
		if symset = 0 {	GoPage(197). }
		if symset = 1 {	GoPage(198).	}
		if symset = 2 {	GoPage(199).	}
	}
	if NPage = 227 or NPage = 228 or NPage = 229 {
		if symset > 2 { set symset to 0. }
		if symset = 0 {	GoPage(227). }
		if symset = 1 {	GoPage(228).	}
		if symset = 2 {	GoPage(229).	}
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
	if NPage = 253 or NPage = 254 or NPage = 255 {
		if symset > 2 { set symset to 0. }
		if symset = 0 {	GoPage(253). }
		if symset = 1 {	GoPage(254).	}
		if symset = 2 {	GoPage(255).	}
	}
	//if NPage = 263 or NPage = 264 or NPage = 265 {
	//	if symset > 2 { set symset to 0. }
	//	if symset = 0 {	GoPage(263). }
	//	if symset = 1 {	GoPage(264).	}
	//	if symset = 2 {	GoPage(265).	}
	//}
	if NPage = 237 or NPage = 238 or NPage = 239 or NPage = 240{
		if symset > 3 { set symset to 0. }
		if symset = 0 {	GoPage(237). }
		if symset = 1 {	GoPage(238).	}
		if symset = 2 {	GoPage(239).	}
		if symset = 3 {	GoPage(240).	}
	}
	if NPage = 290 or NPage = 291 or NPage = 292{
		if symset > 2 { set symset to 0. }
		if symset = 0 {	GoPage(290). }
		if symset = 1 {	GoPage(291).	}
		if symset = 2 {	GoPage(292).	}
	}
	if NPage = 277 or NPage = 278 or NPage = 279 or NPage = 280{
		if symset > 3 { set symset to 0. }
		if symset = 0 {	GoPage(277). }
		if symset = 1 {	GoPage(278).	}
		if symset = 2 {	GoPage(279).	}
		if symset = 3 {	GoPage(280).	}
	}
}

// send a message to the sec processor
function MesSec {
	parameter EdLine,Cux.
	if Npage = 290 or Npage = 291 or Npage = 292 {
		local MESSAGE TO strLastWordBeforCur(EdLine,Cux).
		local P TO PROCESSOR("second").
		P:CONNECTION:SENDMESSAGE(MESSAGE).
	}
}

function T9bu1parE {
	parameter sa, EdLine.
	
	set EdLine to EdLine:insert(cuX,sa).
	set CuX to Cux + 1.
	
	print EdLine at(hd:length,Cuy+offsy).
	
	
	
	MesSec(EdLine,Cux).
	
	return EdLine.
}

function T9backspaceE {         //back space
	parameter EdLine.
	if CuX > 0 {
		set CuX to Cux - 1.
		set EdLine to EdLine:remove(CuX, 1).
		print EdLine + "  " at(hd:length,Cuy+offsy). //duoble space for there is also the cursor to delete
	}
	return EdLine.
}

function T9cancelE {         //canc
	parameter EdLine.
	if EdLine:length-CuX > 0 {
		set EdLine to EdLine:remove(CuX, 1).
		print EdLine + " " at(0,Cuy+offsy).
	}
	return EdLine.
}


function T9bu2parE {
	parameter sa, sb, id, EdLine.
    
	if (tpress > TIME:SECONDS - 0.6) {
		if not (tastopreced = id) {set conta to 0.}		
	}
	else {		
		set conta to 0.
	}
	set tastopreced to id.
	if (tpress > TIME:SECONDS - 0.6) and (conta = 2) {
		set conta to 0.
		set cux to cux - 1.
			set EdLine to EdLine:remove(cuX, 1).
	}
	if (tpress > TIME:SECONDS - 0.6) and (conta = 1) {
		set conta to conta + 1.
		set cux to cux - 1.
			set EdLine to EdLine:remove(cuX, 1).
			set EdLine to EdLine:insert(cuX, sb).
		set cux to cux + 1.
		print EdLine at(0,cuy+offsy).
	}
	if (conta = 0) {
			set EdLine to EdLine:insert(cuX,sa).
		set cux to cux + 1.
		set conta to conta + 1.
		print EdLine at(0,cuy+offsy).
	}
	set tpress to TIME:SECONDS.
	return EdLine.
}

function EndHome {
	parameter id.
    
	if (tpress > TIME:SECONDS - 0.6) {
		if not (tastopreced = id) {set conta to 0.}		
	}
	else {set conta to 0.}
	set tastopreced to id.
	if (tpress > TIME:SECONDS - 0.6) and (conta = 2) {set conta to 0.}
	if (tpress > TIME:SECONDS - 0.6) and (conta = 1) {
		set conta to conta + 1.
		cuHome().
	}
	if (conta = 0) {
		set conta to conta + 1.
		cuend().
	}
	set tpress to TIME:SECONDS.
	MesSec(emptyprog[Cuy],Cux).
}

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
		print EdLine at(0,cuy+offsy).
	}
	if (tpress > TIME:SECONDS - 0.6) and (conta = 1) {
		set conta to conta + 1.
		set cux to cux - 1.
			set EdLine to EdLine:remove(cuX, 1).
			set EdLine to EdLine:insert(cuX, sb).
		set cux to cux + 1.
		print EdLine at(0,cuy+offsy).
	}
	if (conta = 0) {
			set EdLine to EdLine:insert(cuX,sa).
		set cux to cux + 1.
		set conta to conta + 1.
		print EdLine at(0,cuy+offsy).
	}
	set tpress to TIME:SECONDS.
	return EdLine.
}

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
		print EdLine at(0,cuy+offsy).
	}
	
	if (tpress > TIME:SECONDS - 0.6) and (conta = 2) {
		set conta to conta + 1.
		set cux to cux - 1.
			set EdLine to EdLine:remove(cuX, 1).
			set EdLine to EdLine:insert(cuX, sc).
		set cux to cux + 1.
		print EdLine at(0,cuy+offsy).
	}
	
	if (tpress > TIME:SECONDS - 0.6) and (conta = 1) {
		set conta to conta + 1.
		set cux to cux - 1.
			set EdLine to EdLine:remove(cuX, 1).
			set EdLine to EdLine:insert(cuX, sb).
		set cux to cux + 1.
		print EdLine at(0,cuy+offsy).
	}
	if (conta = 0) {
			set EdLine to EdLine:insert(cuX,sa).
		set cux to cux + 1.
		set conta to conta + 1.
		print EdLine at(0,cuy+offsy).
	}
	set tpress to TIME:SECONDS.
	return EdLine.
}

function T9ABCe  { set emptyprog[cuY] to T9bu3parE("A","B","C",1, emptyprog[cuY]). }
function T9DEFe  { set emptyprog[cuY] to T9bu3parE("D","E","F",2, emptyprog[cuY]). }
function T9GHIe  { set emptyprog[cuY] to T9bu3parE("G","H","I",3, emptyprog[cuY]). }
function T9JKLe  { set emptyprog[cuY] to T9bu3parE("J","K","L",4, emptyprog[cuY]). }
function T9MNOe  { set emptyprog[cuY] to T9bu3parE("M","N","O",5, emptyprog[cuY]). }
function T9PQRSe { set emptyprog[cuY] to T9bu4parE("P","Q","R","S",6, emptyprog[cuY]). }
function T9TUVe  { set emptyprog[cuY] to T9bu3parE("T","U","V",7, emptyprog[cuY]). }
function T9WXYZe { set emptyprog[cuY] to T9bu4parE("W","X","Y","Z",8, emptyprog[cuY]). }

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

function T9spaceE {set emptyprog[CuY] to T9bu1parE(" ", emptyprog[Cuy]).}

function tyA {set emptyprog[CuY] to T9bu1parE("A", emptyprog[Cuy]).}
function tyB {set emptyprog[CuY] to T9bu1parE("B", emptyprog[Cuy]).}
function tyC {set emptyprog[CuY] to T9bu1parE("C", emptyprog[Cuy]).}
function tyD {set emptyprog[CuY] to T9bu1parE("D", emptyprog[Cuy]).}
function tyE {set emptyprog[CuY] to T9bu1parE("E", emptyprog[Cuy]).}
function tyF {set emptyprog[CuY] to T9bu1parE("F", emptyprog[Cuy]).}
function tyG {set emptyprog[CuY] to T9bu1parE("G", emptyprog[Cuy]).}
function tyH {set emptyprog[CuY] to T9bu1parE("H", emptyprog[Cuy]).}
function tyI {set emptyprog[CuY] to T9bu1parE("I", emptyprog[Cuy]).}
function tyJ {set emptyprog[CuY] to T9bu1parE("J", emptyprog[Cuy]).}
function tyK {set emptyprog[CuY] to T9bu1parE("K", emptyprog[Cuy]).}
function tyL {set emptyprog[CuY] to T9bu1parE("L", emptyprog[Cuy]).}
function tyM {set emptyprog[CuY] to T9bu1parE("M", emptyprog[Cuy]).}
function tyN {set emptyprog[CuY] to T9bu1parE("N", emptyprog[Cuy]).}
function tyO {set emptyprog[CuY] to T9bu1parE("O", emptyprog[Cuy]).}
function tyP {set emptyprog[CuY] to T9bu1parE("P", emptyprog[Cuy]).}
function tyQ {set emptyprog[CuY] to T9bu1parE("Q", emptyprog[Cuy]).}
function tyR {set emptyprog[CuY] to T9bu1parE("R", emptyprog[Cuy]).}
function tyS {set emptyprog[CuY] to T9bu1parE("S", emptyprog[Cuy]).}
function tyT {set emptyprog[CuY] to T9bu1parE("T", emptyprog[Cuy]).}
function tyU {set emptyprog[CuY] to T9bu1parE("U", emptyprog[Cuy]).}
function tyV {set emptyprog[CuY] to T9bu1parE("V", emptyprog[Cuy]).}
function tyW {set emptyprog[CuY] to T9bu1parE("W", emptyprog[Cuy]).}
function tyX {set emptyprog[CuY] to T9bu1parE("X", emptyprog[Cuy]).}
function tyY {set emptyprog[CuY] to T9bu1parE("Y", emptyprog[Cuy]).}
function tyZ {set emptyprog[CuY] to T9bu1parE("Z", emptyprog[Cuy]).}

function tyal {set emptyprog[CuY] to T9bu1parE("a", emptyprog[Cuy]).}
function tybl {set emptyprog[CuY] to T9bu1parE("b", emptyprog[Cuy]).}
function tycl {set emptyprog[CuY] to T9bu1parE("c", emptyprog[Cuy]).}
function tydl {set emptyprog[CuY] to T9bu1parE("d", emptyprog[Cuy]).}
function tyel {set emptyprog[CuY] to T9bu1parE("e", emptyprog[Cuy]).}
function tyfl {set emptyprog[CuY] to T9bu1parE("f", emptyprog[Cuy]).}
function tygl {set emptyprog[CuY] to T9bu1parE("g", emptyprog[Cuy]).}
function tyhl {set emptyprog[CuY] to T9bu1parE("h", emptyprog[Cuy]).}
function tyil {set emptyprog[CuY] to T9bu1parE("i", emptyprog[Cuy]).}
function tyjl {set emptyprog[CuY] to T9bu1parE("j", emptyprog[Cuy]).}
function tykl {set emptyprog[CuY] to T9bu1parE("k", emptyprog[Cuy]).}
function tyll {set emptyprog[CuY] to T9bu1parE("l", emptyprog[Cuy]).}
function tyml {set emptyprog[CuY] to T9bu1parE("m", emptyprog[Cuy]).}
function tynl {set emptyprog[CuY] to T9bu1parE("n", emptyprog[Cuy]).}
function tyol {set emptyprog[CuY] to T9bu1parE("o", emptyprog[Cuy]).}
function typl {set emptyprog[CuY] to T9bu1parE("p", emptyprog[Cuy]).}
function tyql {set emptyprog[CuY] to T9bu1parE("q", emptyprog[Cuy]).}
function tyrl {set emptyprog[CuY] to T9bu1parE("r", emptyprog[Cuy]).}
function tysl {set emptyprog[CuY] to T9bu1parE("s", emptyprog[Cuy]).}
function tytl {set emptyprog[CuY] to T9bu1parE("t", emptyprog[Cuy]).}
function tyul {set emptyprog[CuY] to T9bu1parE("u", emptyprog[Cuy]).}
function tyvl {set emptyprog[CuY] to T9bu1parE("v", emptyprog[Cuy]).}
function tywl {set emptyprog[CuY] to T9bu1parE("w", emptyprog[Cuy]).}
function tyxl {set emptyprog[CuY] to T9bu1parE("x", emptyprog[Cuy]).}
function tyyl {set emptyprog[CuY] to T9bu1parE("y", emptyprog[Cuy]).}
function tyzl {set emptyprog[CuY] to T9bu1parE("z", emptyprog[Cuy]).}

function ty1 {set emptyprog[CuY] to T9bu1parE("1", emptyprog[Cuy]).}
function ty2 {set emptyprog[CuY] to T9bu1parE("2", emptyprog[Cuy]).}
function ty3 {set emptyprog[CuY] to T9bu1parE("3", emptyprog[Cuy]).}
function ty4 {set emptyprog[CuY] to T9bu1parE("4", emptyprog[Cuy]).}
function ty5 {set emptyprog[CuY] to T9bu1parE("5", emptyprog[Cuy]).}
function ty6 {set emptyprog[CuY] to T9bu1parE("6", emptyprog[Cuy]).}
function ty7 {set emptyprog[CuY] to T9bu1parE("7", emptyprog[Cuy]).}
function ty8 {set emptyprog[CuY] to T9bu1parE("8", emptyprog[Cuy]).}
function ty9 {set emptyprog[CuY] to T9bu1parE("9", emptyprog[Cuy]).}
function ty0 {set emptyprog[CuY] to T9bu1parE("0", emptyprog[Cuy]).}

function tyAB { set emptyprog[cuY] to T9bu2parE("A","B",97, emptyprog[cuY]). }




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
				print hd + lin at(0,cou).
				set cou to cou + 1.
			}
		}
	}
	MesSec(emptyprog[cuY],Cux).
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
			print hd + lin at(0,cou).
			set cou to cou + 1.
		}
//MesSec(emptyprog[Cuy],Cux).		
sendmsg("").
}

//da sostituire con ty...
function T91e {set emptyprog[cuY] to T9bu1parE("1", emptyprog[cuY]).}
function T92e {set emptyprog[cuY] to T9bu1parE("2", emptyprog[cuY]).}
function T93e {set emptyprog[cuY] to T9bu1parE("3", emptyprog[cuY]).}
function T94e {set emptyprog[cuY] to T9bu1parE("4", emptyprog[cuY]).}
function T95e {set emptyprog[cuY] to T9bu1parE("5", emptyprog[cuY]).}
function T96e {set emptyprog[cuY] to T9bu1parE("6", emptyprog[cuY]).}
function T97e {set emptyprog[cuY] to T9bu1parE("7", emptyprog[cuY]).}
function T98e {set emptyprog[cuY] to T9bu1parE("8", emptyprog[cuY]).}
function T99e {set emptyprog[cuY] to T9bu1parE("9", emptyprog[cuY]).}
function T90e   {set emptyprog[cuY] to T9bu1parE("0", emptyprog[cuY]).}
function T9dotE {set emptyprog[cuY] to T9bu1parE(".", emptyprog[cuY]).}
function T9minusE {set emptyprog[cuY] to T9bu1parE("-", emptyprog[cuY]).}

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

function punct1e { set emptyprog[cuY] to T9bu4parE("-","/",":","'",22, emptyprog[cuY]). }
function punct2e { set emptyprog[cuY] to T9bu4parE(".",",","!","?",23, emptyprog[cuY]).}

// filename alloweD
function punct3e { set emptyprog[cuY] to T9bu4parE("-","+","&",".",24, emptyprog[cuY]).}
function punct4e { set emptyprog[cuY] to T9bu4parE("""","*","^","$",25, emptyprog[cuY]). }
function punct5e { set emptyprog[cuY] to T9bu4parE("<",">","@","/",26, emptyprog[cuY]). }

function addhint {
	parameter hint, curx.
	set emptyprog[cuY] to  emptyprog[cuY]:INSERT(Cux, hint).
	print hd + emptyprog[cuY] at(0,Cuy+offsy).
	//set cux to cux + (curx:tonumber).
	set cux to cux + (hint:length).
}