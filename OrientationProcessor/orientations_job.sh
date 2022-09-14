
#!/bin/bash
## Job name:
#SBATCH --job-name=ORIENTATIONS_Lorde_Empty
#
## Account:
#SBATCH --account=fc_xenopus
#
## Partition:
#SBATCH --partition=savio3
#
## Wall clock limit:
#SBATCH --time=72:00:00
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
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/global/scratch/users/bhlee1020/conda_envs/dlc/lib/
export JOBS_PER_NODE=$(( $SLURM_CPUS_ON_NODE / $SLURM_CPUS_PER_TASK ))
export WDIR=/global/scratch/users/bhlee1020
echo $SLURM_JOB_NODELIST |sed s/\,/\\n/g > hostfile

# Change this when running
VIDEOPATH=/global/scratch/users/bhlee1020/RNAi/Lorde/Empty/Orientation_Chunks/Unfinished

ls $VIDEOPATH/*.mp4 | parallel -j $JOBS_PER_NODE --joblog LordeEmptyORIENTATIONS.log --slf hostfile --wd $WDIR --progress /bin/bash orientations_exec_script.sh {} $SLURM_CPUS_PER_TASK
