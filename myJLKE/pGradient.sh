#!/bin/bash

#output effective pressure gradient imposed by Ubar

FILENAME=$1

if [ -e $FILENAME.dat ]
then
    rm $FILENAME.dat
fi
awk '{if (/Pressure gradient Source/) print $11}' $FILENAME >> pGrad.dat
