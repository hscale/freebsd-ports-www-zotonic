freebsd-ports-www-zotonic
=========================

FreeBSD port for Zotonic CMS


Use
---

Copy the zotonic directory into your ports tree at

  /usr/ports/www/zotonic


Present State
-------------

THIS PORT IS NOT WORKING YET - WORK IS STILL IN PROGRESS!


Before you build via the port, check the prerequisites at

  http://zotonic.com/docs/0.9/tutorials/preinstall.html

You have to manually install the ports for
* erlang
* imagemagick
* postgresql
and to enable the trust auth for the "zotonic" database user.


The present port is able to 
* fetch the sources (make fetch),
* unpacks (make extract),
* patches (make patch) and 
* builds (make)

Installation is not working yet (see TODO).


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

See the TODOs in the Makefile for more open tasks.
