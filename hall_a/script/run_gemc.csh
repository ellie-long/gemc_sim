#!/bin/csh

../database_io/materials/materials.pl config.dat
../database_io/geometry/geometry.pl config.dat

gemc \
-gcard=hall_a.gcard \
#-gcard=hall_a_mysql.gcard \
-BANK_DATABASE=user_banks \
#-DBUSER=root \
-HIT_VERBOSITY=1 \
#-GUI_VERBOSITY=1 \
-HALL_MATERIAL=Vacuum \
#-DBHOST=$GEMC_HOST \
#-HALL_MATERIAL=Air_Opt \
-DEFAULT_MATERIAL=Vacuum \
#-DEFAULT_MATERIAL=Air_Opt \
-EXEC_MACRO=g4_settings.config \
-FIELD_DIR=../database_io/field \
#-OUTPUT="txt,test.txt" \
-OUTPUT="evio,test.evio" \
#-HALL_FIELD=halla_field \
#-FIELD_VERBOSITY=1 \

evio2root test.evio test.root

