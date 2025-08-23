@lazyGlobal off.

global monlist to list().

global SettingsL to list().

// setting names list
global CFGnames to list(
	"Thickness of markers",
	"Data sampling time interval",	
	"Track sampling time interval",	
	"X resolution (40 or 80 characters)",
	"dual monitor anabled (0 or 1)",
	"number of the monitor on the right",
	"number of the monitor on the left"
	).

// Index                   Setting
//   0                     thickness of markers
//   1                     data sampling time interval
//   2                     track sampling time interval
//   3                     x resolution (40 or 80 characters)
//   4                     dual monitor anabled (0 or 1)
//   5                     number of the monitor on the right
//   6                     number of the monitor on the left



	
// concatenate names and vals (better a lexicon?)
function CFGnamesandvals {	     
	local lna to CFGnames.
	local lva to SettingsL.        // list input
	local lo to list().  // list output
	local cc to 0.
	FOR cs in lna {
		lo:add(cs+": "+lva[cc]).
		set cc to cc + 1.
	}
	return lo.
}

function riempiSettings {
	switch to 1.	
	if exists("settings.cfg"){
		set SettingsL TO READJSON("settings.cfg").
	} else {
		SettingsL:add(0.2). 
		SettingsL:add(2.0).
		SettingsL:add(5.0).
		SettingsL:add(80).
		SettingsL:add(0).
		SettingsL:add(-1).
		SettingsL:add(-1).
	}
	switch to 0.
}

function Savesettings{
	switch to 1.
	WRITEJSON(SettingsL, "settings.cfg").
	switch to 0.
	gopage(1).
}

function SetCFGElement{
	parameter inde.
	if inde = 0 {TypeRealNum(101,"Type marker thickness: ",0, true).}
	if inde = 1 {TypeRealNum(102,"Type DL interval (s): ",0, true).}
	if inde = 2 {TypeRealNum(103,"Type TRK interval (s): ",0, true).}
	if inde = 3 {TypeRealNum(104,"Type X resolution (40 or 80 characters): ",0, true).}
	if inde = 4 {TypeRealNum(105,"Type dual monitor anabled (0 or 1): ",0, true).}
	if inde = 5 {TypeRealNum(106,"Type number of the monitor on the right: ",0, true).}
	if inde = 6 {TypeRealNum(107,"Type number of the monitor on the left: ",0, true).}
}