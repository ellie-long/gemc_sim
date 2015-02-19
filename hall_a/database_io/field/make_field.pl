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
my $r = 300;
my $x = $r*sin($rhrsAngleRad);
my $y = 0;
my $z = $r*cos($rhrsAngleRad);
my $rhrsAngleFlip = -$rhrsAngle;

sub make_1_17597GeV
{

	# Create and print Q1 
	$r = 300;
	$x = $r*sin($rhrsAngleRad);
	$y = 0;
	$z = $r*cos($rhrsAngleRad);
	open my $fh, '>', '../database_io/fields/q1_1.1759GeV.txt';
	print {$fh} "<mfield>\n";
	print {$fh} "	<description name=\"q1_1.17591GeV\" factory=\"ASCII\" comment=\"RHRS Q1 Magnet\"/>\n";
	print {$fh}	"	<symmetry type=\"multipole\" format=\"simple\" integration=\"RungeKutta\"/>\n";
	print {$fh} "	<dimension Npole=\"4\" scale=\"-229\" x=\"".$x."\" y=\"".$y."\" z=\"".$z."\" rot=\"".$rhrsAngleFlip."\" ROTaxis=\"Y\"/>\n";
	print {$fh} "</mfield>\n";
	close $fh;

}
