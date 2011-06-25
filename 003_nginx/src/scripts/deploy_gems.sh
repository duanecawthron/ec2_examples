#!/bin/bash

# ---------------- install nginx package

cap yum_nginx

# ---------------- run server

cap start_nginx

echo Browse to:
echo http://ec2-184-72-84-255.compute-1.amazonaws.com
