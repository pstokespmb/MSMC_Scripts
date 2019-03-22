#!/usr/bin/env bash
#SBATCH -D /global/scratch/peter_stokes/msmc/analysis/msmc_ins
#SBATCH -J msmc_GenMultihepsep
#SBATCH --partition=savio
#SBATCH --account=co_rosalind 
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --time=24:00:00
#SBATCH --mem=64000
#SBATCH -o /global/home/users/peter_stokes/msmc_GenMultihepsep.out
#SBATCH -e /global/home/users/peter_stokes/msmc_GenMultihepsep.err
#SBATCH --mail-user=peter_stokes@berkeley.edu
#SBATCH --mail-type=All

module load python/3.6
module load scipy/1.0.0

INDIR=/global/scratch/peter_stokes/msmc/analysis/msmc_ins
OUTDIR=/global/scratch/peter_stokes/msmc/analysis/msmc_out
MAPDIR=/global/scratch/peter_stokes/msmc/analysis/msmc_map
/global/scratch/peter_stokes/msmc/practice/msmc-tools-master/generate_multihetsep.py --chr HanXRQChr01 \
    --mask $INDIR/annNM_HanXRQChr01_mask.bed.gz --mask $INDIR/annWY_HanXRQChr01_mask.bed.gz \
    --mask $INDIR/Hopi_PPN285_HanXRQChr01_mask.bed.gz --mask $INDIR/PPN083_HanXRQChr01_mask.bed.gz \
    --mask $MAPDIR/HanXRQr1.0-20151230_ch01_MASK_100_50.mask.bed \
    $INDIR/annNM_HanXRQChr01.vcf.gz $INDIR/annWY_HanXRQChr01.vcf.gz \
    $INDIR/Hopi_PPN285_HanXRQChr01.vcf.gz $INDIR/PPN083_HanXRQChr01.vcf.gz \
    > $OUTDIR/WildNMWY_LRHopis.chr1.multihetsep.txt

