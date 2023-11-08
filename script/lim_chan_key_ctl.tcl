#!/usr/bin/env tclsh
package require Tk
package require Img
set pic_path "../202309290035"
wm geometry . 230x220
canvas .canvas -width 230 -height 220 -bg white
pack .canvas
source [format "%s/0.tcl" $pic_path]
bind . <KeyPress> {handle_key_press %K}
load_image
puts "lim chan in key control mode"
puts "press h for help"
tkwait window .
