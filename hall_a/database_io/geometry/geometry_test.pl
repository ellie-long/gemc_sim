#!/usr/bin/perl -w

# loading GEMC geometry routines
use strict;
use warnings;
use lib ("$ENV{GEMC}/io");
use utils;
use geometry;

# Define the Help Message
sub help()
{
	print "\n Usage: \n";
	print "   geometry.pl <configuration filename>\n";
 	print "   Will create Hall A using the variation specified in the configuration file\n";
	exit;
}

# Make sure the argument list is correct
# If not pring the help
if( scalar @ARGV != 1)
{
	help();
	exit;
}

# Loading configuration file (first argument)
our %configuration = load_configuration($ARGV[0]);

# Get RHRS angle from input file
my $rhrsAngle=0;
open my $inputFile, '<', "rhrsAngle.txt" or die $!;
while (<$inputFile>){
	$rhrsAngle=$_;
}
print "RHRS Angle: ".$rhrsAngle." degrees\n";
close $inputFile or die $!;
my $rhrsAngleRad = $rhrsAngle*0.0174532925; # Degree --> Radians

#my $basemat="Air_Opt";
my $basemat="Vacuum";

#my $rhrsAngle=90;
#my $rhrsAngle=-12;

my $magfield="1.17591";
#my $magfield="2.18130";

sub build_hall
{

	my $r = 300;
	my $x = $r*sin($rhrsAngleRad);
	my $y = 0;
	my $z = $r*cos($rhrsAngleRad);
	my %rq1 = init_det();
	$rq1{"name"}       	= "rq1";
	$rq1{"mother"}     	= "root";
	$rq1{"description"}	= "RHRS Q1 Magnet";
	$rq1{"pos"}        	= $x."*cm ".$y."*cm ".$z."*cm";
	$rq1{"rotation"}   	= "0*deg ".$rhrsAngle."*deg 0*deg";
	$rq1{"color"}		= "B0E0E6";
	$rq1{"type"}       	= "Tube";
	$rq1{"dimensions"} 	= "0*cm 45.72*cm 40*cm 0*deg 360*deg";
	$rq1{"visible"}    	= 1;
	$rq1{"style"}      	= 1;
#	$rq1{"material"}    = "Air_Opt";
	$rq1{"material"}    = $basemat;
	$rq1{"mfield"}		= "q1_".$magfield."GeV";
	print_det(\%configuration, \%rq1);


	my %ref = init_det();
	$ref{"name"}       	= "ref";
	$ref{"mother"}     	= "root";
	$ref{"description"}	= "RHRS Q1 Magnet";
	$ref{"pos"}        	= "0*cm 50*cm 340*cm";
	$ref{"rotation"}   	= "0*deg 0*deg 0*deg";
	$ref{"color"}		= "B0E0E6";
	$ref{"type"}       	= "Box";
	$ref{"dimensions"} 	= "1*cm 10*cm 1*cm";
	$ref{"material"}	= "Vacuum";
	$ref{"visible"}    	= 1;
	$ref{"style"}      	= 1;
	print_det(\%configuration, \%ref);

}




build_hall();
