//----------------------------------------------|
//                                              |
//  kOS-Computer 64 - by Sinucep                |
//                                              |
//----------------------------------------------|

//wait until ship:status <> "prelaunch" or ship:unpacked.
wait until ship:unpacked.

//if exists("/KOSmodore/temp/donotreboot2.txt"){
//	deletepath("/KOSmodore/temp/donotreboot2.txt").
//	} else {
//		print "Reboot in 5 seconds...".
//		wait(5).
//		WRITEJSON("donotreboot", "/KOSmodore/temp/donotreboot2.txt").
//		reboot.
//	}


switch to 0.


//print "Second processor ready.".
//print "List of processors:".
//LIST processors IN myVariable.
//FOR kpro IN myVariable {
//    print "Tag = " + kpro:tag.
//}

RUNPATH( "/KOSmodore/proc2/edit2.ks").


