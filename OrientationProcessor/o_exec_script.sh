#!/bin/bash

# Change this to your conda environment and library
source activate /global/scratch/users/bhlee1020/conda_envs/dlc
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/global/scratch/users/bhlee1020/conda_envs/dlc/lib/

python3 /global/scratch/users/bhlee1020/Orientations.py $1
