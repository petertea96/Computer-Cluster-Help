.libPaths("/global/home/hpc4300/RPackages")
library("SKAT")
data(SKAT.example)
null.model = SKAT_Null_Model(y.c ~ X, out_type="C", data = SKAT.example)
