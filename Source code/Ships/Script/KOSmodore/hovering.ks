@lazyglobal off.

function hovertest{	RUNPATH("/KOSmodore/kerboscript/h2.ks").}

function hovertest2 {
	print "kkkkkkkkkkkkkkk"at(10,10).
	sas off.
	local targvel is 0.
	lock steering to up.
	local throttlePID to PIDLoop(1.02, 10.3, 0.03, 0, 1).
	set throttlePID:setpoint to targvel.
	local wanted_throttle to 1.
	lock throttle to wanted_throttle.
	stage.
	wait until alt:radar >= 10.
	local now to time:seconds.

	until time:seconds >= now + 10 {
	  set wanted_throttle to throttlePID:UPDATE(time:seconds, ship:verticalspeed).
	}
	set throttlePID:SETPOINT to -2.
	until ship:status = "landed" {
	  set wanted_throttle to throttlePID:UPDATE(time:seconds, ship:verticalspeed).
	}
	wait 0.
	set ship:control:pilotmainthrottle to 0.
	unlock throttle.
 }