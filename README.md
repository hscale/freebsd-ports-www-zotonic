freebsd-ports-www-zotonic
=========================

FreeBSD port for Zotonic CMS


Usage
-----

Copy the zotonic directory into your ports tree at

    /usr/ports/www/zotonic

You might use the helper script

    copy-to-ports-tree.sh

for this.


Present State
-------------

THIS PORT IS NOT WORKING YET - WORK IS STILL IN PROGRESS!


### Prerequisites

Before you build via the port, check the prerequisites at

  http://zotonic.com/docs/0.9/tutorials/preinstall.html

You have to manually install the ports for
* erlang
* imagemagick
* postgresql

and to enable the trust auth for the "zotonic" database user.


### What works

The present port is able to 
* fetch the sources (make fetch),
* unpack (make extract),
* patch (make patch) and 
* build (make)


### What works not

Installation is not working yet (see TODO).


### Testing what works

So just try

    cd /usr/ports/www/zotonic
    make


This builds zotonic in 

    /usr/ports/www/zotonic/work/zotonic


You can play with this stuff by going to that directory and continue 
with step 3 from

  http://zotonic.com/docs/0.9/tutorials/install.html


TODO
----

I have to figure out how to install this properly.

The bundeled rebar script seems to assume that the build
directory is equal to the installation directory, which is
not the FreeBSD way, which wants installation under /usr/local

See the TODOs in zotonic/Makefile for more open tasks.
