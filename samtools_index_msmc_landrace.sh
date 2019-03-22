#!/bin/bash 
#SBATCH -D /global/scratch/peter_stokes/msmc/analysis/landrace_bams
#SBATCH -J samtools_index_msmc_LANDRACE
#SBATCH --partition=savio
#SBATCH --account=co_rosalind 
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --time=48:00:00
#SBATCH --mem=64000
#SBATCH -o /global/home/users/peter_stokes/samtools_index_msmc_samtools_index_msmc_LANDRACE.out
#SBATCH -e /global/home/users/peter_stokes/samtools_index_msmc_samtools_index_msmc_LANDRACE.err
#SBATCH --mail-user=peter_stokes@berkeley.edu
#SBATCH --mail-type=All

module load samtools/1.8

for i in /global/scratch/peter_stokes/msmc/analysis/landrace_bams/*.bam;do samtools index $i;done