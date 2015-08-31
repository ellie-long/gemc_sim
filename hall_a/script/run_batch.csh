#!/bin/tcsh

setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:${JLAB_SOFTWARE}/clhep/${CLHEP_VERSION}/lib:${JLAB_SOFTWARE}/geant4/${GEANT4_VERSION}/lib64:${JLAB_SOFTWARE}/ccdb/ccdb_${CCDB_VERSION}/lib
cd /net/home/elong/gemc_sim/hall_a/script
./run_gemc.csh
