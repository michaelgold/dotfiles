#!/bin/bash

TEMPDIR=~/tmp

xdpyinfo -ext XINERAMA | sed '/^  head #/!d;s///' |
while IFS=' :x@,' read i w h x y; do
    import -window root -crop ${w}x$h+$x+$y $TEMPDIR/head_$i.png
done



convert $TEMPDIR/head_0.png -scale 5% -scale 2000% $TEMPDIR/head_0.png
[[ -f $HOME/Pictures/misc/lock.png ]] && convert $TEMPDIR/head_0.png $HOME/Pictures/misc/lock.png -gravity center -composite -matte $TEMPDIR/head_0.png
if [ -e $TEMPDIR/head_1.png ]; then
  convert $TEMPDIR/head_1.png -scale 5% -scale 2000% $TEMPDIR/head_1.png
  [[ -f $HOME/Pictures/misc/lock.png ]] && convert $TEMPDIR/head_1.png $HOME/Pictures/misc/lock.png -gravity center -composite -matte $TEMPDIR/head_1.png
  convert $TEMPDIR/head_1.png $TEMPDIR/head_0.png +append $TEMPDIR/screen.png
  rm $TEMPDIR/head_1.png
else
  mv $TEMPDIR/head_0.png $TEMPDIR/screen.png
fi
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
i3lock -u -i $TEMPDIR/screen.png
rm $TEMPDIR/screen.png
