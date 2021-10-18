#!/bin/bash
#PBS -l select=1:ncpus=2:mem=2gb
#PBS -l walltime=70:59:59
#PBS -r n
#PBS -N Rscripts

## Change directory
cd /project/sortMeRNA/

## Make output directory
mkdir files

## For every file with ending ".trim.fq" 
find /project/sortMeRNA/ -name "*.trim.fq" | while read SAMPLE

do

## Get sole file name
FILEBASE=$(basename "${SAMPLE%.trim.fq}")

## Delete blank lines
awk 'NF' $SAMPLE >  /project/sortMeRNA/files/$FILEBASE.fq

done 

