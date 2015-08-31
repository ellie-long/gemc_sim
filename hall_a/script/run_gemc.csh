#!/bin/csh
#set printf
#set verbose

#set now=`date +"%Y-%m-%d-%T.%4N"`
set now="$PBS_JOBID"
printf "$now\n"

set beamv=`cat temp_beamv.txt`
set rhrsAngleIn=`cat rhrsAngle.txt`
set rhrsAngle=`echo "$rhrsAngleIn * -1" | bc`
set outFolder="../output"
set logFolder="../logs"
set outEvio="$outFolder/evio/$now-output.evio"
set tempRoot="$outFolder/evio/$now-output.root"
set outRoot="$outFolder/root/$now-output.root"
set outStdOut="$logFolder/$now-stdout.log"
#set outStdErr="$outFolder/stderr.log"

printf "Loading materials, geometry, and fields...\n" #| tee $outStdOut
../database_io/field/make_field.pl #| tee -a $outStdOut 
../database_io/materials/materials.pl config.dat #| tee -a $outStdOut
../database_io/geometry/geometry.pl config.dat #| tee -a $outStdOut
#../database_io/geometry/geometry_test.pl config.dat

printf "Finished loading materials, geometry, and fields!\n" #| tee -a $outStdOut
printf "Starting gemc...\n" #| tee -a $outStdOut

gemc \
-gcard=hall_a.gcard \
#-gcard=hall_a_test.gcard \
#-gcard=hall_a_mysql.gcard \
-BANK_DATABASE=user_banks \
-USE_GUI=0 \
#-EXEC_MACRO=g4_settings.config \
#-N=10 \
#-DBUSER=root \
#-BEAM_P="e-, 1.17591*GeV, $rhrsAngle*deg, 0*deg" \
-BEAM_P="e-, 1.2450*GeV, $rhrsAngle*deg, 0*deg" \
#-BEAM_P="e-, 2.4250*GeV, $rhrsAngle*deg, 0*deg" \
-BEAM_V="$beamv" \
-HALL_MATERIAL=Vacuum \
-HALL_DIMENSIONS="40*m, 40*m, 40*m" \
-MAX_X_POS=40000 \
-MAX_Y_POS=40000 \
-MAX_Z_POS=40000 \
#-HALL_MATERIAL=Air_Opt \
#-DBHOST=$GEMC_HOST \
#-DEFAULT_MATERIAL=Vacuum \
#-DEFAULT_MATERIAL=Air_Opt \
-FIELD_DIR=../database_io/field \
#-OUTPUT="txt,test.txt" \
-OUTPUT="evio,$outEvio" \
#-HALL_FIELD=halla_field \
#-HIT_VERBOSITY=1 \
#-GUI_VERBOSITY=1 \
#-FIELD_VERBOSITY=1 \
#-GEO_VERBOSITY=1 \
#-MATERIAL_VERBOSITY=1 \
#| tee -a $outStdOut

printf "Finished gemc!\n" #| tee -a $outStdOut
printf "Starting evio2root...\n" #| tee -a $outStdOut
evio2root -INPUTF=$outEvio #| tee -a $outStdOut 
mv $tempRoot $outRoot #| tee -a $outStdOut 
printf "Finished evio2root!\n" #| tee -a $outStdOut
rm $outEvio
#rm temp*
