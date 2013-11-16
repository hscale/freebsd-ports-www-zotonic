freebsd-ports-www-zotonic
=========================

FreeBSD port for Zotonic CMS


Use
---

Copy the zotonic directory into your ports tree at

  /usr/ports/www/zotonic
  
Then try the usual commands there, like

  make install clean


Present State
-------------

THIS PORT IS NOT WORKING YET - WORK IS STILL IN PROGRESS

The present port is able to fetch the sources (make fetch) and
unpacks fine (make extract). 


TODOs
-----

Next thing to roll into this port is the patch for FreeBSD 9
to use the iconv from the ports. (See my post to the Zotonic 
developer mailing list, what has to be done)

Then I have to figure out how to install this.
The bundeled rebar script seems to assume that the build
directory is equal to the installation directory, which is
not the FreeBSD way.

See the TODOs in the Makefile for more open tasks.
