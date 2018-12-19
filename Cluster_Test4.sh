#!/bin/bash
#SBATCH --job-name=arrayjob
#SBATCH --mail-type=ALL
#SBATCH --mail-user=email@uottawa.ca
#SBATCH --output=arrayJob_%A_%a.out
#SBATCH --error=arrayJob_%A_%a.err
#SBATCH --array=1-16
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=0-9:0:0	# days-hours:minutes:seconds; How long you expect your job to run for (default is 3 hours).
#SBATCH --mem=8GB	#Memory requested in megabytes (default is 1024 MB).

# commands for your job go here

module load r
#echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
Rscript /global/home/hpc4300/BIM_Final_RCodes/Cluster_Test4.R $SLURM_ARRAY_TASK_ID
