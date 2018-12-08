# Computer-Cluster-Help
These are (very) rough notes to get started on submitting R jobs to a supercomputer and offers an introduction to CAC. 
Many institutions have guides on their websites to help students navigate their own cluster. The ones I found really helpful include: Utah, Berkeley, and Michigan. More information can be found on the following websites:

https://thecoatlessprofessor.com/programming/working-with-r-on-a-cluster/

https://cac.queensu.ca/wiki/index.php/Hardware:Frontenac

http://research-it.berkeley.edu/services/high-performance-computing/using-r-savio

https://hcc-docs.unl.edu/display/HCCDOC/Submitting+R+jobs

https://sph.umich.edu/biostat/computing/cluster/examples/r.html

https://www.chpc.utah.edu/presentations/index.php

Without further ado...

Notation note: [ ] represents a parameter. You will need to change this yourself to fit your own needs.

## **1.	Log onto the cluster:**

Code: ssh -X hpc4300@login.cac.queensu.ca
*Use your own hpc number though…

The terminal will then prompt you to enter your password.


## **2.	Create a new directory (folder):**

mkdir [NewFolderName]


## 3.	Here are some nice general commands to know…

ls : List items in your current directory.

pwd :print the  current working directory.

rm [filename]: delete the filename from your directory.

cd : Change the directory. Example : cd /global/home/hpcg1578/Peter

cat : Print the contents of a file. Example:  cat namefile.txt
 - Note: There are many other uses for this command as well. 
 - cat can be used in conjunction with array jobs to combine a bunch of your results into a single file. Trust me, it is much easier to use cat to combine your files than it is through an R Script.



## **4.	How to transfer files from your computer onto the CAC directory (For windows):**

One very amateur way of doing this is by downloading a program called WINSCP (note: This program is similar to FileZilla, if your're familiar with it. Filezilla can be used as an alternative program if you're a mac user.).

This program allows you to easily drag and drop files between your own computer directories to the directory on the Supercomputer.

**Things you'll need to know:**

Host name: login.cac.queensu.ca

Port number: 22

User name: _____

Password: _____

Note: There are more sophisticated ways to upload files using the command line terminal. Feel free to look those up if you're a pro. 

## **5.	How do you write your *.sh files?**

- For something more sophisticated, feel free to use text editors on the command line such as nano or vim.

-	If you're uncomfortable with this, you can instead download Notepad ++ and write them there.

-	When you save your bash scripts, always make sure to have the extension .sh

- All bash scripts must start with a preamble that may look like this (I use this type of format for all my bash scripts): 

#!/bin/bash

#SBATCH --job-name=myjobname

#SBATCH --mail-type=ALL  #Ensures you will be notified/emailed when your job submission begins and ends.

#SBATCH --mail-user=email@uottawa.ca

#SBATCH -c [num_cpus]                      # Number of CPUS requested (default is 1 CPU).

#SBATCH --mem=[megabytes]                  # Memory requested in megabytes (default is 1024 MB).

#SBATCH -t days-hours:minutes:seconds      # How long you expect your job to run for (default is 3 hours). 



Note: If your job takes longer than specified, then your job submission will end abruptly.

**Some demo commands to use as a test**

echo 'starting test job...'

echo 'our job worked!'

FYI - I've created this bash script as yourjob.sh. You should first change the email address, and then try to submit this as a job onto the cluster (read steps 6 and 7 first).

## **6.	Submit your *.sh files onto CAC:**

-	Here is the command: sbatch yourjob.sh  

## **7.	Sometimes when you submit your *.sh jobs, you may encounter an error message such as:**

“sbatch: error: Batch script contains DOS line breaks (\r\n)
“sbatch: error: instead of expected UNIX line breaks (\n)

-	One possible solution is this code:

dos2unix yourjob.sh

-	Now, try running your job again.


## **8.	How to Run R jobs**

-	Check out test1.sh as well as Cluster_Test1.R for a very simple example I created. 

- Your .sh script will "instruct" the supercomputer to run an R script using the Rscript or R CMD BATCH command.

-	Make sure though that your R script is in the same directory as your shell script. If your R script is in a different directory, then change your code to: [path to R file]/Rfile

-	I've read that Rscript is (somehow) better than the R CMD BATCH command. I personally have used both commands and have never encountered any problems wih either command.

## **9.	A way to check on the status of the jobs you have submitted:**

-	squeue --start | grep hpc4300

## **10.	How to install R packages onto the CAC cluster.**

If the R codes you input contain calls such as library() or require() then it won’t work in the cluster. You will need to install the R packages yourself into the CAC directory. Here’s how to do it:

1.	First, create a directory inside the CAC domain where you will save all of your R packages. (mkdir Foldername)
2.	Type “R” (without quotations) into the CAC cluster. Your screen should now resemble what you would normally see when running R
3.	It may be helpful to look at the arguments of the install.packages() function.
In CAC, type: install.packages(“R package you want”, lib=”Path to folder where you want to save your R packages”)
Note: This may take a while…
The path to folder should be the same folder you just created.

4.	Close the terminal and login again to CAC (or use the quit() function in R).
5.	In all of your R script files, you will need to add the following line at the top:
.libPaths(“Path to the folder that has your R packages in CAC”)

For example, I made a folder called “RPackages” which contains all of my downloaded R packages on CAC. My path is : .libPaths("/global/home/hpc4300/RPackages") 


-	ILLUSTRATION: Please see test2.sh and Cluster_Test2.R for an example. I use the “SKAT” package. 

-	Some R packages are very special (Ex: MDMR), and extra steps will be required to install these packages. This code may help:
1.	At prompt type: module load gcc
(This changes the c compiler, which R uses to install packages)
2.	Open R and then try installing MDMR again using install.packages(“MDMR”). If it installed successfully, library(MDMR) should work. 

## **11.	How to perform array jobs and how to call variables from shell script to your R script.**

- Array jobs is a way of submitting your own job, except the run time to completion is usually much faster. In array jobs, we split your original jobs into multiple different jobs. The supercomputer will run each split job simultaneously, resulting in a much more efficient run time to completion.

-	For illustration, check out test4.sh and test4.R

- What's the point? If your R script contains a for loop with say 3000 iterations, do you really want to wait until the computer goes through each iteration 3000 times in one shot? Why not split your job of 3000 iterations into 100 jobs, where each job runs 30 iterations. The time to completion using an array job will be significantly quicker. 


## 12.	For coding in bash, the syntax is a little different however all concepts in your usual programming are the same. The following website is helpful in figuring out the syntax:

http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html
-	I’ve also compiled some very rough notes titled “Shell scripting tutorial.docx”.

## **13.	How to run the ms program:

Here is a sample command I’ve used:
./ms 200 1 -t 5.0 -T

Here, 

- 200 denotes the number of haplotypes I want to simulate
- 1 denotes the number of simulations I want to run
- -t denotes
- 	5.0 denotes some mutation rate
- 	-T means I want the output to include tree data
- To save the output of the ms file into some directory, use the following code:
- ./ms 200 1 -t 5.0 -T > /global/home/hpc4300/results.txt
*Change to your own directory. Note that results.txt is the name and file type I give to the output file saved.
