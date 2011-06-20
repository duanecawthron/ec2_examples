#!/bin/bash

TOP=`dirname $0`
cd $TOP/..
TOP=`pwd`

[ -d scripts ]  || { echo ERROR: cannot find scripts in `pwd`; exit 1; }

mkdir -p download
cd download

[ -f icecast-2.3.2.tar.gz ] || \
wget http://downloads.xiph.org/releases/icecast/icecast-2.3.2.tar.gz

[ -f libshout-2.2.2.tar.gz ] || \
wget http://downloads.us.xiph.org/releases/libshout/libshout-2.2.2.tar.gz

[ -f libmpdclient-2.4.tar.bz2 ] || \
wget http://downloads.sourceforge.net/project/musicpd/libmpdclient/2.4/libmpdclient-2.4.tar.bz2?r=http%3A%2F%2Fmpd.wikia.com%2Fwiki%2FClientLib%3Alibmpdclient&ts=1305740545&use_mirror=superb-sea2

[ -f mpc-0.20.tar.bz2 ] || \
wget http://downloads.sourceforge.net/project/musicpd/mpc/0.20/mpc-0.20.tar.bz2?r=http%3A%2F%2Fmpd.wikia.com%2Fwiki%2FClient%3AMpc&ts=1305740034&use_mirror=superb-sea2

[ -f mpd-0.16.2.tar.bz2 ] || \
wget http://downloads.sourceforge.net/project/musicpd/mpd/0.16.2/mpd-0.16.2.tar.bz2?r=http%3A%2F%2Fmpd.wikia.com%2Fwiki%2FServer&ts=1305738540&use_mirror=iweb

[ -f ncmpc-0.18.tar.bz2 ] || \
wget http://downloads.sourceforge.net/project/musicpd/ncmpc/0.18/ncmpc-0.18.tar.bz2?r=http%3A%2F%2Fmpd.wikia.com%2Fwiki%2FClient%3ANcmpc&ts=1305740077&use_mirror=voxel

[ -f lame-3.98.4.tar.gz ] || \
wget http://downloads.sourceforge.net/project/lame/lame/3.98.4/lame-3.98.4.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Flame%2Ffiles%2Flame%2F3.98.4%2F&ts=1308369929&use_mirror=cdnetworks-us-2

[ -f libmad-0.15.1b.tar.gz ] || \
wget http://downloads.sourceforge.net/project/mad/libmad/0.15.1b/libmad-0.15.1b.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fmad%2Ffiles%2Flibmad%2F0.15.1b%2F&ts=1308374805&use_mirror=superb-sea2
