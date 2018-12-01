#!/bin/bash
#SBATCH --job-name=arrayjob
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ptea035@uottawa.ca
#SBATCH --output=arrayJob_%A_%a.out
#SBATCH --error=arrayJob_%A_%a.err
#SBATCH --array=1-16
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=0-9:0:0
#SBATCH --mem=8GB
# commands for your job go here
#load-sse3
module load r
#echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
Rscript /global/home/hpc4300/BIM_Final_RCodes/test4.R $SLURM_ARRAY_TASK_ID