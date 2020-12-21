#!/bin/bash

#A szkript helye
DIR="/mappa/szkripthelye"
cd $dir

#Felveszi a szkript PID-jét ha fut, ha nem akkor üres marad.
# Kilistáz mindent | kikeresi a szkriptet | kizárja a grep-es keresést | kivágja a PID-et
PROC=$(ps aux | grep ./szkript.sh | grep -v grep | awk '{print $2})

# -z igazat ad, ha $PROC sztring hossza 0.
#Ha 0, akkor nem fut ezért elinditja.
if [[-z $PROC ]]; then
	./szkript.sh
fi

