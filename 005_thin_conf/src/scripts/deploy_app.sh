#!/bin/bash

# ---------------- restart Nginx and Thin
#
# NOTE: Thin will not start unless 
#       /u/myapp/current must be a valid rails project
#       the gemset must have all required gems
#

cap config
cap restart_nginx
cap restart_thin

echo Browse to:
echo http://ec2-184-72-84-255.compute-1.amazonaws.com
