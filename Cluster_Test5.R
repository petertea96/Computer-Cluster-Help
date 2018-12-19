
#  -----||-----||-----||-----||-----||-----||-----||-----||-----||-----||-----||-----||-----   #
#-----||-----||-----||-----||-----||Array Job Code:||-----||-----||-----||-----||-----||-----#
#  -----||-----||-----||-----||-----||-----||-----||-----||-----||-----||-----||-----||-----   #
#--> Initially, I have 3000 files to analyse.
#--> In my BASH script, I set an aray job with 100 "arrays".
#--> I will split up the files to analyse into 100 chunks:
#    There are 3000 files in total to potentially analyse, so I split this into 100 chunks with
#    30 files belonging to each chunk.

slurm_arrayid <- Sys.getenv('SLURM_ARRAY_TASK_ID')
task_id <- as.numeric(slurm_arrayid)
#Obtain Slurm Task ID.  


#Now, determine indices of data files to analyse:
total_files=seq(from=1, to= 3001, by=30)

starting = total_files[task_id]
#Compute starting index

ending = total_files[task_id + 1] - 1
#Compute ending index

for (index in (starting:ending)){
  #Do something
  print(index)
}