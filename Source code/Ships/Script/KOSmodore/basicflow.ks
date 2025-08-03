@lazyglobal off.

run once "/KOSmodore/rover.ks".

// per il LOCATE x,y e il PRINT
local lx to 0.
local ly to 0.

//line execution counter (address)
local co to -1. //so it starts from 0. tsk!

//cumulative counter (to create the .ks file names)
local cco to -1. //so it starts from 0. tsk!

//line numbers
local linumbers to list(). 

//"back to basic" case
global backtobascase to 0.

//for the control transfer
global freezebas to false.

//debug window on the right if true
global debugbas to false.

//for the debug windows refreshing time
global debugbasstart to 0.

global exodos to false.

function basAbort {
	set exodos to true.
}

function debugToggle{
	parameter x.
	set debugbas to not debugbas.
	
	set mylabels:currentmonitor to x.
	
	if debugbas {mylabels:setlabel(4, " Debug On ").}
	else {mylabels:setlabel(4, " Debug Off").}
	
	if Npage = 220{
		ClsNoCur().
		local cou to 0.
		
		for lin in emptyprog {
			print lin at(0,cou).
			set cou to cou + 1.
		}
	}
}

function debugwin{
	print "[#6F6F00]|t: "+round(debugbasstart,1)+" " at(54,0).
	print "[#6F6F00]|Line: "+co+"  " at(54,1).
	print "[#6F6F00]|Freeze: "+freezebas+"  " at(54,2).
	print "[#6F6F00]|Exit: "+exodos+"  " at(54,3).
	
}

function resetbasicstate {
	set lx to 0.
	set ly to 0.
	set	co to 0.
    linumbers:clear.
	set exodos to false.
}

function reclinumbers {
	parameter progr.
	local cou to 0.
	local sepi to 0.
	local linu to 0.	
	
		//clearscreen.
		for l in progr {
			set sepi to l:FIND(" ").
	        if sepi > -1 {
				set linu to l:REMOVE(sepi,(l:length-sepi)):tonumber(-1).
				if linu > -1 {
					linumbers:add(list()).
					linumbers[linumbers:length-1]:add(linu).
					linumbers[linumbers:length-1]:add(cou).
				}
				//print "-" + linu + "-" at(0,cou).
			}
			set cou to cou + 1.
		}
	//print linumbers.
	
}

function removelinumber {
	parameter li.
	local sepi to li:FIND(" ").
	local linu to 0.
	if sepi > -1 {
		set linu to li:REMOVE(sepi,(li:length-sepi)):tonumber(-1).
		if linu > -1 {
			set li to li:REMOVE(0,sepi+1).
		}
	}
	return li.
}

//return the position of the numbered line
function posline {
	
	parameter nu.
	//local co to 0.
	local re to 0.
	for s in linumbers {
	 //print "l:" + linumbers:length at (14,co+6).
	 //print "co:" + co at (14,co+7).
	 //print s[0] at (14,co+8).
	 //set co to co + 1.
		if s[0] = nu {
			set re to s[1].
		} else {
			set re to -1.
		}
	}
	return re.
}

function coCLS {
	parameter li.
	if li:trim:toupper = "CLS" {
		if Npage = 230{ClsNoCur().}
		set lx to 0.
		set ly to 0.
	}
}

function coPRINT {
	parameter li, co.
	local l to li:trim:toupper.
	
	local sepi to l:FIND(" ").
	if sepi > -1 {
		
		if (l:REMOVE(sepi,(l:length-sepi)) = "PRINT") or 
		   (l:REMOVE(sepi,(l:length-sepi)) = "?") {
			//misteriosamente se uso sempre lo stesso nome per il file runpath
			//esegue sempre il primo che ha eseguito. per cui metto nomi diversi 	
			if Npage = 230{
				log "PRINT " + l:REMOVE(0,sepi+1) + " at(" + lx + "," + ly +")." to "print" + cco + ".ks".
				RUNPATH("print" + cco + ".ks").
				DELETEPATH("print" + cco + ".ks").
			}
			set lx to 0.
			set ly to ly + 1.
		}
	}
}

function coWAIT {
	parameter li, co.
	local l to li:trim:toupper.
	
	local sepi to l:FIND(" ").
	if sepi > -1 {
		
		if (l:REMOVE(sepi,(l:length-sepi)) = "WAIT") or 
		   (l:REMOVE(sepi,(l:length-sepi)) = "W") {
			//misteriosamente se uso sempre lo stesso nome per il file runpath
			//esegue sempre il primo che ha eseguito. per cui metto nomi diversi 	
			log "WAIT " + l:REMOVE(0,sepi+1)+"." to "wait" + cco + ".ks".
			RUNPATH("wait" + cco + ".ks").
			DELETEPATH("wait" + cco + ".ks").
		}
	}
}

