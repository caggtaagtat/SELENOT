#!/bin/bash
#PBS -l select=1:ncpus=8:mem=30gb
#PBS -l walltime=71:59:59
#PBS -r n
#PBS -N Rscripts

## Go to KIR directory
cd /project/
mkdir trimmed
cd /trimmed/

## For every file with ending ".fq.gz" 
find /project/raw/ -name "*.fq.gz" | while read SAMPLE

do

#Get the sole file name, without the path and file ending
FILEBASE=$(basename "${SAMPLE%.fq.gz}")

#Trimm the file with the trimmimatic software to minimal read length of 50bp using 8 cores
java -jar trimmomatic-0.36.jar SE $SAMPLE $FILEBASE.pairedout $FILEBASE.unpairedout ILLUMINACLIP:TruSeq3_PE.fa:2:30:10 SLIDINGWINDOW:5:20 MINLEN:50 -threads 8

#End loop
done


rm *unpairedout
