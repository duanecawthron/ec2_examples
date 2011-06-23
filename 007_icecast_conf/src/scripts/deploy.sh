#!/bin/bash

# ---------------- install configuration files for Icecast and MPD

cap setup_icecast

# ---------------- start the server

cap restart_icecast
cap restart_mpd
cap play_test_song

# ---------------- Use VLC to test the stream

echo Use VLC to test the stream
echo http://ec2-184-73-84-106.compute-1.amazonaws.com:8000/stream.mp3
echo http://ec2-184-73-84-106.compute-1.amazonaws.com:8080/stream.ogg
