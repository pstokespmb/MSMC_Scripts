#!/usr/bin/env bash
#SBATCH -D /global/scratch/peter_stokes/msmc/analysis/wild_bams
#SBATCH -J msmc_bamCallerPipe_annKS2W-35
#SBATCH --partition=savio
#SBATCH --account=co_rosalind 
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --time=24:00:00
#SBATCH --mem=64000
#SBATCH -o /global/home/users/peter_stokes/msmc_bamCallerPipe_annKS2W-35.out
#SBATCH -e /global/home/users/peter_stokes/msmc_bamCallerPipe_annKS2W-35.err
#SBATCH --mail-user=peter_stokes@berkeley.edu
#SBATCH --mail-type=All

module load samtools/1.8 
module load bcftools/1.6
module load python/3.6

samtools mpileup -q 20 -Q 20 -C 50 -u -r HanXRQChr01 -f HanXRQr1.0-20151230_ch01_to_17.fa annKS2W-35_sorted_markdup_recal.bam | bcftools call -c -V indels |
/global/scratch/peter_stokes/msmc/practice/msmc-tools-master/bamCaller.py 4.63 annKS2W-35_HanXRQChr01_mask.bed.gz | gzip -c > annKS2W-35_HanXRQChr01.vcf.gz