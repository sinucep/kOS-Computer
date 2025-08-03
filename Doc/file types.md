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

It is a text file, the same type produced and read by kOS. You can export it from a **.sks** file.

## Serialized KerboScritp
[ **.sks** ]

It is a kerboscript, but serialized so that kOS can read it.
## KSP-Basic program
[ **.bas** ]

It is a text file with a KSP-Basic program. You can export it from a **.sbas** file.

## Serialized KSP-Basic program
[ **.sbas** ]

It is a KSP-Basic program, but serialized so that kOS can read it.

## kOS serialized text
[ **.kst** ]

It's a JSON file with text lines serialized according to kOS rules. 
## Logbook
[ **.json** ]

It is where the logbook is saved. It is a serialized list of lists of strings (a list of pages).
## Position
It is just a serialized list of two element: latitude and longitude. If you look at it with a text editor you see something like this:
```
{
    "items": [
        {
            "value": -0.048674911418653412,
            "$type": "kOS.Safe.Encapsulation.ScalarDoubleValue"
        },
        {
            "value": -74.7260891166769,
            "$type": "kOS.Safe.Encapsulation.ScalarDoubleValue"
        }
    ],
    "$type": "kOS.Safe.Encapsulation.ListValue"
}
```
All the serialized files look like this.
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
