#!/usr/bin/env Rscript
#Test
#getwd()

slurm_arrayid <- Sys.getenv('SLURM_ARRAY_TASK_ID')
n <- as.numeric(slurm_arrayid)
print(n)

