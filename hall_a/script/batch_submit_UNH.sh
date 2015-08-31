#!/bin/bash -l
#PBS -l walltime=4:00:00,nodes=1:ppn=1,pmem=1gb
#PBS -N gemc_halla
#PBS -m a
#PBS -e $PBS_O_WORKDIR/../logs
#PBS -o $PBS_O_WORKDIR/../logs
#PBS -j oe
#PBS -k oe
#PBS -M elong@physics.unh.edu
cd $PBS_O_WORKDIR
./run_unh_batch.csh
