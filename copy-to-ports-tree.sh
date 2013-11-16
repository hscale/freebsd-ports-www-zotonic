#!/usr/local/bin/bash
#
# copy git repo contents to ports collection
#

PORT_NAME=zotonic
PORT_DIR=/usr/ports/www/$PORT_NAME

echo "transfering $PORT_NAME to $PORT_DIR .."

if [ -d $PORT_DIR ] ; then 
    echo "directory $PORT_DIR already exists"
    echo -e "continue and remove (y/n)? [n] \c "
    read answer
    if [ -z $answer ] ; then
	answer=n
    fi 
    echo "you chose [$answer]"
    if [ $answer != "y" ] ; then
	echo "exiting .."
	exit 0
    fi
    rm -rfv $PORT_DIR
    remove=$?
    if [ $remove -ne 0 ] ; then 
	echo "something went wrong, exiting .."
	exit $remove
    fi
fi 

cp -rpv zotonic /usr/ports/www
copy=$?
if [ $copy -ne 0 ]; then
    echo "something went wrong, exiting .."
    exit $copy
else
    echo "ok, done.";
    exit 0
fi
