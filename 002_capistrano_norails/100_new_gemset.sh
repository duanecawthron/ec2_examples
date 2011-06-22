#!/bin/bash
#
# usage: 000_cap_deploy.sh <gemset>
#
# Use Capistrano to create a new gemset and add capistrano
#

TOP=`dirname $0`
cd $TOP

rm -rf tmp
cp -pr src tmp
sed "s/PROJECT=norails/PROJECT=$1/" < src/scripts/new_gemset.sh > tmp/scripts/new_gemset.sh

cat << EOF > tmp/scripts/deploy.sh
#!/bin/bash
cap new_gemset
EOF

../002_capistrano_norails/000_cap_deploy.sh tmp
