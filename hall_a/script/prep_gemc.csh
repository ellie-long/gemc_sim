#!/bin/csh

# Note: Leave RHRS angle positive, but know that it will
# be to the right of the beamline. This is done by including
# the negative in the echo line below.
set rhrsAngle=17.0
rm rhrsAngle.txt
echo "-$rhrsAngle" > rhrsAngle.txt
printf "rhrsAngle: -%f\n" $rhrsAngle

python set_angles.py

cp ../database_io/geometry/det_legend.txt ../output/.
cp ../database_io/geometry/part_legend.txt ../output/.
