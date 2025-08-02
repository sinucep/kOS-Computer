## KPM interface
Some useful information about the terminal configuration file named **kOS-ComputerTerminal** in thi mod.
### Terminal configuration file
```
[hw]{buttonLabel0}|{buttonLabel1}|{buttonLabel2}|{buttonLabel3}|{buttonLabel4}|{buttonLabel5}|   EXIT[/hw]
[#FF4849]{flagLabel0} {flagLabel1} {flagLabel2} {flagLabel3} {flagLabel4} {flagLabel5}
[hw]{l1}[/hw]
[hw]{l2}[/hw]
[hw]{l3}[/hw]
[hw]{l4}[/hw]
[hw]{l5}[/hw]
[hw]{l6}[/hw]
[hw]{l7}[/hw]
[hw]{l8}[/hw]
[hw]{l9}[/hw]
[hw]{l10}[/hw]
[hw]{l11}[/hw]
[hw]{l12}[/hw]
[hw]{l13}[/hw]
{l14}[/hw]
{l15}[/hw]
{l16}[/hw]
[hw]{l17}[/hw]
[hw]{buttonLabel7}|{buttonLabel8}|{buttonLabel9}|{buttonLabel10}|{buttonLabel11}|{buttonLabel12}| {buttonLabel13}[/hw]
```
* **[hw] and [/hw]**
  
  Half width. It allows 80x20 resolution. Widthout that you will have 40x20 resolution. Note that you can use [hw] indipendently for each line, so you can have an interesting mixed text mode resolution. The useful case is to have the _active key_ labels with a different size.

* **EXIT**

  This is just an arbitrary string, you can write any text here. You can even use {buttonLabel6} keyword and assign it in run time. Just know that pressing that button (the top right one) you will exit the kOSPropMonitor program, you can not use that button for something else.

* **{buttonLabel0}...{buttonLabel0}**

  Active key labels. The separator "|" is arbitrary you can use any string or nothing.
 
    
