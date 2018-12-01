#!/bin/bash
#SBATCH --job-name=test1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=your_own_email_address
#SBATCH --output=STD.out
#SBATCH --error=STD.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=0:0:2  #0 days 2 hours
#SBATCH --mem=2GB
# commands for your job go here
module load r

R CMD BATCH Cluster_Test1.R