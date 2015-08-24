#!/usr/bin/env python
#
#  set_angles.py
#  
#  This script will calculate some needed angles
#  to set the beam vertex correctly until gemc
#  is updated to include magnetic field rotations
#  with respect to the detectors
#
#  Created by Elena Long on 06/16/15.
#

import os
import os.path
import math

print("vvvvv set_angles.py vvvvvvvvvvvvvvvv")
if (os.path.exists("./temp_beamv.txt")): os.remove("./temp_beamv.txt")
beamvFile = open("./temp_beamv.txt","a")

rhrsAngleFile = open("rhrsAngle.txt")
rhrsAngle = float(rhrsAngleFile.readline())

rhrsAngleRad = rhrsAngle*3.14159/180
beamx = 25*math.sin(rhrsAngleRad)
beamz = -25*math.cos(rhrsAngleRad)-500

beamv = "("+str(beamx)+", 0, "+str(beamz)+")cm"

beamvFile.write(str(beamv))

print("RHRS Angle: "+str(rhrsAngle))
print("Beam Vertex: "+beamv)
print("^^^^^ set_angles.py ^^^^^^^^^^^^^^^^")
		