function coSD {
	parameter li.
	local l to li:trim:toupper.
	
	local sepi to l:FIND(" ").
	//local lat to 0.
	//local lon to 0.
	local wholeline to li.
	local command to "".
	local parameters to "".
	local par1 to "".
	local par2 to "".
	
	if sepi > -1 {
		set command to l:REMOVE(sepi,(l:length-sepi)).
		if command = "SD" {
			set l to wholeline.
			set parameters to l:REMOVE(0,sepi+1).
			set l to parameters.
			set sepi to l:FIND(" ").
			set par1 to l:substring(0,sepi).
			set l to parameters.
			set par2 to l:REMOVE(0,sepi+1).
		   
		    GPSPOS:clear.
			GPSPOS:add(par1:tonumber(-9999)).
			GPSPOS:add(par2:tonumber(-9999)).
		}
	}
}

function coLOCATE {
	parameter li.
	local l to li:trim:toupper.
	
	local sepi to l:FIND(" ").
	local wholeline to li.
	local command to "".
	local parameters to "".
	local par1 to "".
	local par2 to "".
	
	if sepi > -1 {
		set command to l:REMOVE(sepi,(l:length-sepi)).
		if command = "LOCATE" {
			set l to wholeline.
			set parameters to l:REMOVE(0,sepi+1).
			set l to parameters.
			set sepi to l:FIND(" ").
			set par1 to l:substring(0,sepi).
			set l to parameters.
			set par2 to l:REMOVE(0,sepi+1).
		   	    
			set lx to par1:tonumber(-1).
			set ly to par2:tonumber(-1).
			
			//print "p1:" + par1.
			//print "p2:" + par2.
		}
	}
}

function coSDF {
	parameter li.
	local l to li:trim:toupper.
	
	local sepi to l:FIND(" ").
	local wholeline to li.
	local command to "".
	local param to "".
	
	if sepi > -1 {
		set command to l:REMOVE(sepi,(l:length-sepi)).
		if command = "SDF" {
			set l to wholeline.
			set param to l:REMOVE(0,sepi+1).   
		    set GPSPOS TO READJSON("/KOSmodore/positions/" + param + ".pos").
		}
	}
}

function isGOTO {  //is a goto?
	parameter li.
	local l to li:trim:toupper.
	
	local sepi to l:FIND(" ").
	local itis to false.
	if sepi > -1 {
		if (l:REMOVE(sepi,(l:length-sepi)) = "GOTO") {
			set itis to true.
		}
	}
	return itis.
}

function coGOTO {
	parameter li.
	local l to li:trim:toupper.
	
	local sepi to l:FIND(" ").
	if sepi > -1 {
		
		if (l:REMOVE(sepi,(l:length-sepi)) = "GOTO") {
			
			local numto to l:REMOVE(0,sepi+1):tonumber(-1).
			//print "l:" + co  at(8,11).
			//print "g:" + numto at(8,12).
			//print "p:" + (posline(numto))-1 at(8,13).
			set co to (posline(numto)-1). // for it will increased, tsk!
		}
	}
}

function coAG {
	parameter li.
	if li:trim:toupper = "AG1" {toggle AG1.}
	if li:trim:toupper = "AG2" {toggle AG2.}
	if li:trim:toupper = "AG3" {toggle AG3.}
	if li:trim:toupper = "AG4" {toggle AG4.}
	if li:trim:toupper = "AG5" {toggle AG5.}
	if li:trim:toupper = "AG6" {toggle AG6.}
	if li:trim:toupper = "AG7" {toggle AG7.}
	if li:trim:toupper = "AG8" {toggle AG8.}
	if li:trim:toupper = "AG9" {toggle AG9.}
	if li:trim:toupper = "AG10" {toggle AG10.}
}

function coRD {
	parameter li.
	if li:trim:toupper = "RD" {
		goroverpos().
	}
}

function coWR {
	parameter li.
	if li:trim:toupper = "WR" {
		set exodos to true.
		set backtobascase to 1.
		set freezebas to true.
	}
}




function coEND {
	parameter li.
	local exo to false.
	if li:trim:toupper = "END" {
		set exo to true.
	}
	return exo.
}

function runlinebas {
	parameter pro.
	
	if not exodos {
		local LiNoN to "". //line without number
		
			
		//print co + ": " + prog[co] at(0,co+4).	
	
		set co to co + 1.
		set cco to cco + 1.
		
		set LiNoN to removelinumber(pro[co]).
		
		coCLS(LiNoN).
		coPRINT(LiNoN,co).  
		coWAIT(LiNoN,co).
		coGOTO(LiNoN).
		coSD(LiNoN).
		coSDF(LiNoN).
		coRD(LiNoN).
		coAG(LiNoN).
		coWR(LiNoN).
		coLOCATE(LiNoN).
		
		if coEND(removelinumber(pro[co])) {
			set exodos to true.
		}
		
		if (co+1 > pro:length-1) {
			set exodos to true.						
		}
		
		//print "co:" + co at(11,11).
		//if (co > prog:length-1) {set exodos to true.}
		
		
	}

}

function runbasic {
	parameter prog.
	
	reclinumbers(prog).
	
	until exodos {
		runlinebas(prog).
	}
	
	if not freezebas {resetbasicstate().}
	
}