#!/bin/csh
set start=`date +"%s.%2N"`
set now="$PBS_JOBID"
printf "$now\n"

#set outFolder="../output/$now"
set outLog="../logs/$now.log"


echo "Setting environment..." >> $outLog
setenv JLAB_ROOT /net/home/elong/opt/jlab_software
setenv JLAB_VERSION 1.2
source $JLAB_ROOT/$JLAB_VERSION/ce/jlab.csh
setenv LD_LIBRARY_PATH /net/home/elong/usr/local/lib:${LD_LIBRARY_PATH}
setenv PATH /net/home/elong/usr/local/bin:${PATH}
setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:${ROOTSYS}/lib:/usr/lib64:${JLAB_SOFTWARE}/clhep/${CLHEP_VERSION}/lib:${JLAB_SOFTWARE}/geant4/${GEANT4_VERSION}/lib64:${JLAB_SOFTWARE}/ccdb/ccdb_${CCDB_VERSION}/lib

env >> $outLog

#echo "\n\nChanging directory to --/gemc_sim/halla/script" >> $outLog
#cd /net/home/ellie/gemc_sim/hall_a/script

#echo >> "\n\nCurrent directory:" >> $outLog
#pwd >> $outLog

echo "\nRunning run_gemc.csh" >> $outLog
./run_gemc.csh >> $outLog

echo "\nRunning en_coincidence.cxx\n" >> $outLog
root -b -q ../analyze/en_coincidence.cxx >> $outLog

set end=`date +"%s.%2N"`
set elapsedTime=`echo $end-$start | bc`
echo "\n\n\nAll done!" >> $outLog
echo "\n\nElapsed time: $elapsedTime s" >> $outLog
