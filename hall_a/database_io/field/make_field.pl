#!/usr/bin/perl -w

use strict;
use warnings; 
#use warnings FATAL => 'all';
#use autodie qw(:all);

print "vvvvvvvvvvv make_field.pl vvvvvvvvvvvvvvvvvvvvvvvv\n"; 
print "Note: RHRS Angle for fields should be 0.0 until\n";
print "      gemc is updated to allow for rotation of\n";
print "      quadrupole magnets for multi-spectrometer\n";
print "      use.\n";
# Get RHRS angle from input file
my $rhrsAngle=0.0;
open my $inputFile, '<', "rhrsAngle.txt" or die $!;
while (<$inputFile>){
    if ($rhrsAngle==0) {$rhrsAngle=$_;}
}
$rhrsAngle = 0.0;
printf "RHRS Angle: %.2f degrees (Should read 0.0 for fields)\n", $rhrsAngle;
close $inputFile or die $!;
my $rhrsAngleRad = $rhrsAngle*3.14159/180; # Degree --> Radians
my $r = 300;
my $x = $r*sin($rhrsAngleRad);
my $y = 0;
my $z = $r*cos($rhrsAngleRad);
my $rhrsAngleFlip = -$rhrsAngle;

sub make_1_175971GeV
{

	# Create and print Q1 
	$r = 209;
	$x = $r*sin($rhrsAngleRad);
	$y = 0;
	$z = $r*cos($rhrsAngleRad)-500;
	open my $fh, '>', '../database_io/field/q1_1.17591GeV.txt' or die $!;
	print {$fh} "<mfield>\n";
	print {$fh} "	<description name=\"q1_1.17591GeV\" factory=\"ASCII\" comment=\"RHRS Q1 Magnet\"/>\n";
	print {$fh}	"	<symmetry type=\"multipole\" format=\"simple\" integration=\"RungeKutta\"/>\n";
	print {$fh} "	<dimension Npole=\"4\" scale=\"-229\" x=\"".$x."\" y=\"".$y."\" z=\"".$z."\" rot=\"".$rhrsAngleFlip."\" ROTaxis=\"Y\"/>\n";
	print {$fh} "</mfield>\n";
	close $fh or die $!;

	# Create and print Q2
	$r = 493;
	$x = $r*sin($rhrsAngleRad);
	$y = 0;
	$z = $r*cos($rhrsAngleRad)-500;
	open $fh, '>', '../database_io/field/q2_1.17591GeV.txt' or die $!;
	print {$fh} "<mfield>\n";
	print {$fh} "	<description name=\"q2_1.17591GeV\" factory=\"ASCII\" comment=\"RHRS Q2 Magnet\"/>\n";
	print {$fh}	"	<symmetry type=\"multipole\" format=\"simple\" integration=\"RungeKutta\"/>\n";
	print {$fh} "	<dimension Npole=\"4\" scale=\"2752\" x=\"".$x."\" y=\"".$y."\" z=\"".$z."\" rot=\"".$rhrsAngleFlip."\" ROTaxis=\"Y\"/>\n";
	print {$fh} "</mfield>\n";
	close $fh or die $!;

	# Create and print Q3
	$r = 1759.92;
	$x = $r*sin($rhrsAngleRad);
	$y = 415.92;
	$z = $r*cos($rhrsAngleRad)-500;
	open $fh, '>', '../database_io/field/q3_1.17591GeV.txt' or die $!;
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
#	$z = $r*sin($rhrsAngleRad)-500;
	$z = $r*sin($rhrsAngleRad);
	open $fh, '>', '../database_io/field/dipole_1.17591GeV.txt' or die $!;
	print {$fh} "<mfield>\n";
	print {$fh} "	<description name=\"dipole_1.17591GeV\" factory=\"ASCII\" comment=\"RHRS Dipole Magnet\"/>\n";
	print {$fh}	"	<symmetry type=\"uniform\" format=\"simple\" integration=\"RungeKutta\"/>\n";
	print {$fh} "	<dimension bx=\"".$x."\" by=\"".$y."\" bz=\"".$z."\" units=\"T\"/>\n";
	print {$fh} "</mfield>\n";
	close $fh or die $!;


}


