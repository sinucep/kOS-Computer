SET V0 TO GETVOICE(0). // Gets a reference to the zero-th voice in the chip.
SET V1 TO GETVOICE(1).
//V0:PLAY( NOTE(400, 2.5) ).  // Starts a note at 400 Hz for 2.5 seconds.
//V1:PLAY( NOTE(470, 5) ).  // Starts a note at 400 Hz for 2.5 seconds.

V0:PLAY(
    LIST(
        NOTE("C3", 0.2),
        NOTE("A4",  0.2),
        NOTE("R",   0.2),
        SLIDENOTE("C5", "F5", 0.45),
        NOTE("R",   0.2) 
		)
    ).
	
V1:PLAY(
    LIST(
        NOTE("E#4", 0.2),
        NOTE("F4",  0.2),
        NOTE("G",   0.2),
        SLIDENOTE("G5", "F5", 0.45),
        NOTE("C2",   0.2) 
		)
    ).