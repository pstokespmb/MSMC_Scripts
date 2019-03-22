#!/usr/bin/env bash
#SBATCH -D /global/scratch/peter_stokes/msmc/practice/msmc-tools-master
#SBATCH -J msmc_RunDemography
#SBATCH --partition=savio
#SBATCH --account=co_rosalind 
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --time=24:00:00
#SBATCH --mem=64000
#SBATCH -o /global/home/users/peter_stokes/msmc_RunDemography.out
#SBATCH -e /global/home/users/peter_stokes/msmc_RunDemography.err
#SBATCH --mail-user=peter_stokes@berkeley.edu
#SBATCH --mail-type=All

module load msmc2/2.1.2

INPUTDIR=/global/scratch/peter_stokes/msmc/analysis/msmc_out
OUTDIR=/global/scratch/peter_stokes/msmc/analysis/msmc_out

msmc2 -t 20 -p 1*2+15*1+1*2 -o $OUTDIR/WildNMWY.msmc2 -I 0,1,2,3 $INPUTDIR/WildNMWY_LRHopis.chr1.multihetsep.txt
msmc2 -t 20 -p 1*2+15*1+1*2 -o $OUTDIR/LRHopis.msmc2 -I 4,5,6,7 $INPUTDIR/WildNMWY_LRHopis.chr1.multihetsep.txt