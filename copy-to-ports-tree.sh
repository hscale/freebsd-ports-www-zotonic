#!/usr/local/bin/bash
#
# copy git repo contents to ports collection
#

# config
PORT_NAME=zotonic
PORT_PARENT_DIR=/usr/ports/www

# go
PORT_DIR=$PORT_PARENT_DIR/$PORT_NAME

echo "transfering $PORT_NAME to $PORT_DIR .."

if [ -d $PORT_DIR ] ; then 
    echo "directory $PORT_DIR already exists!"
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

    echo "remove files in $PORT_DIR .."
    rm -rfv $PORT_DIR
    remove=$?
    if [ $remove -ne 0 ] ; then 
	echo "something went wrong, exiting .."
	exit $remove
    fi
fi
 
echo "copy files from $PORT_NAME to $PORT_PARENT_DIR .."
cp -rpv $PORT_NAME $PORT_PARENT_DIR
copy=$?
if [ $copy -ne 0 ]; then
    echo "something went wrong, exiting .."
    exit $copy
else
    echo "ok, done.";
    exit 0
fi
