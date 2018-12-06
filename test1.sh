#!/bin/bash
#SBATCH --job-name=test1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=your_own_email_address
#SBATCH --output=STD.out
#SBATCH --error=STD.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1							# Number of CPUS requested (default is 1 CPU).
#SBATCH --time=0-1:0:0			  					# days-hours:minutes:seconds      # How long you expect your job to run for (default is 3 hours).
#SBATCH --mem=2GB									# Memory requested in megabytes (default is 1024 MB).



module load r

R CMD BATCH Cluster_Test1.R