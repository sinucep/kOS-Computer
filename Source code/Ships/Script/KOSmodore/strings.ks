@lazyGlobal off.

function strLastWord {
	parameter stri.
	local strit to stri:trim.
	local sepa to " ".
	local xx to strit:FINDLAST(sepa).
	return strit:remove(0,xx+1).
}

function strLastWordBeforCur {
	parameter stri.
	parameter ccu.
	local retu to "". // something ignored by second processor
	
	local strit to stri:substring(0,ccu).
	if not strit:ENDSWITH(" "){
		
		local sepa to " ".
		local xx to strit:FINDLAST(sepa).
		set retu to strit:remove(0,xx+1).
	} 	
	return retu.
}