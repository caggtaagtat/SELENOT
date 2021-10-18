#!/bin/bash
#PBS -l select=1:ncpus=1:mem=1gb
#PBS -l walltime=71:59:59
#PBS -r n
#PBS -N Rscripts

## Change directory
cd /project/salmon/

## Create new directory for output files
mkdir /project/salmon/final_files/

## Gather every file with ending ".quant"
find /project/salmon/quants/ -name "*.quant" | while read SAMPLE

do

## Go to directory
cd $SAMPLE

## Get sole file name
FILEBASE=$(basename "${SAMPLE%.quant}")

## Move salmon results file to output directory
mv quant.sf /project/salmon/final_files/$FILEBASE.quant.sf

done 
