#Simple R script to run on cluster
r = rnorm(10)
write.table(r, file="GG.txt")