sub make_2_18130GeV
{

	# Create and print Q1 
	$r = 209;
	$x = $r*sin($rhrsAngleRad);
	$y = 0;
	$z = $r*cos($rhrsAngleRad)-500;
	open my $fh, '>', '../database_io/field/q1_2.18130GeV.txt' or die $!;
	print {$fh} "<mfield>\n";
	print {$fh} "	<description name=\"q1_2.18130GeV\" factory=\"ASCII\" comment=\"RHRS Q1 Magnet\"/>\n";
	print {$fh}	"	<symmetry type=\"multipole\" format=\"simple\" integration=\"RungeKutta\"/>\n";
	print {$fh} "	<dimension Npole=\"4\" scale=\"-407.9\" x=\"".$x."\" y=\"".$y."\" z=\"".$z."\" rot=\"".$rhrsAngleFlip."\" ROTaxis=\"Y\"/>\n";
	print {$fh} "</mfield>\n";
	close $fh or die $!;

	# Create and print Q2
	$r = 493;
	$x = $r*sin($rhrsAngleRad);
	$y = 0;
	$z = $r*cos($rhrsAngleRad)-500;
	open $fh, '>', '../database_io/field/q2_2.18130GeV.txt' or die $!;
	print {$fh} "<mfield>\n";
	print {$fh} "	<description name=\"q2_2.18130GeV\" factory=\"ASCII\" comment=\"RHRS Q2 Magnet\"/>\n";
	print {$fh}	"	<symmetry type=\"multipole\" format=\"simple\" integration=\"RungeKutta\"/>\n";
	print {$fh} "	<dimension Npole=\"4\" scale=\"4914.0\" x=\"".$x."\" y=\"".$y."\" z=\"".$z."\" rot=\"".$rhrsAngleFlip."\" ROTaxis=\"Y\"/>\n";
	print {$fh} "</mfield>\n";
	close $fh or die $!;

	# Create and print Q3
	$r = 1759.92;
	$x = $r*sin($rhrsAngleRad);
	$y = 415.92;
	$z = $r*cos($rhrsAngleRad)-500;
	open $fh, '>', '../database_io/field/q3_2.18130GeV.txt' or die $!;
	print {$fh} "<mfield>\n";
	print {$fh} "	<description name=\"q3_2.18130GeV\" factory=\"ASCII\" comment=\"RHRS Q3 Magnet\"/>\n";
	print {$fh}	"	<symmetry type=\"multipole\" format=\"simple\" integration=\"RungeKutta\"/>\n";
	print {$fh} "	<dimension Npole=\"4\" scale=\"3884.0\" x=\"".$x."\" y=\"".$y."\" z=\"".$z."\" rot=\"".$rhrsAngleFlip."\" ROTaxis=\"Y\"/>\n";
	print {$fh} "</mfield>\n";
	close $fh or die $!;

	# Create and print Dipole
	$r = -0.8094507;
	$x = $r*cos($rhrsAngleRad);
	$y = 0;
	$z = $r*sin($rhrsAngleRad);
	open $fh, '>', '../database_io/field/dipole_2.18130GeV.txt' or die $!;
	print {$fh} "<mfield>\n";
	print {$fh} "	<description name=\"dipole_2.18130GeV\" factory=\"ASCII\" comment=\"RHRS Dipole Magnet\"/>\n";
	print {$fh}	"	<symmetry type=\"uniform\" format=\"simple\" integration=\"RungeKutta\"/>\n";
	print {$fh} "	<dimension bx=\"".$x."\" by=\"".$y."\" bz=\"".$z."\" units=\"T\"/>\n";
	print {$fh} "</mfield>\n";
	close $fh or die $!;


}

make_1_175971GeV();
make_2_18130GeV();


print "^^^^^^^^^^^ make_field.pl ^^^^^^^^^^^^^^^^^^^^^^^^\n"; 
