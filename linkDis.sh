#!/bin/bash

#SBATCH --time=15:00:00   # walltime
#SBATCH --ntasks=4   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16384M   # memory per CPU core

# Set the max number of threads to use for programs using OpenMP. Should be <= ppn. Does nothing if the program doesn't use OpenMP.
export OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE
# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE

direct=("AFR AMR EAS EUR SAS")

#INSERT FILEPATHS AND FILENAMES TO STUFF IN CURLY BRACES
for dir in $direct; do
 file=${dir,,}"Binary"
 name="filtered"
 ../scripts/plink/plink --bfile ~/fsl_groups/fslg_team9lab/compute/binary_pop/$dir/$file  --extract ../genes/allSNPs.txt --recode --out ../genes/$dir/$name
done

