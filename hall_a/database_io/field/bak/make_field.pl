#!/usr/bin/perl -w

use strict;
use warnings FATAL => 'all';
use autodie qw(:all);

# Get RHRS angle from input file
my $rhrsAngle=0;
open my $inputFile, '<', "rhrsAngle.txt" or die $!;
while (<$inputFile>){
    $rhrsAngle=$_;
}
print "RHRS Angle: ".$rhrsAngle." degrees\n";
close $inputFile or die $!;
my $rhrsAngleRad = $rhrsAngle*0.0174532925; # Degree --> Radians


sub make_1_17597GeV
{


}
