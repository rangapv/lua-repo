#! /usr/bin/env bash
#author:rangapv@yahoo.com

chk_lua() {

l1=`which lua`
l1s="$?"

if [ $l1s -eq "0" ]
then
echo "lua is installed in $l1 and the version is $(lua -v)"
else
install_lua
fi

}


install_lua() {

luaver="lua-5.4.7"
echo "The current version of lua to be installed is $luaver, check the website https://www.lua.org/download.html to confirm the release version or press enter"
read luver

if [[ $luver = "" ]]
then
	luaver=$luver
fi


ldw=`curl -L -R -O https://www.lua.org/ftp/$(luaver).tar.gz`
lu1=`tar zxf $(luaver).tar.gz`
lu2=`cd $(luaver)`
lu3=`sudo make all test`

lu4=`sudo make install`

luas=`lua -v`

echo "Current lua is $luas"

}


chk_lua
