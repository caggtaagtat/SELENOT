#!/bin/bash
#PBS -l select=1:ncpus=8:mem=80gb
#PBS -l walltime=71:59:59
#PBS -r n
#PBS -N Rscripts

## Change directory
cd /project/salmon/

## For every file with ending ".fq"
find /project/sortMeRNA/files/ -name "*.fq" | while read SAMPLE

do

## Get sole file name
FILEBASE=$(basename "${SAMPLE%.fq}")

## Execute salmon with normalization of GC bias and primer bias
salmon quant -i /project/salmon/salmon_index/ -l SR -r $SAMPLE -p 8 -o /project/salmon/quants/$FILEBASE.quant --seqBias --gcbias

done