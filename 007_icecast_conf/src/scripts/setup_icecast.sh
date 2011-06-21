#!/bin/bash

[ "$USER" = "root" ] || { echo ERROR: must run as root; exit 1; }

TOP=`dirname $0`
cd $TOP/..
TOP=`pwd`

[ -d etc ]      || { echo ERROR: cannot find etc in `pwd`; exit 1; }
[ -d scripts ]  || { echo ERROR: cannot find scripts in `pwd`; exit 1; }

# ---------------- Create folders and files used by Icecast and MPD

mkdir -p /u/etc
mkdir -p /u/music
mkdir -p /u/mpd/playlists

touch    /u/mpd/mpd.db
touch    /u/mpd/mpdstate

chown -R ec2-user /u/etc
chown -R ec2-user /u/mpd
chown -R ec2-user /u/music

mkdir -p /var/log/icecast
mkdir -p /var/log/mpd
chown -R ec2-user /var/log/icecast
chown -R ec2-user /var/log/mpd

# ---------------- Install config files

cp -pr $TOP/etc/* /u/etc
rm -f /u/etc/mpd.conf
ln -s /u/etc/mpd_icecast.conf /u/etc/mpd.conf
# Or ln -s /u/etc/mpd_standalone.conf /u/etc/mpd.conf

# ---------------- Install init scripts so that we can easily start and stop the services

for name in icecast mpd
do
	# Install the init script
	cp /u/etc/init.d/$name /etc/rc.d/init.d
	
	# Set its ownership and access rights
	chown root:root /etc/rc.d/init.d/$name
    chmod 755 /etc/rc.d/init.d/$name

	# Add the init script to chkconfig
    chkconfig --add $name
    chkconfig $name on

	echo Use these commands to start and stop $name
	echo /sbin/service $name start
	echo /sbin/service $name stop
	echo /sbin/service $name restart
done
