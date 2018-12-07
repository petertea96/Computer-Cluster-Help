#!/bin/bash
#SBATCH --job-name=myjobname
#SBATCH --mail-type=ALL
#SBATCH --mail-user=ptea035@uottawa.ca
#SBATCH -c 1 # Number of CPUS requested (default is 1 CPU).
#SBATCH --mem=8mb # Memory requested in megabytes (default is 1024 MB).
#SBATCH -t 0-0:0:5 # How long you expect your job to run for (default is 3 hours).

echo 'starting test job...'
echo 'our job worked!'