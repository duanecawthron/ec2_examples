#!/bin/bash

# ---------------- restart Nginx and Thin
#
# NOTE: Thin will not start unless 
#       /u/myapp/current must be a valid rails project
#       the gemset must have all required gems
#

# need to stop both thin and nginx; otherwise, thin uses old link for /u/myapp/current
cap stop_nginx
cap stop_thin

cap reset_db

# start thin first so that nginx can connect to it
cap start_thin
cap start_nginx

echo Browse to:
echo http://ec2-184-72-84-255.compute-1.amazonaws.com
echo /var/log/icecast
echo /var/log/mpd
echo nginx and thin logs: /u/myapp/current/log
