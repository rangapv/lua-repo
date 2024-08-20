#! /usr/bin/env bash
#author:rangapv@yahoo.com

chk_lua() {

l1=`which lua`
l1s="$?"

if [ $l1s -ne "0" ]
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

if [[ $luver != "" ]]
then
	luaver=$luver
fi

ldw=`curl -L -R -O https://www.lua.org/ftp/$luaver.tar.gz`
ldws="$?"
if  [[ $ldws = "0" ]]
then
lu1=`tar zxf $luaver.tar.gz`
lu2=`cd $luaver;make all test`
lu2s="$?"
echo "lua test passed $lu2s"
lu4=`cd $luaver;make install`
u4s="$?"
luas=`lua -v`
echo "Current lua is $luas"

else

echo "Download failed "

fi

}

chk_lua
