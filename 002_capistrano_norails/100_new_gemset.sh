#!/bin/bash
#
# usage: 100_new_gemset.sh.sh <gemset>
#
# Use Capistrano to create a new gemset and add capistrano
#

TOP=`dirname $0`
[ "$TOP" = "." ] && TOP=`pwd`

cd $TOP

rm -rf tmp
cp -pr src tmp
sed "s/PROJECT=norails/PROJECT=$1/" < src/scripts/new_gemset.sh > tmp/scripts/new_gemset.sh

rm -f tmp/scripts/deploy_app.sh
cat << EOF > tmp/scripts/deploy_gems.sh
#!/bin/bash
cap new_gemset
EOF
chmod 775 tmp/scripts/deploy_gems.sh

../002_capistrano_norails/101_cap_deploy.sh tmp
