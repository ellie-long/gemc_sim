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

	my %rhrs = init_det();
	$rhrs{"name"}       	= "rhrs";
	$rhrs{"mother"}     	= "root";
	$rhrs{"description"}	= "RHRS";
	$rhrs{"pos"}        	= $rhrs_placement;
	$rhrs{"rotation"}   	= $rhrs_rotation;
	$rhrs{"color"}	        = "B0E0E6";
	$rhrs{"type"}       	= "Box";
	$rhrs{"dimensions"} 	= "358.15*cm 518.5*cm 1038*cm";
	$rhrs{"visible"}    	= 1;
	$rhrs{"style"}      	= 0;
	print_det(\%configuration, \%rhrs);

	my %dipole0 = init_det();
	$dipole0{"name"}       	= "rdipole";
	$dipole0{"mother"}     	= "rhrs";
	$dipole0{"description"}	= "RHRS Dipole Magnet";
#	$dipole0{"pos"}        	= "0*cm -117.38*cm 293.3*cm";
	$dipole0{"pos"}        	= "0*cm 626.5*cm -42*cm";
	$dipole0{"rotation"}   	= "0*deg 90*deg 0*deg";
	$dipole0{"color"}	    = "B0E0E6";
	$dipole0{"type"}       	= "Tube";
	$dipole0{"dimensions"} 	= "666.824*cm 1013.176*cm 110.63*cm 270*deg 45*deg";
#	$dipole0{"dimensions"} 	= "835*cm 845*cm 110.63*cm 270*deg 45*deg";
	$dipole0{"visible"}    	= 1;
	$dipole0{"style"}      	= 1;
	$dipole0{"mfield"}		= "dipole_1.17591GeV";
	print_det(\%configuration, \%dipole0);

	my %dipole1 = init_det();
	$dipole1{"name"}       	= "rdipole1";
	$dipole1{"mother"}     	= "rhrs";
	$dipole1{"description"}	= "RHRS Dipole Magnet1";
#	$dipole1{"pos"}        	= "0*cm -117.38*cm 293.3*cm";
	$dipole1{"pos"}        	= "0*cm -213.5*cm -42*cm";
	$dipole1{"rotation"}   	= "0*deg 90*deg 0*deg";
	$dipole1{"color"}		= "B0E0E6";
	$dipole1{"type"}       	= "Tube";
	$dipole1{"dimensions"} 	= "0*cm 173.176*cm 110.63*cm 240*deg 30*deg";
#	$dipole1{"dimensions"} 	= "835*cm 845*cm 110.63*cm 270*deg 45*deg";
	$dipole1{"visible"}    	= 1;
	$dipole1{"style"}      	= 1;
	$dipole1{"mfield"}		= "dipole_1.17591GeV";
	print_det(\%configuration, \%dipole1);

	my %dipole2 = init_det();
	$dipole2{"name"}       	= "rdipole2";
	$dipole2{"mother"}     	= "rhrs";
	$dipole2{"description"}	= "RHRS Dipole Magnet2";
#	$dipole2{"pos"}        	= "0*cm -117.38*cm 293.3*cm";
	$dipole2{"pos"}        	= "0*cm 32.53*cm 551.97*cm";
	$dipole2{"rotation"}   	= "0*deg 90*deg 0*deg";
	$dipole2{"color"}		= "B0E0E6";
	$dipole2{"type"}       	= "Tube";
	$dipole2{"dimensions"} 	= "0*cm 173.176*cm 110.63*cm 315*deg 30*deg";
#	$dipole2{"dimensions"} 	= "835*cm 845*cm 110.63*cm 270*deg 45*deg";
	$dipole2{"visible"}    	= 1;
	$dipole2{"style"}      	= 1;
	$dipole2{"mfield"}		= "dipole_1.17591GeV";
	print_det(\%configuration, \%dipole2);

	my %dipole3 = init_det();
	$dipole3{"name"}       	= "rdipole3";
	$dipole3{"mother"}     	= "rhrs";
#	$dipole3{"mother"}     	= "rdipole";
	$dipole3{"description"}	= "RHRS Dipole Magnet3";
#	$dipole3{"pos"}        	= "0*cm 0*cm 0*cm";
	$dipole3{"pos"}        	= "0*cm -213.5*cm -42*cm";
	$dipole3{"rotation"}   	= "0*deg 90*deg 0*deg";
#	$dipole3{"rotation"}   	= "0*deg 0*deg 0*deg";
	$dipole3{"color"}	    = "000000";
	$dipole3{"type"}       	= "Tube";
	$dipole3{"dimensions"} 	= "0*cm 220*cm 110.63*cm 60*deg 30*deg";
#	$dipole3{"dimensions"} 	= "835*cm 845*cm 110.63*cm 270*deg 45*deg";
	$dipole3{"visible"}    	= 1;
	$dipole3{"style"}      	= 0;
	$dipole3{"mfield"}		= "no_field";
	print_det(\%configuration, \%dipole3);

	my %dipole4 = init_det();
	$dipole4{"name"}       	= "rdipole4";
	$dipole4{"mother"}     	= "rhrs";
	$dipole4{"description"}	= "RHRS Dipole Magnet2";
