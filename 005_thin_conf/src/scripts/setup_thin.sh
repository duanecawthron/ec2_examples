#!/bin/bash

TOP=`dirname $0`
cd $TOP/..
TOP=`pwd`

[ "$USER" = "root" ] || { echo ERROR: must run as root; exit 1; }

[ -d scripts ]  || { echo ERROR: cannot find scripts in `pwd`; exit 1; }

# ---------------- Install config files

cp $TOP/etc/nginx_myapp.conf /etc/nginx/conf.d/myapp.conf

[[ -s "/usr/local/rvm/scripts/rvm" ]]     && . "/usr/local/rvm/scripts/rvm" # Load system RVM function if found
[[ -s "$HOME/.rvm/scripts/rvm" ]]         && . "$HOME/.rvm/scripts/rvm"     # Load user RVM function if found

rvm use 1.8.7@thin

thin config -C /etc/thin/myapp -c /u/myapp/current --servers 3 -e development
# or for caching, etc:
# thin config -C /etc/thin/myapp -c /u/myapp/current --servers 3 -e production

# ---------------- Use this to test Nginx, then remove it.

if [ "yes" = "yes" ]; then
	mkdir -p /u/myapp/current/log
	cat << EOF > /u/myapp/current/index.html
	<html>
	<body>
	hi
	</body>
	</html>
EOF
	chown -R ec2-user /u/myapp
fi

# ---------------- 

service nginx restart
service thin restart

# /etc/init.d/thin restart && /etc/init.d/nginx reload; tail -f /var/www/myapp.example.com/log/*.log
