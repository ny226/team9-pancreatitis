#!/bin/bash

#SBATCH --time=20:00:00   # walltime
#SBATCH --ntasks=4   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16384M   # memory per CPU core

# Set the max number of threads to use for programs using OpenMP. Should be <= ppn. Does nothing if the program doesn't use OpenMP.
export OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE
# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE


#INSERT FILEPATHS AND FILENAMES TO STUFF IN CURLY BRACES
./plink/plink --vcf ~/fsl_groups/fslg_team9lab/compute/filtered_pop/concat/afr_concat.vcf.gz --vcf-half-call 'm' --make-bed --out ~/fsl_groups/fslg_team9lab/compute/binary_pop/AFR/afrBinary
