#!/usr/bin/perl -w

use strict;
use warnings; 
#use warnings FATAL => 'all';
#use autodie qw(:all);

# Get RHRS angle from input file
my $rhrsAngle=0;
open my $inputFile, '<', "rhrsAngle.txt" or die $!;
while (<$inputFile>){
    if ($rhrsAngle==0) {$rhrsAngle=$_;}
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
	open my $fh, '>', '../database_io/field/q1_1.1759GeV.txt' or die $!;
	print {$fh} "<mfield>\n";
	print {$fh} "	<description name=\"q1_1.17591GeV\" factory=\"ASCII\" comment=\"RHRS Q1 Magnet\"/>\n";
	print {$fh}	"	<symmetry type=\"multipole\" format=\"simple\" integration=\"RungeKutta\"/>\n";
	print {$fh} "	<dimension Npole=\"4\" scale=\"-229\" x=\"".$x."\" y=\"".$y."\" z=\"".$z."\" rot=\"".$rhrsAngleFlip."\" ROTaxis=\"Y\"/>\n";
	print {$fh} "</mfield>\n";
	close $fh or die $!;

	# Create and print Q2
	$r = 300;
	$x = $r*sin($rhrsAngleRad);
	$y = 0;
	$z = $r*cos($rhrsAngleRad);
	open $fh, '>', '../database_io/field/q2_1.1759GeV.txt' or die $!;
	print {$fh} "<mfield>\n";
	print {$fh} "	<description name=\"q2_1.17591GeV\" factory=\"ASCII\" comment=\"RHRS Q2 Magnet\"/>\n";
	print {$fh}	"	<symmetry type=\"multipole\" format=\"simple\" integration=\"RungeKutta\"/>\n";
	print {$fh} "	<dimension Npole=\"4\" scale=\"2752\" x=\"".$x."\" y=\"".$y."\" z=\"".$z."\" rot=\"".$rhrsAngleFlip."\" ROTaxis=\"Y\"/>\n";
	print {$fh} "</mfield>\n";
	close $fh or die $!;

	# Create and print Q3
	$r = 300;
	$x = $r*sin($rhrsAngleRad);
	$y = 0;
	$z = $r*cos($rhrsAngleRad);
	open $fh, '>', '../database_io/field/q3_1.1759GeV.txt' or die $!;
	print {$fh} "<mfield>\n";
	print {$fh} "	<description name=\"q3_1.17591GeV\" factory=\"ASCII\" comment=\"RHRS Q3 Magnet\"/>\n";
	print {$fh}	"	<symmetry type=\"multipole\" format=\"simple\" integration=\"RungeKutta\"/>\n";
	print {$fh} "	<dimension Npole=\"4\" scale=\"2168\" x=\"".$x."\" y=\"".$y."\" z=\"".$z."\" rot=\"".$rhrsAngleFlip."\" ROTaxis=\"Y\"/>\n";
	print {$fh} "</mfield>\n";
	close $fh or die $!;

	# Create and print Dipole
	$r = -0.4313;
	$x = $r*cos($rhrsAngleRad);
	$y = 0;
	$z = $r*sin($rhrsAngleRad);
	open $fh, '>', '../database_io/field/dipole_1.1759GeV.txt' or die $!;
	print {$fh} "<mfield>\n";
	print {$fh} "	<description name=\"dipole_1.17591GeV\" factory=\"ASCII\" comment=\"RHRS Dipole Magnet\"/>\n";
	print {$fh}	"	<symmetry type=\"uniform\" format=\"simple\" integration=\"RungeKutta\"/>\n";
	print {$fh} "	<dimension bx=\"".$x."\" by=\"".$y."\" bz=\"".$z."\" units=\"T\"/>\n";
	print {$fh} "</mfield>\n";
	close $fh or die $!;


}

make_1_17597GeV();
