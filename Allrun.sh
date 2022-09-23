#!/bin/bash

MODELDIR=models

if ! [ -d "data" ]; then
    mkdir data
fi

for dir in $MODELDIR/*; do

    
    if [ -d "$dir" ]; then
        
        echo " "
        echo "/----------------------------- $dir----------------------------/"
        #make data directory structure
        #if [-d data/$dir]; then
        #    mkdir data/$dir
        #fi

        cp -r $dir/0.orig common/0.orig
        cp  $dir/turbulenceProperties common/constant/turbulenceProperties
        cp  $dir/transportProperties common/constant/transportProperties
        cd common
        
        echo ""
        echo "/---- coarse Mesh ---/"

        ./Allclean
        
        ./Allrun_coarse
        
        DATADIR=$( echo "$dir" | cut -d'/' -f2)
        echo "$DATADIR"
        cp -r postProcessing ../data/"$DATADIR"_coarse/
        cp log.* ../data/"$DATADIR"_coarse/
        echo "data copied"

        echo ""
        echo "/---- fine Mesh ---/"
        ./Allclean
        
        ./Allrun_fine

        cp -r postProcessing ../data/"$DATADIR"_fine
        cp log.* ../data/"$DATADIR"_fine/
        echo "data copied"
        
        rm -r 0.orig 0
        rm constant/turbulenceProperties constant/transportProperties
        
        ./Allclean
        #cd back to main dir
        cd ..
    
    fi
    
done
