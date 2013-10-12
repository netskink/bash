#!/bin/sh

#must run as X login user.

#xrandr -q
#LVDS1
#VGA1


#cvt 1280 1024
#cvt 1280 800

#xrandr --newmode "1280x1024_60.00"  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync


#xrandr --addmode VGA1 "1280x1024_60.00"                       
#xrandr --output VGA1 --mode "1280x1024_60.00"
xrandr --output LVDS1 --mode 1280x800 --pos 0x0 --output VGA1 --mode "1280x1024_60.00" --pos 1280x0
