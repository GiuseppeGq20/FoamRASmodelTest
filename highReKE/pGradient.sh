#!/bin/bash

#output effective pressure gradient imposed by Ubar

FILENAME=$1

if [ -e $FILENAME.dat ]
then
    rm pGRad.dat
fi

awk '{if (/Pressure gradient source/) print $11}' $FILENAME >> pGrad.dat

echo "done imposed Pressure gradient"
