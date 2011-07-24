#!/bin/bash

[ "$USER" = "ec2-user" ] || { echo ERROR: must run as ec2-user; exit 1; }

# play a song
cd /u/music
[ -f Epoq-Lepidoptera.ogg ] || wget --no-verbose http://www.vorbis.com/music/Epoq-Lepidoptera.ogg


# basic playlist
echo /u/music/Epoq-Lepidoptera.ogg > playlist

# script playlist
echo "echo /u/music/Epoq-Lepidoptera.ogg" > playlist.sh

sudo service ices restart
