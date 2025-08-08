run once "/KOSmodore/GPS.ks".
run once "/KOSmodore/keybT9.ks".
run once "/KOSmodore/main.ks".
run once "/KOSmodore/runKS.ks".
run once "/KOSmodore/texted.ks".

function saveas {
	if (Npage = 52) or (Npage = 53) or (Npage = 54) {
		WRITEJSON(GPSPOS, "/KOSmodore/positions/" + EmptyProg[0] + ".pos").
		GoPage(50).
	}
	if (Npage = 33) or (Npage = 34) or (Npage = 35) {
		WRITEJSON(LoadedTrack, "/KOSmodore/tracks/" + EmptyProg[0] + ".trk").
		GoPage(30).
	}
	if (Npage = 83) or (Npage = 84) or (Npage = 85) {
		WRITEJSON(SensLog, "/KOSmodore/sampling/" + EmptyProg[0] + ".dat").
		GoPage(70).
	}
	if (Npage = 207) or (Npage = 208) or (Npage = 209) {
		local fname to EmptyProg[0].
		set EmptyProg to STextAux:copy.
		STextAux:clear.
		if exists("/KOSmodore/kerboscript/" + fname + ".ks") {
		deletepath("/KOSmodore/kerboscript/" + fname + ".ks").
		}
		for lin in emptyprog {
			LOG lin to "/KOSmodore/kerboscript/" + fname + ".ks".
		}
		GoPage(218).
	}
	if (Npage = 243) or (Npage = 244) or (Npage = 245) {
		local fname to EmptyProg[0].
		set EmptyProg to STextAux:copy.
		STextAux:clear.
		WRITEJSON(EmptyProg, "/KOSmodore/ksp-basic/" + fname + ".sbas").
		GoPage(220).
	}
	if (Npage = 253) or (Npage = 254) or (Npage = 255) {
		local fname to EmptyProg[0].
		set EmptyProg to STextAux:copy.
		STextAux:clear.
		WRITEJSON(EmptyProg, "/KOSmodore/sks/" + fname + ".sks").
		GoPage(218).
	}
}

function delfilelist {
	if Npage = 51 {
		deletepath ("/KOSmodore/positions/" + li[lind]).
		gopage(51).
	}
	if Npage = 31 {
		deletepath ("/KOSmodore/tracks/"+ li[lind]).
		gopage(31).
	}
	if Npage = 71 {
		deletepath ("/KOSmodore/sampling/" + li[lind]).
		gopage(71).
	}
	if Npage = 201 {
		deletepath ("/KOSmodore/kerboscript/" + li[lind]).
		gopage(201).
	}
	if Npage = 205 {
		deletepath ("/KOSmodore/sks/" + li[lind]).
		gopage(205).
	}
	if Npage = 221 {
		deletepath ("/KOSmodore/ksp-basic/" + li[lind]).
		gopage(221).
	}
}
// SAVE SENSORS LOG
//function button08Press {
//clearscreen.
//WRITEJSON(SensLog, "/KOSmodore/senslog.json").
//
//DELETEPATH("/KOSmodore/senslog.txt").
//FOR S IN SensLog {
//		FOR SS IN S {
//			LOG SS to "/KOSmodore/senslog.txt".
//		}		
//		LOG "" to "/KOSmodore/senslog.txt".
//	}
//
//print "Saved to " + PATH() + "/KOSmodore/senslog.json".
//print "Saved to " + PATH() + "/KOSmodore/senslog.txt".
//
//}