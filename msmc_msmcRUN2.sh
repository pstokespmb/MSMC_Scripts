#!/usr/bin/env bash
#SBATCH -D /global/scratch/peter_stokes/msmc/practice/msmc-tools-master
#SBATCH -J msmc_msmcRUN2
#SBATCH --partition=savio
#SBATCH --account=co_rosalind 
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --time=24:00:00
#SBATCH --mem=64000
#SBATCH -o /global/home/users/peter_stokes/msmc_msmcRUN2.out
#SBATCH -e /global/home/users/peter_stokes/msmc_msmcRUN2.err
#SBATCH --mail-user=peter_stokes@berkeley.edu
#SBATCH --mail-type=All

module load msmc2/2.1.2

INPUTDIR=/global/scratch/peter_stokes/msmc/practice/outs
OUTDIR=/global/scratch/peter_stokes/msmc/practice/outs

msmc2 -t 4 -I 0-4,0-5,1-4,1-5 -s -p 1*2+15*1+1*2 -o $OUTDIR/AFR_EUR.msmc2 $INPUTDIR/EUR_AFR.chr1.multihetsep.txt