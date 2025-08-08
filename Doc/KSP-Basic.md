## KSP-BASIC release history
```
kOS-Computer           KSP-BASIC

v1.0.0-alpha           None
v1.0.1                 None
v1.0.2                 None
v1.1.0                 v0.0.0-alpha
v1.1.1                 v0.0.0-alpha
```
## KSP-Basic commands
KSP-Basic is not casesensitive.
### AG1, AG2, ... AG10
Toggles the boolean state of the Action Groups. No parameters.
### CLS
Wrapping of the Kerboscrpt clearscreen. it set the cursor to 0,0 position.
### END
Ends the program, even before the last command.
### GOTO
Jump to a program line.
```
10 PRINT "Hello!"
GOTO 10
```
A line number can be any rational number!
```
10 PRINT "Hello!"
GOTO 25.54
CLS
20.54 END
```
### LOCATE
Move the cursor in a new x,y location.
```
LOCATE 4 8
PRINT "Far from the edge"
```
### PRINT
Wrapping of the Kerboscript print. It has his own cursor location system (indipendent from kOSPropMonitor's one).
### RD
Starts a rover journey to the set destination. No parameters.
### REM
Makes the line a comment line. The line will be not executed at all.
### SD
Set the destination with latidude and longitude parameters.
```
SD 45.23434 -73.00123
```
### WR
Wait for the rover to stop before executing other commands. No paramenters.
### WAIT
Wrapping of the Kerboscript WAIT. One parameter: seconds.
```
WAIT 3.5
```
