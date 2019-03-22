#!/usr/bin/env bash
#SBATCH -D /global/scratch/peter_stokes/msmc/practice/msmc-tools-master
#SBATCH -J msmc_dataprep3_practice
#SBATCH --partition=savio
#SBATCH --account=co_rosalind 
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --time=24:00:00
#SBATCH --mem=64000
#SBATCH -o /global/home/users/peter_stokes/msmc_dataprep3_practice.out
#SBATCH -e /global/home/users/peter_stokes/msmc_dataprep3_practice.err
#SBATCH --mail-user=peter_stokes@berkeley.edu
#SBATCH --mail-type=All

module load python/3.6
module load scipy/1.0.0
DIR=/global/scratch/peter_stokes/msmc/practice/outs

/global/scratch/peter_stokes/msmc/practice/msmc-tools-master/combineCrossCoal.py $DIR/AFR_EUR.msmc2.final.txt $DIR/EUR.msmc2.final.txt \
    $DIR/AFR.msmc2.final.txt > $DIR/EUR_AFR.combined.msmc2.final.txt