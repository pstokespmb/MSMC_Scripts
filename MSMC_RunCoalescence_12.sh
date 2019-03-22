#!/usr/bin/env bash
#SBATCH -D /global/scratch/peter_stokes/msmc/practice/msmc-tools-master
#SBATCH -J msmc_RunCoalescence
#SBATCH --partition=savio
#SBATCH --account=co_rosalind 
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --time=24:00:00
#SBATCH --mem=64000
#SBATCH -o /global/home/users/peter_stokes/msmc_RunCoalescence.out
#SBATCH -e /global/home/users/peter_stokes/msmc_RunCoalescence.err
#SBATCH --mail-user=peter_stokes@berkeley.edu
#SBATCH --mail-type=All

module load msmc2/2.1.2

INPUTDIR=/global/scratch/peter_stokes/msmc/analysis/msmc_out
OUTDIR=/global/scratch/peter_stokes/msmc/analysis/msmc_out

msmc2 -t 20 -I 0-4,0-5,0-6,0-7,1-4,1-5,1-6,1-7,2-4,2-5,2-6,2-7,3-4,3-5,3-6,3-7 -s -p 1*2+15*1+1*2 -o $OUTDIR/WildNMWY_LRHopis.chr1.msmc2 $INPUTDIR/WildNMWY_LRHopis.chr1.multihetsep.txt