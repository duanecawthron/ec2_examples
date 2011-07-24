#!/bin/bash

# ---------------- install configuration files for Icecast and MPD

cap setup_icecast

# ---------------- start the server

cap restart_icecast

if [ "use_ices" = "use_ices" ]; then
	cap play_ices_test_song
else
	cap restart_mpd
	cap play_mpd_test_song
fi

# ---------------- Use VLC to test the stream

echo Use VLC to test the stream
echo http://ec2-184-72-84-255.compute-1.amazonaws.com:8000/stream.mp3
echo http://ec2-184-72-84-255.compute-1.amazonaws.com:8080/stream.ogg
echo
echo Browse the Admin Interface
echo http://ec2-184-72-84-255.compute-1.amazonaws.com:8080/admin/stats.xsl
echo username: admin
echo password: hackme
