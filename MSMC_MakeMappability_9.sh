#!/usr/bin/env bash
#SBATCH -D /global/scratch/peter_stokes/msmc/analysis/msmc_map
#SBATCH -J msmc_makeMappabilityMask
#SBATCH --partition=savio
#SBATCH --account=co_rosalind
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --time=24:00:00
#SBATCH --mem=64000
#SBATCH -o /global/home/users/peter_stokes/msmc_makeMappabilityMask.out
#SBATCH -e /global/home/users/peter_stokes/msmc_makeMappabilityMask.err
#SBATCH --mail-user=peter_stokes@berkeley.edu
#SBATCH --mail-type=All

module load python/2.7
module load scipy/1.0.0

/global/scratch/peter_stokes/msmc/analysis/msmc_tools_master/makeMappabilityMask.py

#After it runs, change the name, comes out wierd
#Make sure to edit MappabilityMask.py with your files