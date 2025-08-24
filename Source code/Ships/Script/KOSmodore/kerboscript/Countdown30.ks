clearscreen.
print "Countdown:".
FROM {local x is 30.} UNTIL x = 0 STEP {set x to x-1.} DO {
			wait(1).
			print "-" + x + "   " at (0,0).
		}
