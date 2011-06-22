#!/bin/bash

[ "$USER" = "root" ] || { echo ERROR: must run as root; exit 1; }

[[ -s "/usr/local/rvm/scripts/rvm" ]]     && . "/usr/local/rvm/scripts/rvm" # Load system RVM function if found
[[ -s "$HOME/.rvm/scripts/rvm" ]]         && . "$HOME/.rvm/scripts/rvm"     # Load user RVM function if found

rvm use 1.8.7@thin

rm -f /etc/rc.d/init.d/thin
thin install
