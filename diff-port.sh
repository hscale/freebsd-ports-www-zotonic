#!/usr/local/bin/bash
#
# diff this directory with the files in the ports tree

# config
PORT_NAME=zotonic
PORT_PARENT_DIR=/usr/ports/www

# go
THIS_DIR=$PORT_NAME
PORT_DIR=$PORT_PARENT_DIR/$PORT_NAME

diff -ru $THIS_DIR $PORT_DIR
