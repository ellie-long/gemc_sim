#!/bin/csh

../database_io/materials/materials.pl config.dat
#../database_io/geometry/geometry.pl config.dat
../database_io/geometry/geometry_test.pl config.dat

gemc \
-gcard=hall_a.gcard \
#-gcard=hall_a.gcard.bak \
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
#-OUTPUT="evio,test.evio" \
#-HALL_FIELD=halla_field \
#-HIT_VERBOSITY=1 \
#-GUI_VERBOSITY=1 \
#-FIELD_VERBOSITY=1 \
#-GEO_VERBOSITY=1 \
#-MATERIAL_VERBOSITY=1 \

#evio2root -INPUTF=test.evio -OUTPUT=test.root

