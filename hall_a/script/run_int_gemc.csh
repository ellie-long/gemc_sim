#!/bin/csh
#set printf
#set verbose

set now=`date +"%Y-%m-%d-%T.%4N"`
#set now="$PBS_JOBID"
printf "$now\n"

#echo "1.2450" > beame.txt
#echo "2.4250" > beame.txt
#echo "3.6050" > beame.txt
echo "3.6051" > beame.txt

set beamv=`cat temp_beamv.txt`
set beame=`cat beame.txt`
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
-gcard=hall_a_int.gcard \
-OUTPUT="evio,$outEvio" \
-FIELD_DIR=../database_io/field \
#-BEAM_V="(0, 0, -500) cm" \
-BEAM_V="(0, 0, -500) cm" \
-LOG_MSG=1 \
-HIT_VERBOSITY=1 \
-G4TRACK_VERBOSITY=1 \
-HALL_MATERIAL=Vacuum \
-HALL_DIMENSIONS="40*m, 40*m, 40*m" \
-MAX_X_POS=40000 \
-MAX_Y_POS=40000 \
-MAX_Z_POS=40000 \
#-MAX_X_POS=40000 \
#-MAX_Y_POS=40000 \
#-MAX_Z_POS=40000 \
#-BEAM_P="proton, 1.05507*GeV, 71*deg, 0*deg" \
-BEAM_P="proton, 1.05507*GeV, 0*deg, 0*deg" \
#-SPREAD_P="0.0296188*GeV, 10.0*deg, 10.0*deg" \
-SPREAD_P="0.0296188*GeV, 5.0*deg, 5.0*deg" \
-N=1 \ 
#-ENERGY_CUT=50 \
#-BEAM_P="neutron, 1.05507*GeV, 71*deg, 0*deg" \
#-USE_GUI=0 \
#-BANK_DATABASE=user_banks \
#-gcard=hall_a_test.gcard \
#-gcard=hall_a_mysql.gcard \
#-EXEC_MACRO=g4_settings.config \
#-N=10 \
#-DBUSER=root \
#-BEAM_P="e-, 1.2450*GeV, $rhrsAngle*deg, 0*deg" \
#-BEAM_P="e-, 2.4250*GeV, $rhrsAngle*deg, 0*deg" \
#-BEAM_P="e-, $beame*GeV, $rhrsAngle*deg, 0*deg" \
#   Neutron for Q^2=1 GeV^2
#-BEAM_V="$beamv" \
#-HALL_MATERIAL=Air_Opt \
#-DBHOST=$GEMC_HOST \
#-DEFAULT_MATERIAL=Vacuum \
#-DEFAULT_MATERIAL=Air_Opt \
#-OUTPUT="txt,test.txt" \
#-HALL_FIELD=halla_field \
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
#rm $outEvio
#rm temp*
