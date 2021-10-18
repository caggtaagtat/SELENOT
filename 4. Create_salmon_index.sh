#!/bin/bash
#PBS -l select=1:ncpus=4:mem=80gb
#PBS -l walltime=71:59:59
#PBS -r n
#PBS -N Rscripts

## Go to salmon directory
cd /project/salmon/

## Building the salmon index
salmon index -t /salmon/Homo_sapiens.GRCh38.cdna.all.fa -p 4 -i salmon_index -k 31