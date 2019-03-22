#!/bin/bash 
#SBATCH -D /global/scratch/peter_stokes/msmc/practice/msmc-tools-master
#SBATCH -J msmc_dataprep1_practice
#SBATCH --partition=savio
#SBATCH --account=co_rosalind 
#SBATCH --qos=rosalind_savio_normal
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --time=24:00:00
#SBATCH --mem=64000
#SBATCH -o /global/home/users/peter_stokes/msmc_dataprep1_practice.out
#SBATCH -e /global/home/users/peter_stokes/msmc_dataprep1_practice.err
#SBATCH --mail-user=peter_stokes@berkeley.edu
#SBATCH --mail-type=All

module load python/3.6

MASTERVARDIR=/global/scratch/peter_stokes/msmc/practice/MSMC-tutorial-files/cg_data
OUTDIR=/global/scratch/peter_stokes/msmc/practice/outs
CHR=chr1
for IND in NA19238 NA19239 NA19240 NA12878 NA12891 NA12892; do
    MASTERVAR=$(ls $MASTERVARDIR/masterVarBeta-$IND-*.tsv.chr1.bz2)
    OUT_MASK=$OUTDIR/$IND.$CHR.mask.bed.gz
    OUT_VCF=$OUTDIR/$IND.$CHR.vcf.gz
    /global/scratch/peter_stokes/msmc/practice/msmc-tools-master/cgCaller.py $CHR $IND $OUT_MASK $MASTERVAR | gzip -c > $OUT_VCF
done