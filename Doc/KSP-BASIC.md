## KSP-BASIC release history
```
kOS-Computer           KSP-BASIC

v1.0.0-alpha           None                  
v1.0.1                 None               
v1.0.2                 None               
v1.1.0                 v0.0.0-alpha
v1.1.1                 v0.0.0-alpha      
v1.1.2                 v0.0.0-alpha
v1.1.3                 v0.0.1-alpha
v1.2.0                 v0.0.2
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
AG1
```
It is equivalent to:
```
#TOGGLE AG1.
```
### CLS
Wrapping of the Kerboscript _CLEARSCREEN_. It sets the KSP-BASIC cursor to (0,0) position.
### COLOR

Set permanently a color and the highlighting. Command **PRINT** is affected.
```
COLOR YELLOW
PRINT "This text is Yellow"
COLOR
PRINT "Color reset to default"
COLOR BACKGROUND
PRINT "This text is highlighted"
COLOR FOREGROUND
PRINT "This text is no longer highlighted"
```
* **Warning!** Due to the nature of kOSPropMonitor's color system, each colored line will be shortened by 9 characters. Each color change will reduce the line length by another 9 characters. Use colors sparingly. The **CO** command without parameters restores the line to its original length.

The allowed parameters are:
```
Parameter      Color[HEX] / effect

[none]         default color
RED            [#FF0000]
GREEN          [#00FF00]
BLUE           [#0000FF]
YELLOW         [#FFFF00]
CYAN           [#FFFF00]
WHITE          [#FFFFFF]
ORANGE         [#FF8000]
PINK           [#FF8080]
MAGENTA        [#FF00FF]
VIOLET         [#9933FF]
BLACK          [#000000]
GRAY           [#909090]
BROWN          [#663300]
```
#### History
Up until kOS-Computer version 1.1.3 there there was the **CO** command instead:
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
Move the cursor in a new (X,Y) location.
```
LOCATE 4 8
PRINT "Far from the edge"
```
Any **PRINT** call increases the Y-coordinate and resets the X-coordinate to zero.

### MESSAGESEC
Sends a message to the second processor. The only parameter is the message itself.

The following code activates and deactivates the hint helper of the editor's multimonitor mode.
```
MESSAGESEC  dualedit
WAIT 3
MESSAGESEC  ready
```

Note the double space: one space is the searator, the other is parte of the command sent to the second processor.

### PRINT
Wrapping of the Kerboscript _PRINT_. It has his own cursor location system (indipendent from kOSPropMonitor's one).
You can use colors with command **CO**.
```
#GLOBAL Var to 15.
#GLOBAL Str to "world".
PRINT Var + 5
PRINT "Hello" + Var
PRINT "Hello " + Str:TOUPPER
```

* **Warning!** While it is possible to use _AT(X,Y)_ as in Kerboscript, it is not recommended. Use the **LOCATE** command instead, which uses the cursor handling of the KSP-BASIC environment, to avoid graphical glitches.
### RD
Starts a rover journey to the set destination. No parameters.
### REM
Makes the line a comment line. The line will be not executed at all.
### RUNKS
Executes a _.sk_ file (kerboscript). One parameter: the name of the file without _.ks_ file extension.
### SD
Set the destination with latidude and longitude parameters.
```
SD 45.23434 -73.00123
```
### TEXT

```
Parameter      Effect

[none]         resets all the changes
BACKGROUND     set the highlighting
FOREGROUND     disable the highlighting
SMALL          set a small width for the caracters (80 columns)
MEDIUM         set a medium width for the caracters (40 columns)
LARGE          set a large width for the caracters (20 columns)
```
Like **COLOR**, also **TEXT** shortens the line length. **TEXT MEDIUM** shortens by 5 characters, **TEXT LARGE** by 4 characters. **TEXT** sets che character width to small and restores the line to its original length.
### WR
Wait for the rover to stop before executing other commands. No paramenters.
### WAIT
Wrapping of the Kerboscript _WAIT_. One parameter: seconds.
```
WAIT 3.5
```
