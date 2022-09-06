#!/bin/bash
## Job name:
#SBATCH --job-name=Minnie_AC_FFMPEG
### Account:
#SBATCH --account=fc_xenopus
#
## Partition:
#SBATCH --partition=savio3
#
## Wall clock limit:
#SBATCH --time=15:00:00
#
#SBATCH --mail-type=END,FAIL
#
#SBATCH --mail-user=bhlee1020@berkeley.edu
#
# Request one node:
#SBATCH --nodes=1
#
# Number of MPI tasks needed for use case (example):
#SBATCH --ntasks=24
#
## Processors per task:
#SBATCH --cpus-per-task=1
#
## Command(s) to run:
module load python/3.7
module load gnu-parallel

#source activate myenv

VIDEOSCRATCHPATH=/global/scratch/users/bhlee1020/RNAi/Minnie/AC/Video_Chunks

ls $VIDEOSCRATCHPATH/*.mp4 | parallel singularity exec --bind /global/scratch/users/bhlee1020/Minnie_AC_tmp:/tmp --overlay /global/scratch/users/bhlee1020/overlay{%}.img /global/scratch/users/bhlee1020/ffmpeg_latest.sif /bin/bash exec_script.sh {} {/.} {/.}

