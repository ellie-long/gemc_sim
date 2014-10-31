#!/bin/csh

./materials.pl config.dat
./geometry.pl config.dat

gemc \
-gcard=hall_a.gcard \
-HALL_MATERIAL=Vacuum \
#-HALL_MATERIAL=Air_Opt \
-DEFAULT_MATERIAL=Vacuum \
#-DEFAULT_MATERIAL=Air_Opt \
-EXEC_MACRO=g4_settings.config \
-FIELD_DIR=./field \
#-HALL_FIELD=halla_field \
-FIELD_VERBOSITY=1 \


