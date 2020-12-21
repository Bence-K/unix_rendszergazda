#!/bin/bash

# Ellenőrzi hogy a bejövő argument reguláris fájl-e, -f
if [ -f $1 ]; then
	echo "Ez egy fájl! "

#Ellenőrzi, hogy mappa-e -d
elif [ -d $1 ]; then
	echo "Mappa"

else
	echo "Nem mappa, és nem fájl, lehet hogy nem létezik ilyen nevű bejegyzés a $PWD - ben"
fi
