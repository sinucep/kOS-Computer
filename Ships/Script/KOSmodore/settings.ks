@lazyGlobal off.

global SettingsL to list().

// Index                   Setting
//   0                     thickness of markers
//   1                     data sampling time interval
//   2                     track sampling time interval

function riempiSettings {
	
	SettingsL:add(0.2). 
	SettingsL:add(2.0).
	SettingsL:add(5.0).

}