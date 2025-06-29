run once "/KOSmodore/GPS.ks".
run once "/KOSmodore/keybT9.ks".
run once "/KOSmodore/main.ks".

function saveas {
	if (Npage = 52) or (Npage = 53) or (Npage = 54) {
		WRITEJSON(GPSPOS, "/KOSmodore/positions/" + linea + ".pos").
		set linea to "".
		DestinationsPAGE().
	}
	if (Npage = 33) or (Npage = 34) or (Npage = 35) {
		WRITEJSON(LoadedTrack, "/KOSmodore/tracks/" + linea + ".trk").
		set linea to "".
		TrackPAGE().
	}
	if (Npage = 83) or (Npage = 84) or (Npage = 85) {
		WRITEJSON(SensLog, "/KOSmodore/sampling/" + linea + ".dat").
		set linea to "".
		SamplePAGE().
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