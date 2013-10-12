#echo "xrandr"
#echo "cvt 1280 1024"
#echo "xrandr --newmode  1280x1024_60.00  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync"
#echo "xrandr --addmode VGA-1 1280x1024_60.00"
#echo "xrandr --output VGA-1 --mode 1280x1024_60.00 --pos 1400x0"


cvt 1280 1024
xrandr --newmode  1280x1024_60.00  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync
xrandr --addmode VGA-0 1280x1024_60.00
xrandr --output VGA-0 --mode 1280x1024_60.00 --pos 1400x0
