#!/bin/bash

# Change this before running
POSTINIT_DF_PATH=/global/scratch/users/bhlee1020/RNAi/Helen/AC/AC_PostInitializationDF.csv

# Change this to the name of your conda environment
source activate project_env

python3 /global/scratch/users/bhlee1020/CassiopeaProcessor_20210804/VideoProcessor_v2.py $1 $POSTINIT_DF_PATH

