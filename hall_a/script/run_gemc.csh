#!/bin/csh
#set printf
#set verbose

set now=`date +"%Y-%m-%d-%T"`
printf $now

mkdir output/$now

set outFolder="../output/"
set outEvio="$outFolder/$now-test.evio"
set outRoot="$outFolder/$now-test.root"
set outStdOut="$outFolder/$now-stdout.log 1>&2"
#set outStdErr="$outFolder/stderr.log"

printf "Loading materials, geometry, and fields...\n" | tee $outStdOut
#rm test.evio
#rm test.root
../database_io/field/make_field.pl | tee -a $outStdOut 
../database_io/materials/materials.pl config.dat | tee -a $outStdOut
../database_io/geometry/geometry.pl config.dat | tee -a $outStdOut
#../database_io/geometry/geometry_test.pl config.dat

printf "Finished loading materials, geometry, and fields!\n" | tee -a $outStdOut
printf "Starting gemc...\n" | tee -a $outStdOut

gemc \
-gcard=hall_a.gcard \
#-gcard=hall_a_test.gcard \
#-gcard=hall_a_mysql.gcard \
-BANK_DATABASE=user_banks \
-USE_GUI=0 \
-N=10 \
#-DBUSER=root \
-HALL_MATERIAL=Vacuum \
#-HALL_MATERIAL=Air_Opt \
#-DBHOST=$GEMC_HOST \
#-DEFAULT_MATERIAL=Vacuum \
#-DEFAULT_MATERIAL=Air_Opt \
#-EXEC_MACRO=g4_settings.config \
-FIELD_DIR=../database_io/field \
#-OUTPUT="txt,test.txt" \
-OUTPUT="evio,$outEvio" \
#-HALL_FIELD=halla_field \
#-HIT_VERBOSITY=1 \
#-GUI_VERBOSITY=1 \
#-FIELD_VERBOSITY=1 \
#-GEO_VERBOSITY=1 \
#-MATERIAL_VERBOSITY=1 \
| tee -a $outStdOut

printf "Finished gemc!\n" | tee -a $outStdOut
printf "Starting evio2root...\n" | tee -a $outStdOut
evio2root -INPUTF=$outEvio | tee -a $outStdOut 
#mv test.root $outRoot | tee -a $outStdOut 
printf "Finished evio2root!\n" | tee -a $outStdOut
rm $outEvio

