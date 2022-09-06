#!/bin/bash
## Job name:
#SBATCH --job-name=VP_Helen_AC
#
## Account:
#SBATCH --account=fc_xenopus
#
## Partition:
#SBATCH --partition=savio3_bigmem
#
## Wall clock limit:
#SBATCH --time=48:00:00
#
#SBATCH --mail-type=END,FAIL
#
#SBATCH --mail-user=bhlee1020@berkeley.edu
#
# Request four nodes:
#SBATCH --nodes=4
#
# Number of MPI tasks needed for use case (example):
#SBATCH --ntasks=24
#
## Processors per task:
#SBATCH --cpus-per-task=2
#
## Command(s) to run:
module load python/3.7
module load gnu-parallel
module load gcc openmpi
module load python

# Change this to your conda environment before running
source activate project_env
export JOBS_PER_NODE=$(( $SLURM_CPUS_ON_NODE / $SLURM_CPUS_PER_TASK ))

# Change this to the location of your scratch
export WDIR=/global/scratch/users/bhlee1020

echo $SLURM_JOB_NODELIST |sed s/\,/\\n/g > hostfile

# Change this to the location of the Image Stacks folder generated by FFMPEG
IMAGESTACKS_PATH=/global/scratch/users/bhlee1020/Helen_AC_tmp/Image_Stacks

# Change the name of joblog to the name of the jelly you are running
ls $IMAGESTACKS_PATH | parallel -j $JOBS_PER_NODE --joblog HelenACVP.log --slf hostfile --wd $WDIR --progress /bin/bash new_vp_exec_script.sh {} $SLURM_CPUS_PER_TASK