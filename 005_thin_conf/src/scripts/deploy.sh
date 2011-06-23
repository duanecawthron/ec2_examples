#!/bin/bash

# ---------------- install Nginx and Thin config files

cap setup

# ---------------- restart Nginx and Thin
#
# NOTE: Thin will not start unless 
#       /u/myapp/current must be a valid rails project
#       the gemset must have all required gems
#

cap restart_nginx
cap restart_thin

echo Browse to:
echo http://ec2-184-73-84-106.compute-1.amazonaws.com
