run once "/KOSmodore/GPS.ks".
run once "/KOSmodore/keybT9.ks".
run once "/KOSmodore/main.ks".
run once "/KOSmodore/runKS.ks".
run once "/KOSmodore/texted.ks".

function saveas {
	if (Npage = 52) or (Npage = 53) or (Npage = 54) {
		WRITEJSON(GPSPOS, "/KOSmodore/positions/" + linea + ".pos").
		set linea to "".
		GoPage(50).
	}
	if (Npage = 33) or (Npage = 34) or (Npage = 35) {
		WRITEJSON(LoadedTrack, "/KOSmodore/tracks/" + linea + ".trk").
		set linea to "".
		GoPage(30).
	}
	if (Npage = 83) or (Npage = 84) or (Npage = 85) {
		WRITEJSON(SensLog, "/KOSmodore/sampling/" + linea + ".dat").
		set linea to "".
		GoPage(70).
	}
	if (Npage = 207) or (Npage = 208) or (Npage = 209) {
		
		if exists("/KOSmodore/kerboscript/" + linea + ".ks") {
		deletepath("/KOSmodore/kerboscript/" + linea + ".ks").
		}
		for lin in emptyprog {
			LOG lin to "/KOSmodore/kerboscript/" + linea + ".ks".
		}
		set linea to "".
		GoPage(218).
	}
	if (Npage = 243) or (Npage = 244) or (Npage = 245) {
		WRITEJSON(EmptyProg, "/KOSmodore/ksp-basic/" + linea + ".sbas").
		set linea to "".
		GoPage(220).
	}
	if (Npage = 253) or (Npage = 254) or (Npage = 255) {
		WRITEJSON(EmptyProg, "/KOSmodore/sks/" + linea + ".sks").
		set linea to "".
		GoPage(218).
	}
	if (Npage = 263) or (Npage = 264) or (Npage = 265) {
		WRITEJSON(preprocprog, "/KOSmodore/ksp-basic/" + linea + ".sbas").
		set linea to "".
		GoPage(222).
	}
}

// SAVE SENSORS LOG
function button08Press {
clearscreen.
WRITEJSON(SensLog, "/KOSmodore/senslog.json").

DELETEPATH("/KOSmodore/senslog.txt").
FOR S IN SensLog {
		FOR SS IN S {
			LOG SS to "/KOSmodore/senslog.txt".
		}		
		LOG "" to "/KOSmodore/senslog.txt".
	}

print "Saved to " + PATH() + "/KOSmodore/senslog.json".
print "Saved to " + PATH() + "/KOSmodore/senslog.txt".

}