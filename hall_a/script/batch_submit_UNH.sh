#!/bin/bash -l
#PBS -l walltime=4:00:00,nodes=1:ppn=1,pmem=1gb
#PBS -N gemc_halla
#PBS -m a
#PBS -e /net/home/elong/gemc_sim/hall_a/logs/err/gemc_halla-$PBS_JOBID.err
#PBS -o /net/home/elong/gemc_sim/hall_a/logs/out/gemc_halla-$PBS_JOBID.out
#PBS -M elong@physics.unh.edu
cd $PBS_O_WORKDIR
./run_unh_batch.csh
