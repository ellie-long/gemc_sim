#!/bin/tcsh

source /u/home/ellie/production.csh
setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:${JLAB_SOFTWARE}/clhep/2.2.0.5/lib:${JLAB_SOFTWARE}/geant4/4.10.01/lib64:${JLAB_SOFTWARE}/ccdb/ccdb_1.03/lib
cd /w/halla-scifs2/e05102/ellie/gemc_sim/hall_a/script
./run_gemc.csh
