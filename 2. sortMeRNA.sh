#!/bin/bash
#PBS -l select=1:ncpus=1:mem=16gb
#PBS -l walltime=71:59:59
#PBS -r n
#PBS -N Rscripts

## Load Python
module load Python/3.4.5

## Change directory
cd /project/sortMeRNA/

## Placeholder for file name
CURRENT=Example_sample.pairedout

## Get sole file name
FILEBASE=$(basename "${CURRENT%.fq}")

## Doing sortmerna with SAMPLE
echo "Running SortMeRNA for $FILEBASE"
/sortmerna-2.1b/sortmerna --ref /sortmerna-2.1b/rRNA_databases/silva-bac-16s-id90.fasta,/sortmerna-2.1b/index/silva-bac-16s-db:/sortmerna-2.1b/rRNA_databases/silva-bac-23s-id98.fasta,/sortmerna-2.1b/index/silva-bac-23s-db:/sortmerna-2.1b/rRNA_databases/silva-arc-16s-id95.fasta,/sortmerna-2.1b/index/silva-arc-16s-db:/sortmerna-2.1b/rRNA_databases/silva-arc-23s-id98.fasta,/sortmerna-2.1b/index/silva-arc-23s-db:/sortmerna-2.1b/rRNA_databases/silva-euk-18s-id95.fasta,/sortmerna-2.1b/index/silva-euk-18s-db:/sortmerna-2.1b/rRNA_databases/silva-euk-28s-id98.fasta,/sortmerna-2.1b/index/silva-euk-28s:/sortmerna-2.1b/rRNA_databases/rfam-5s-database-id98.fasta,/sortmerna-2.1b/index/rfam-5s-db:/sortmerna-2.1b/rRNA_databases/rfam-5.8s-database-id98.fasta,/sortmerna-2.1b/index/rfam-5.8s-db --reads "$CURRENT" --aligned "${FILEBASE}-rRNA-hits.fqs" --other "${FILEBASE}.fq" --log -a 1 --fastx


