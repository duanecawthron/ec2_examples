#!/bin/bash

# ---------------- install nginx package

cap yum_nginx

# ---------------- run server

cap start_nginx

echo Browse to:
echo http://ec2-50-17-56-198.compute-1.amazonaws.com
