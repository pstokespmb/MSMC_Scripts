#!/usr/bin/env bash
#SBATCH -D /global/scratch/peter_stokes/msmc/practice/msmc-tools-master
#SBATCH -J msmc_dataprep2_practice
#SBATCH --partition=savio
#SBATCH --account=co_rosalind 
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --time=24:00:00
#SBATCH --mem=64000
#SBATCH -o /global/home/users/peter_stokes/msmc_dataprep2_practice.out
#SBATCH -e /global/home/users/peter_stokes/msmc_dataprep2_practice.err
#SBATCH --mail-user=peter_stokes@berkeley.edu
#SBATCH --mail-type=All

module load python/3.6
module load scipy/1.0.0

INDIR=/global/scratch/peter_stokes/msmc/practice/outs
OUTDIR=/global/scratch/peter_stokes/msmc/practice/outs
MAPDIR=/global/scratch/peter_stokes/msmc/practice/MSMC-tutorial-files
/global/scratch/peter_stokes/msmc/practice/msmc-tools-master/generate_multihetsep.py --chr 1 \
    --mask $INDIR/NA12878.chr1.mask.bed.gz --mask $INDIR/NA12891.chr1.mask.bed.gz --mask $INDIR/NA12892.chr1.mask.bed.gz \
    --mask $INDIR/NA19240.chr1.mask.bed.gz --mask $INDIR/NA19238.chr1.mask.bed.gz --mask $INDIR/NA19239.chr1.mask.bed.gz \
    --mask $MAPDIR/hs37d5_chr1.mask.bed --trio 0,1,2 --trio 3,4,5 \
    $INDIR/NA12878.chr1.vcf.gz $INDIR/NA12891.chr1.vcf.gz $INDIR/NA12892.chr1.vcf.gz \
    $INDIR/NA19240.chr1.vcf.gz $INDIR/NA19238.chr1.vcf.gz $INDIR/NA19239.chr1.vcf.gz \
    > $OUTDIR/EUR_AFR.chr1.multihetsep.txt