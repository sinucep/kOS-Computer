# kOS-Computer file types
It is important to know that **kOS can not read text files** (even if it can create them). This is where the [ **.kst** ] type comes in. It's a JSON file with text lines serialized according to kOS rules.
There are various types of files that kOS can read and/or create:
* [ **.ks** ] - KerbolScript
* [ **.bas** ] - KSP-Basic
* [ **.pos** ] - Position
* [ **.trk** ] - Track
* [ **.dat** ] - Data log
* [ **.kst** ] - kOS serialized text
* [ **.json** ] - Logbook

## KerboScritp
[ **.ks** ]

It is a text file, the same type produced and read by kOS
## kOS serialized text
[ **.kst** ]

It's a JSON file with text lines serialized according to kOS rules. 
## Logbook
[ **.json** ]

It is where the logbook is saved. It is a serialized list of lists of strings (a list of pages).
## Data log
[ **.dat** ]

It is a serialized list of lists of numbers. The first record is a header with the source codes relative the following records. The codes are:
* **0**   - time
* **1**   - light exposition of the solar panels 
* **2**   - temperature outside the command module
* **3**   - pressure outside the command module
* **4**   - mass
* **10**  - dynamic pressure (Q)
* **20**  - air speed (How fast the ship is moving relative to the air)
* **21**  - vertical Speed
* **22**  - ground Speed (horizontal speed)
* **101** - latitude
* **102** - longitude

## Track
[ **.trk** ]

It is a special case of data log with only three sources:
* **0**   - time
* **101** - latitude
* **102** - longitude
