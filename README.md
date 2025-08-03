# kOS-Computer - Version 1.1.0

kOS-Computer is a programmable flight management system (or guidance computer) designed to fully work with VR. But **you don't need VR** for this mod!

The mod is 100% KerboScript (maybe you remember _kOSHUD_ and _BakerOS_). This means it is completely rewritable. The code is meant to be understood, and I will slowly comment it out so it is as readable as possible. A lot of documentation will come.

The idea is that everyone can add features to the mod. Then, if someone wants to contribute, I will publish in the "official" mod the features that deserve it (quoting the authors, of course).

As June 2025 the mod has just been released in an embryonic state, many features will arrive, based on the wishes of the users.

### Dependencies:
* kOSPropMonitor-Adopted
* DE_IVAExtension
* Reviva

### Recommended:
* kOS for All!

## Installation
Copy the files in the KSP directory respecting file paths, as usual.

About the craft files you can copy them in "../saves/**[yoursave]**/Ships/SPH" or in "../saves/**[yoursave]**/Ships/VAB".

### If you need more detailed instructions:
* Find your KSP1 installation folder. Let's call it [KSP1Directory].
* Copy the folders in "\GameData\GameData\" to "[KSP1Directory]\GameData\"
* Copy files and folders in "\Ships\Script\KOSmodore" to "[KSP1Directory]\Ships\Script\KOSmodore"
  (If the folder doesn't exist, just create it)
* Copy the files in "\Ships\Script\boot" to "[KSP1Directory]\Ships\Script\boot"
  (If the folder doesn't exist, just create it)

If you want you can use the crafts of this mod:
* Copy the files in "\Craft\Ships\SPH" to "[KSP1Directory]\saves\[YourSaveDirectory]\Ships\SPH"
* Copy the files in "\Craft\Ships\VAB" to "[KSP1Directory]\saves\[YourSaveDirectory]\Ships\VAB"
## How to use the mod
You need a IVA with the Raster Prop Monitor (DE IVA is a good one). Until you understand how to do it you can simply load the ship "kos rover.craft". Check on the kOs processor that the boot file is set on "KOSmodore-BOOT.ks". When you are in game, pres "C" to go to IVA mode, then on a Raster Prop Monitor press three times the button "RESC.ST/TOT" on the top right. You will see the main page of the kos computer. You may need to restart your computer by double-pressing the "STDBY" key.
## Features
### Multitasking
You can execute more tasks at the same time. For example you can follow a track with a rover, log data and enter a logbook note at the same time.
### VR
This mod is fully usable with VR.
### Keyboard
You can enter text thanks to a T9 keyboard.
### Rover
You can set a destination and set an autopilot to that destination.
You can record a track and set an autopilot to reach it.
You can visualize markers for destinations and tracks.
You can edit the tracks adding and removing spots.
You can save to and load from file the tracks.
you can automatically deploy probes with a rover designed for the purpose.
### Logbook
Temporarily unavailable.
### Data logging
You can log data from the following data sources:
* Light exposition of the solar panels 
* Temperature outside the command module
* Pressure outside the command module
* Vessel mass
* Dynamic pressure (Q)
* Air speed (How fast the ship is moving relative to the air)
* Vertical Speed
* Ground Speed (horizontal speed)
* Latitude
* Longitude

You can select one or more data sources.
You can save to and load from file the data logs.
### Run user programs
You can load from file and run kerboscript programs in kOS-Computer.
### KSP-Basic integrated environment
You can write programs in IVA in a Kerbal-tailored Basic-like language, even in VR. You can write, execute, debug, save and load the programs using the kOSPropMonitor.
KSP-Basic can read files, activate Action Groups and much more.
