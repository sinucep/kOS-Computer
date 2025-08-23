@lazyglobal off.



global moniid to -1.

function doSomething {
    parameter a.
    parameter b.
    local x is a^2 + b.
    return x.
	
}

function stampa {
	clearscreen.
	print "VA!" at(10,10).
}

function stampal {
	parameter xid.
	set moniid to xid.
	
}



function Multikpm {
	clearscreen.
	print "Multi-monitor setting wizard".

	local timest to 0.
	//local id to addons:kpm:getguidshort(0).   // OR set id to addons:kpm:getguid(0).
	//local monindex to addons:kpm:getindexof(id). // If GETINDEXOF Returns -1, GUID Not Found. Works for Whole GUID and Short GUID
	
	FROM {local x is 0.} UNTIL x = monitors STEP {set x to x+1.} DO {
		
		ClearTerminal(x).
		mylabels:setlabel(1,"     "+x+"    ").
		
			print "probing monitor "+x+": press enter on the monitor you want to use".
			
			set timest to time:seconds.
			until time:seconds > timest +2.
			{
				set mybuttons:currentmonitor to x. 
				mybuttons:setdelegate(-1,stampal@:bind(x)).  //ENTER	
				
				
			}
			local mmid to addons:kpm:getguidshort(0). 
			print "guidshort: " + mmid.
			local monindex to addons:kpm:getindexof(mmid).
			print "indexboh: " + monindex.
			print "mid: " + moniid.
			if moniid <> -1 {Print"found: is this".}
	    
	
		
		
	}
}
