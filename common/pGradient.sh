#!/bin/bash

#output effective pressure gradient imposed by Ubar

FILENAME=$1
NAME=pGRad
if [ -f "$NAME".dat ]
then
    rm $NAME.dat
fi
awk '{if (/Pressure gradient source/) print $11}' $FILENAME >> "$NAME".dat
echo "done imposed Pressure Gradient"
