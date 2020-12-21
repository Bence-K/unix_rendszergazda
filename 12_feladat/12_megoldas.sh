#!/bin/bash

#az a fájl, ahol a felhasználók adatai a következő formában vannak
# userNev:Teljes nev:shell
file=/home/kozsup/unix/users.txt

#IFS=":" jelenti, hogy ":" ként lesz darabolva, utána a változók amelyekbe beolvas
while IFS=":" read USERNEV NEV SHELL; do

#ellenorzes, hogy letezik-e a felhasznalo
LETEZIK=$( grep $USERNEV /etc/passwd)

#ha a letezik valatozo ures, akkor nem letezik
if [[ -z $LETEZIK ]]; then
# -m home directory létrehozás
# -s shell specifikálás
sudo useradd -m -c "$NEV" -s "$SHELL" "$USERNEV"

#nem a feladat része, de jelszó beállitás
#default jelszó usernev1
#sudo passwd "$USERNEV" <<< "${USERNEV}1"$'\n'"${USERNEV}1" 2>/dev/null

#Egyszerűbb jelszó megadás
#echo "$USERNEV":"${USERNEV}1" | sudo chpasswd

echo "$USERNEV nevu felhasznalo letrehozva"

#letezik a felhasznalo
else
echo "Mar letezik $USERNEV nevu felhasznalo"
fi

#meddig olvassa be
done < $file
