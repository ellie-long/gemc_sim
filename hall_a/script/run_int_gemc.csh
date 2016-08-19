#!/bin/csh
#set printf
#set verbose

set now=`date +"%Y-%m-%d-%T.%4N"`
#set now="$PBS_JOBID"
printf "$now\n"

#set particle="neutron"
set particle="proton"

#echo "1.2450" > beame.txt
echo "2.4250" > beame.txt
#echo "3.6050" > beame.txt

#echo "3.6051" > beame.txt

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

if ( $beame == "1.2450" ) then
	set pn="0.393905"
	set dp="0.0793339"
	set th="88"
	set dth="6.5"
	set dph="19.5"
else if ( $beame == "2.4250" ) then
	set pn="0.736819"
	set dp="0.0424121"
	set th="79.5"
	set dth="4.5"
	set dph="14"
else if ( $beame == "3.6050" ) then
	set pn="1.05507"
	set dp="0.0296188"
	set th="71"
	set dth="3.3"
	set dph="10.8"
endif

printf "Loading materials, geometry, and fields...\n" #| tee $outStdOut
../database_io/field/make_field.pl #| tee -a $outStdOut 
../database_io/materials/materials.pl config.dat #| tee -a $outStdOut
../database_io/geometry/geometry.pl config.dat #| tee -a $outStdOut
../database_io/banks/hit.pl config.dat #| tee -a $outStdOut
../database_io/banks/bank.pl config.dat #| tee -a $outStdOut
#../database_io/geometry/hand_geometry.pl config.dat #| tee -a $outStdOut
#../database_io/geometry/full_hall_geometry.pl config.dat #| tee -a $outStdOut
#../database_io/geometry/geometry_test.pl config.dat

printf "Finished loading materials, geometry, and fields!\n" #| tee -a $outStdOut
printf "Starting gemc...\n" #| tee -a $outStdOut

gemc \
-gcard=hall_a_int.gcard \
-OUTPUT="evio,$outEvio" \
-USE_GUI=0 \
-FIELD_DIR=../database_io/field \
#-BEAM_V="(0, 0, -500) cm" \
-BEAM_V="(0, 0, -500) cm" \
-LOG_MSG=1 \
-HIT_VERBOSITY=0 \
-HIT_PROCESS_LIST="clas12" \
-G4TRACK_VERBOSITY=0 \
-HALL_MATERIAL=Vacuum \
-HALL_DIMENSIONS="40*m, 40*m, 40*m" \
-MAX_X_POS=40000 \
-MAX_Y_POS=40000 \
-MAX_Z_POS=40000 \
#-MAX_X_POS=40000 \
#-MAX_Y_POS=40000 \
#-MAX_Z_POS=40000 \
-BEAM_P="${particle}, ${pn}*GeV, ${th}*deg, 0*deg" \
-SPREAD_P="${dp}*GeV, ${dth}*deg, ${dph}*deg" \
#-BEAM_P="neutron, 0.393905*GeV, 71*deg, 0*deg" \
#-BEAM_P="proton, 0.393905*GeV, 71*deg, 0*deg" \
#-BEAM_P="neutron, 0.736819*GeV, 71*deg, 0*deg" \
#-BEAM_P="proton, 0.736819*GeV, 71*deg, 0*deg" \
#-BEAM_P="proton, 1.05507*GeV, 71*deg, 0*deg" \
#-BEAM_P="neutron, 1.05507*GeV, 71*deg, 0*deg" \
#-SPREAD_P="0.0793339*GeV, 0.5*deg, 0.5*deg" \
#-SPREAD_P="0.0424121*GeV, 0.5*deg, 0.5*deg" \
#-SPREAD_P="0.0296188*GeV, 0.5*deg, 0.5*deg" \
-N=1000000 \ 
#-N=1 \ 
#-ENERGY_CUT=50 \
#-BEAM_P="neutron, 1.05507*GeV, 71*deg, 0*deg" \
#-gcard=hall_a_test.gcard \
#-gcard=hall_a_mysql.gcard \
#-EXEC_MACRO=g4_settings.config \
#-N=10 \
#-DBUSER=root \
#-BEAM_P="e-, 1.2450*GeV, $rhrsAngle*deg, 0*deg" \
#-BEAM_P="e-, 2.4250*GeV, $rhrsAngle*deg, 0*deg" \
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
evio2root -B=ctof -INPUTF=$outEvio #| tee -a $outStdOut 
mv $tempRoot $outRoot #| tee -a $outStdOut 
printf "Finished evio2root!\n" #| tee -a $outStdOut
#rm $outEvio
#rm temp*
