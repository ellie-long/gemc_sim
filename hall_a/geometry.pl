#!/usr/bin/perl -w

# loading GEMC geometry routines
use strict;
use lib ("$ENV{GEMC}/io");
use utils;
use geometry;

# Define the Help Message
sub help()
{
	print "\n Usage: \n";
	print "   geometry.pl <configuration filename>\n";
 	print "   Will create a paddle using the variation specified in the configuration file\n";
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

sub build_target_cell
{
	my %detector = init_det();
	$detector{"name"}        = "target";
	$detector{"mother"}      = "3he_holding_field";
	$detector{"description"} = "3He target";
	$detector{"pos"}         = "0*cm 0*cm 0*cm";
	$detector{"rotation"}    = "0*deg 0*deg 0*deg";
	$detector{"color"}       = "00BFFF";
	$detector{"type"}        = "Tube";
	$detector{"dimensions"}  = "0*cm 0.6*cm 20*cm 0*deg 360*deg";
#	$detector{"dimensions"}  = "0*cm 0.6*cm 4000*cm 0*deg 360*deg";
	$detector{"material"}    = "3He_Cell";
	$detector{"visible"}     = 1;
	$detector{"style"}       = 1;
	print_det(\%configuration, \%detector);
}

sub build_target_holding_field
{
	my %detector = init_det();
	$detector{"name"}        = "3he_holding_field";
	$detector{"mother"}      = "root";
	$detector{"description"} = "Magnetic Holding Field";
	$detector{"pos"}         = "0*cm 0*cm 0*cm";
	$detector{"rotation"}    = "0*deg 0*deg 0*deg";
	$detector{"color"}       = "FFD700";
	$detector{"type"}        = "Sphere";
	$detector{"dimensions"}  = "0*cm 50*cm 0*deg 360*deg 0*deg 180*deg";
#	$detector{"material"}    = "Air_Opt";
#	$detector{"material"}    = "Vacuum";
	$detector{"visible"}     = 1;
	$detector{"style"}       = 0;
	$detector{"mfield"}	 	 = "3He_holding_field";
	print_det(\%configuration, \%detector);

}


sub build_rhrs
{
#	my $deg				= -12;
	my $deg				= 0;
	my $rot				= -$deg;
	my $r				= 1038;
	my $angle			= $deg*0.0174532925; # Degree -> Radians
	my $x				= $r*sin($angle);
	my $z				= $r*cos($angle);
	my $rhrs_placement	= $x."*cm 213.5*cm ".$z."*cm";
	my $rhrs_rotation	= "0*deg ".$rot."*deg 0*deg";
	printf($rhrs_placement);

	my %detector = init_det();
	$detector{"name"}       	= "rhrs";
	$detector{"mother"}     	= "root";
	$detector{"description"}	= "RHRS";
	$detector{"pos"}        	= $rhrs_placement;
	$detector{"rotation"}   	= $rhrs_rotation;
	$detector{"color"}	        = "B0E0E6";
	$detector{"type"}       	= "Box";
	$detector{"dimensions"} 	= "358.15*cm 518.5*cm 1038*cm";
	$detector{"visible"}    	= 1;
	$detector{"style"}      	= 0;
	$detector{"mfield"}      	= "no";
	print_det(\%configuration, \%detector);

	$detector{"name"}       	= "rdipole";
	$detector{"mother"}     	= "rhrs";
	$detector{"description"}	= "RHRS Dipole Magnet-P1";
#	$detector{"pos"}        	= "0*cm -213.5*cm 293.3*cm";
	$detector{"pos"}        	= "0*cm -117.38*cm 293.3*cm";
	$detector{"rotation"}   	= "0*deg 0*deg 0*deg";
	$detector{"color"}	        = "B0E0E6";
	$detector{"type"}       	= "Box";
	$detector{"dimensions"} 	= "107.63*cm 205*cm 381*cm";
#	$detector{"dimensions"} 	= "107.63*cm 350*cm 381*cm";
	$detector{"visible"}    	= 1;
	$detector{"style"}      	= 1;
	$detector{"mfield"}			= "dipole_1.17591GeV";
	print_det(\%configuration, \%detector);

	$detector{"name"}       	= "rq1";
	$detector{"mother"}     	= "rhrs";
	$detector{"description"}	= "RHRS Q1 Magnet";
	$detector{"pos"}        	= "0*cm -213.5*cm -829*cm";
	$detector{"rotation"}   	= "0*deg 0*deg 0*deg";
	$detector{"color"}	        = "B0E0E6";
	$detector{"type"}       	= "Tube";
	$detector{"dimensions"} 	= "0*cm 45.72*cm 40*cm 0*deg 360*deg";
	$detector{"visible"}    	= 1;
	$detector{"style"}      	= 1;
	$detector{"mfield"}			= "q1_1.17591GeV";
	print_det(\%configuration, \%detector);

	$detector{"name"}       	= "rq2";
	$detector{"mother"}     	= "rhrs";
	$detector{"description"}	= "RHRS Q2 Magnet";
	$detector{"pos"}        	= "0*cm -213.5*cm -545*cm";
	$detector{"rotation"}   	= "0*deg 0*deg 0*deg";
	$detector{"color"}	        = "B0E0E6";
	$detector{"type"}       	= "Tube";
	$detector{"dimensions"} 	= "0*cm 74.93*cm 90*cm 0*deg 360*deg";
	$detector{"visible"}    	= 1;
	$detector{"style"}      	= 1;
	$detector{"mfield"}			= "q2_1.17591GeV";
	print_det(\%configuration, \%detector);

	$detector{"name"}       	= "rq3";
	$detector{"mother"}     	= "rhrs";
	$detector{"description"}	= "RHRS Q2 Magnet";
	$detector{"pos"}        	= "0*cm 202.42*cm 721.92*cm";
	$detector{"rotation"}   	= "45*deg 0*deg 0*deg";
	$detector{"color"}	        = "B0E0E6";
	$detector{"type"}       	= "Tube";
	$detector{"dimensions"} 	= "0*cm 74.93*cm 90*cm 0*deg 360*deg";
	$detector{"visible"}    	= 1;
	$detector{"style"}      	= 1;
	$detector{"mfield"}			= "q3_1.17591GeV";
	print_det(\%configuration, \%detector);

	$detector{"name"}       	= "electron_det_package";
	$detector{"mother"}     	= "root";
	$detector{"description"}	= "Electron Detector Package";
	$detector{"pos"}        	= $rhrs_placement;
	$detector{"rotation"}   	= $rhrs_rotation;
	$detector{"color"}	        = "B0E0E6";
	$detector{"type"}       	= "Box";
	$detector{"dimensions"} 	= "358.15*cm 518.5*cm 1038*cm";
	$detector{"visible"}    	= 1;
	$detector{"style"}      	= 0;
	$detector{"mfield"}      	= "no";
	print_det(\%configuration, \%detector);

}

sub build_hand
{
	my %detector = init_det();
	$detector{"name"}        = "hand";
	$detector{"mother"}      = "root";
	$detector{"description"} = "Hall A Neutron Detector";
#                                 x      y     z where z=beam direction, y=Ay0 direction
	$detector{"pos"}         = "769*cm 0*cm 220*cm";
	$detector{"rotation"}    = "0*deg -74*deg 0*deg";
	$detector{"color"}       = "969696";
	$detector{"type"}        = "Box";
#	$detector{"dimensions"}  = "100*cm 320*cm 40*cm";
	$detector{"dimensions"}  = "50*cm 160*cm 20*cm";
#	$detector{"material"}    = "G4_GLASS_LEAD";
	$detector{"material"}    = "scintillator";
	$detector{"visible"}     = 1;
	$detector{"style"}       = 1;
	print_det(\%configuration, \%detector);

#	%detector = init_det();
#	$detector{"name"}        = "dummy_hand";
#	$detector{"mother"}      = "root";
#	$detector{"description"} = "dummy";
#                                 x      y     z where z=beam direction, y=Ay0 direction
#	$detector{"pos"}         = "-769*cm 0*cm 220*cm";
#	$detector{"rotation"}    = "0*deg 74*deg 0*deg";
#	$detector{"color"}       = "339999";
#	$detector{"type"}        = "Box";
#	$detector{"dimensions"}  = "100*cm 320*cm 40*cm";
#	$detector{"dimensions"}  = "50*cm 160*cm 20*cm";
#	$detector{"material"}    = "G4_GLASS_LEAD";
#	$detector{"material"}    = "scintillator";
#	$detector{"visible"}     = 1;
#	$detector{"style"}       = 1;
#	print_det(\%configuration, \%detector);

}


#build_hand();
build_rhrs();
#build_target_holding_field();
#build_target_cell();
