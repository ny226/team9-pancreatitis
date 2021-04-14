#!/bin/bash

#SBATCH --time=10:00:00   # walltime
#SBATCH --ntasks=4   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=16384M   # memory per CPU core

# Set the max number of threads to use for programs using OpenMP. Should be <= ppn. Does nothing if the program doesn't use OpenMP.
export OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE
# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE

module load bcftools/1.6
count=21
#INSERT FILEPATHS AND FILENAMES TO STUFF IN CURLY BRACES
for file in ~/fsl_groups/fslg_team9lab/compute/1000_genomes/AMR/*; do
 let "count += 1"
 name="amr_chr"$count".vcf.gz"
 bcftools view -Oz -S ~/fsl_groups/fslg_team9lab/compute/pop_samples/AMR_new $file > ~/fsl_groups/fslg_team9lab/compute/filtered_pop/AMR/$name
done

