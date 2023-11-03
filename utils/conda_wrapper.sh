#!/bin/bash


# HTCondor informs jobs of device availability through CUDA_VISIBLE_DEVICES.
# Some libraries/applications don't like the format it uses so just in case 
# this code remaps it to the older format

IDS=""
for id in $( echo $CUDA_VISIBLE_DEVICES | sed 's/,/ /g' )
do
        IDS=${IDS}$( nvidia-smi -L | grep $id | cut -f 2 -d' ' | sed 's/:/,/')
done

export CUDA_VISIBLE_DEVICES=$( echo $IDS | sed 's/,$//' )


eval "$(/home/$( whoami )/miniconda3/bin/conda shell.bash hook)"

python $1 ${@:2}

exit $?

