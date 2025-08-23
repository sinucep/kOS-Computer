@lazyglobal off.

run once "/KOSmodore/terminal.ks".
//global monnumR to -1. //number of the monitor on the right
//global monnumL to -1.


function checkmultimon {
	if (SettingsL[6] = -1) or (SettingsL[5] = -1) {GoPage(305).}
	else {
		local MESSAGE TO " dualedit".
		local P TO PROCESSOR("second").
		IF P:CONNECTION:SENDMESSAGE(MESSAGE) {
			PRINT "Message sent!".
		}
		GoPage(290).
		}
}

function SendMsg {
	parameter comma.
	local P TO PROCESSOR("second").
	P:CONNECTION:SENDMESSAGE(comma).
}

	

function showmonLR{
	print "Main monitor: " + SettingsL[5] at(0,3).
	print "Secondary monitor: " + SettingsL[6] at(0,4).
	
	ClearTerminal(SettingsL[5]).
	mylabels:setlabel(3,"[#FF7755][/hw]RIGHT[hw][#FFFFFF]").
	mybuttons:setdelegate(-2,GoPage@:bind(1)).  	
	
	ClearTerminal(SettingsL[6]).
	mylabels:setlabel(3," [#FF7755][/hw]LEFT[hw][#FFFFFF] ").
	mybuttons:setdelegate(-2,GoPage@:bind(1)).  	
}

function msgproc2{ // probablilmente da eliminare
	local all_processors to list().
	local message to "".
	
	LIST PROCESSORS IN ALL_PROCESSORS.
    PRINT ALL_PROCESSORS:length at(0,0).
	PRINT ALL_PROCESSORS[0]:name at(0,1).
	PRINT ALL_PROCESSORS[1]:NAME at(0,2).
	
	SET MESSAGE TO " dualedit".
	local P TO PROCESSOR("second").
	IF P:CONNECTION:SENDMESSAGE(MESSAGE) {
		PRINT "Message sent!".
	}
}
	