#	$dipole4{"pos"}        	= "0*cm -117.38*cm 293.3*cm";
	$dipole4{"pos"}        	= "0*cm 32.53*cm 551.97*cm";
	$dipole4{"rotation"}   	= "0*deg 90*deg 0*deg";
	$dipole4{"color"}		= "000000";
	$dipole4{"type"}       	= "Tube";
	$dipole4{"dimensions"} 	= "0*cm 220*cm 111.63*cm 135*deg 30*deg";
#	$dipole4{"dimensions"} 	= "835*cm 845*cm 110.63*cm 270*deg 45*deg";
	$dipole4{"visible"}    	= 1;
	$dipole4{"style"}      	= 0;
	$dipole4{"mfield"}		= "no";
	print_det(\%configuration, \%dipole4);

#	$detector{"name"}       	= "rdipole";
#	$detector{"mother"}     	= "rhrs";
#	$detector{"description"}	= "RHRS Dipole Magnet";
#	$detector{"pos"}        	= "0*cm 626.5*cm -42*cm";
#	$detector{"pos"}        	= "0*cm 98.269*cm 138*cm";
#	$detector{"rotation"}   	= "0*deg 90*deg 0*deg";
#	$detector{"color"}	        = "B0E0E6";
#	$detector{"type"}       	= "Tube";
##	$detector{"dimensions"} 	= "186.824*cm 533.176*cm 107.63*cm 240*deg 105*deg";
#	$detector{"dimensions"} 	= "355*cm 365*cm 107.63*cm 240*deg 105*deg";
#	$detector{"visible"}    	= 1;
#	$detector{"style"}      	= 1;
#	$detector{"mfield"}			= "dipole_1.17591GeV";
#	print_det(\%configuration, \%detector);

#	$detector{"pos"}        	= "0*cm -117.38*cm 293.3*cm";
#	$detector{"rotation"}   	= "0*deg 0*deg 0*deg";
#	$detector{"color"}	        = "B0E0E6";
#	$detector{"type"}       	= "Box";
#	$detector{"dimensions"} 	= "107.63*cm 205*cm 381*cm";
#	$detector{"visible"}    	= 1;
#	$detector{"style"}      	= 1;
#	$detector{"mfield"}			= "dipole_1.17591GeV";

	my %rq1 = init_det();
	$rq1{"name"}       	= "rq1";
	$rq1{"mother"}     	= "rhrs";
	$rq1{"description"}	= "RHRS Q1 Magnet";
	$rq1{"pos"}        	= "0*cm -213.5*cm -829*cm";
	$rq1{"rotation"}   	= "0*deg 0*deg 0*deg";
	$rq1{"color"}	        = "B0E0E6";
	$rq1{"type"}       	= "Tube";
	$rq1{"dimensions"} 	= "0*cm 45.72*cm 40*cm 0*deg 360*deg";
	$rq1{"visible"}    	= 1;
	$rq1{"style"}      	= 1;
	$rq1{"mfield"}			= "q1_1.17591GeV";
	print_det(\%configuration, \%rq1);

	my %rq2 = init_det();
	$rq2{"name"}       	= "rq2";
	$rq2{"mother"}     	= "rhrs";
	$rq2{"description"}	= "RHRS Q2 Magnet";
	$rq2{"pos"}        	= "0*cm -213.5*cm -545*cm";
	$rq2{"rotation"}   	= "0*deg 0*deg 0*deg";
	$rq2{"color"}	        = "B0E0E6";
	$rq2{"type"}       	= "Tube";
	$rq2{"dimensions"} 	= "0*cm 74.93*cm 90*cm 0*deg 360*deg";
	$rq2{"visible"}    	= 1;
	$rq2{"style"}      	= 1;
	$rq2{"mfield"}			= "q2_1.17591GeV";
	print_det(\%configuration, \%rq2);

	my %rq3 = init_det();
	$rq3{"name"}       	= "rq3";
	$rq3{"mother"}     	= "rhrs";
	$rq3{"description"}	= "RHRS Q3 Magnet";
	$rq3{"pos"}        	= "0*cm 202.42*cm 721.92*cm";
	$rq3{"rotation"}   	= "45*deg 0*deg 0*deg";
	$rq3{"color"}	        = "B0E0E6";
	$rq3{"type"}       	= "Tube";
	$rq3{"dimensions"} 	= "0*cm 74.93*cm 90*cm 0*deg 360*deg";
	$rq3{"visible"}    	= 1;
	$rq3{"style"}      	= 1;
	$rq3{"mfield"}			= "q3_1.17591GeV";
	print_det(\%configuration, \%rq3);

#	$detector{"name"}       	= "electron_det_package";
#	$detector{"mother"}     	= "root";
#	$detector{"description"}	= "Electron Detector Package";
#	$detector{"pos"}        	= $rhrs_placement;
#	$detector{"rotation"}   	= $rhrs_rotation;
#	$detector{"color"}	        = "B0E0E6";
#	$detector{"type"}       	= "Box";
#	$detector{"dimensions"} 	= "358.15*cm 518.5*cm 1038*cm";
#	$detector{"visible"}    	= 1;
#	$detector{"style"}      	= 0;
#	print_det(\%configuration, \%detector);

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
