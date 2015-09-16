#!/bin/csh

# Note: Leave RHRS angle positive, but know that it will
# be to the right of the beamline. This is done by including
# the negative in the echo line below.
set rhrsAngle=17.0
rm rhrsAngle.txt
echo "-$rhrsAngle" > rhrsAngle.txt
printf "rhrsAngle: -%f\n" $rhrsAngle
#set beamE="1.2450"
#set beamE="2.4250"
set beamE="3.6050"
echo "$beamE" > beame.txt
printf "beamE: $beamE GeV\n"

python set_angles.py

cp ../database_io/geometry/det_legend.txt ../output/.
cp ../database_io/geometry/part_legend.txt ../output/.
