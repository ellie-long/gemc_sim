#!/bin/csh

echo "Loading materials, geometry, and fields..."
rm test.evio
rm test.root
../database_io/field/make_field.pl
../database_io/materials/materials.pl config.dat
../database_io/geometry/geometry.pl config.dat
#../database_io/geometry/geometry_test.pl config.dat
echo "Finished loading materials, geometry, and fields!"

echo "Starting gemc..."
gemc \
-gcard=hall_a.gcard \
#-gcard=hall_a_test.gcard \
#-gcard=hall_a_mysql.gcard \
-BANK_DATABASE=user_banks \
#-DBUSER=root \
-HALL_MATERIAL=Vacuum \
#-HALL_MATERIAL=Air_Opt \
#-DBHOST=$GEMC_HOST \
#-DEFAULT_MATERIAL=Vacuum \
#-DEFAULT_MATERIAL=Air_Opt \
-EXEC_MACRO=g4_settings.config \
-FIELD_DIR=../database_io/field \
#-OUTPUT="txt,test.txt" \
-OUTPUT="evio,test.evio" \
#-HALL_FIELD=halla_field \
#-HIT_VERBOSITY=1 \
#-GUI_VERBOSITY=1 \
#-FIELD_VERBOSITY=1 \
-GEO_VERBOSITY=1 \
-MATERIAL_VERBOSITY=1 \

echo "Finished gemc!"

echo "Starting evio2root..."
evio2root -INPUTF=test.evio 
echo "Finished evio2root!"
