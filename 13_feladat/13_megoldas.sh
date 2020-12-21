#!/bin/bash

#fájl, amiben a törlendő usernevek vannak
#userev:teljes nev:(kell-e torolni a home-t)igen/nem
FILE=/home/kozsup/unix/users2.txt

#a fájl sorainak beolvasása
while IFS=":" read USERNEV TNEV TOROLE; do

#ha a TOROLE változó értéke igen, akkor törli a home mappát is, különben nem
if [[ $TOROLE == "igen" ]]; then
	sudo userdel -r "$USERNEV"
else
	sudo userdel "$USERNEV"
fi

done < "$FILE"
