#!/usr/local/bin/bash
#
# diff this directory with the files in the ports tree

PORT_NAME=zotonic
THIS_DIR=$PORT_NAME
PORT_DIR=/usr/ports/www/$PORT_NAME

diff -ru $THIS_DIR $PORT_DIR

