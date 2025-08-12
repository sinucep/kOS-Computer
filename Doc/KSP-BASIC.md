## KSP-BASIC release history
```
kOS-Computer           KSP-BASIC

v1.0.0-alpha           None
v1.0.1                 None
v1.0.2                 None
v1.1.0                 v0.0.0-alpha
v1.1.1                 v0.0.0-alpha
v1.1.2                 v0.0.0-alpha
```
## KSP-BASIC commands
KSP-BASIC is not case sensitive.

### #[Kerboscript line]
After # you can insert any one-line kerboscript code.
```
#GLOBAL Var to 15.
PRINT Var
```
### AG1, AG2, ... AG10
Toggles the boolean state of the Action Groups. No parameters.
```
AG1.
```
is equivalent to:
```
#TOGGLE AG1.
```
### CLS
Wrapping of the Kerboscrpt clearscreen. Tt set the cursor to 0,0 position.
### CO
Set a permanent color. Command print is affected.
```
CO Y
PRINT "Yellow"
CO
PRINT "Color reset to default"
```
The allowed parameters are:
```
Parameter    Color     HEX

[none]       Default
R            Red       [#FF0000]
G            Green     [#00FF00]
B            Blue      [#0000FF]
Y            Yellow    [#FFFF00]
C            Cyan      [#FFFF00]
W            White     [#FFFFFF]
O            Orange    [#FF8000]
P            Pink      [#FF8080]
M            Magenta   [#FF00FF]
V            Violet    [#9933FF]
BLACK                  [#000000]
GRAY                   [#909090]
BROWN                  [#663300]
```
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
You can use colors with command **CO**.
```
#GLOBAL Var to 15.
#GLOBAL Str to "world".
PRINT Var + 5
PRINT "Hello" + Var
PRINT "Hello " + Str:TOUPPER
```

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
