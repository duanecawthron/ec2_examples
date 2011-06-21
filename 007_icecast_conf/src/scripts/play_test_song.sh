#!/bin/bash

[ "$USER" = "ec2-user" ] || { echo ERROR: must run as root; exit 1; }

# create the mpd database
mpc update

# play a song
cd /u/music
[ -f Epoq-Lepidoptera.ogg ] || wget --no-verbose http://www.vorbis.com/music/Epoq-Lepidoptera.ogg
mpc update
mpc ls
mpc ls | mpc add
mpc play
mpc repeat on
