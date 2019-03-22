#!/usr/bin/env bash
#SBATCH -D /global/scratch/peter_stokes/msmc/analysis/wild_bams OR landrace_bams
#SBATCH -J msmc_bamCallerPipe
#SBATCH --partition=savio
#SBATCH --account=co_rosalind 
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --time=24:00:00
#SBATCH --mem=64000
#SBATCH -o /global/home/users/peter_stokes/msmc_bamCallerPipe.out
#SBATCH -e /global/home/users/peter_stokes/msmc_bamCallerPipe.err
#SBATCH --mail-user=peter_stokes@berkeley.edu
#SBATCH --mail-type=All

module load samtools/1.8 
module load bcftools/1.6

samtools mpileup -q 20 -Q 20 -C 50 -u -r <chr> -f <ref.fa> <bam> | bcftools call -c -V indels |
./bamCaller.py <mean_cov> <out_mask.bed.gz> | gzip -c > <out.vcf.gz>