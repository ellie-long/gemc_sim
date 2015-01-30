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
	$detector{"material"}    = "Air_Opt";
#	$detector{"material"}    = "Vacuum";
	$detector{"visible"}     = 1;
	$detector{"style"}       = 0;
	$detector{"mfield"}	 	 = "3He_holding_field";
	print_det(\%configuration, \%detector);

}


sub build_rhrs
{
	my $deg				= -12;
#	my $deg				= 0;
	my $rot				= -$deg;
	my $r				= 1038;
	my $angle			= $deg*0.0174532925; # Degree -> Radians
	my $x				= $r*sin($angle);
	my $z				= $r*cos($angle);
	my $xstr			= sprintf("%.5f", $x);
	my $zstr			= sprintf("%.5f", $z);
	my $rotstr			= sprintf("%.5f", $z);
	my $rhrs_placement	= "";
	$rhrs_placement	= $xstr."*cm 213.5*cm ".$zstr."*cm";
	my $rhrs_rotation	= "0*deg ".$rot."*deg 0*deg";
	printf("RHRS Placement: $rhrs_placement\n");

	my %rhrs = init_det();
	$rhrs{"name"}       	= "rhrs";
	$rhrs{"mother"}     	= "root";
	$rhrs{"description"}	= "RHRS";
	$rhrs{"pos"}        	= $rhrs_placement;
	$rhrs{"rotation"}   	= $rhrs_rotation;
	$rhrs{"color"}	        = "B0E0E6";
	$rhrs{"type"}       	= "Box";
	$rhrs{"material"}	    = "Air_Opt";
#	$rhrs{"dimensions"} 	= "358.15*cm 518.5*cm 1038*cm";
	$rhrs{"dimensions"} 	= "358.15*cm 1037*cm 1238*cm";
	$rhrs{"visible"}    	= 1;
	$rhrs{"style"}      	= 0;
	print_det(\%configuration, \%rhrs);

	my %dipolemother = init_det();
	$dipolemother{"name"}       	= "rdipole";
	$dipolemother{"mother"}     	= "rhrs";
	$dipolemother{"description"}	= "RHRS Dipole Magnet";
#	$dipolemother{"pos"}        	= "0*cm -117.38*cm 293.3*cm";
	$dipolemother{"pos"}        	= "0*cm 626.5*cm -42*cm";
	$dipolemother{"rotation"}   	= "0*deg 90*deg 0*deg";
	$dipolemother{"color"}		    = "B0E0E6";
	$dipolemother{"type"}       	= "Tube";
#	$dipolemother{"dimensions"} 	= "666.824*cm 1013.176*cm 110.63*cm 270*deg 45*deg";
	$dipolemother{"dimensions"} 	= "666.824*cm 1013.176*cm 110.63*cm 0*deg 360*deg";
#	$dipolemother{"dimensions"} 	= "835*cm 845*cm 110.63*cm 270*deg 45*deg";
	$dipolemother{"material"} 	   	= "Air_Opt";
	$dipolemother{"visible"}    	= 0;
	$dipolemother{"style"}      	= 1;
	print_det(\%configuration, \%dipolemother);

	my $n				= 49.381;
	$x					= $n*0.3827+183.7;
	my $y				= -$n*0.9239-443.46; 
	$z					= 0;
	my $rdipole_placement	= $x."*cm ".$y."*cm ".$z."*cm";
	printf("RDipole Placement: $rdipole_placement\n");

	my %dipole0 = init_det();
	$dipole0{"name"}       	= "rdipole0";
	$dipole0{"mother"}     	= "rdipole";
	$dipole0{"description"}	= "RHRS Dipole Magnet2 - Downstream Bottom Segment";
#	$dipole0{"pos"}        	= "0*cm -117.38*cm 293.3*cm";
#	$dipole0{"pos"}        	= "321.5*cm -776.1*cm 0*cm";
#	$dipole0{"pos"}        	= "183.7*cm -443.46*cm 0*cm";
	$dipole0{"pos"}        	= $rdipole_placement;

	$dipole0{"rotation"}   	= "0*deg 0*deg 0*deg";
	$dipole0{"color"}		= "B0E0E6";
	$dipole0{"type"}       	= "Tube";
# Note: This was done a bit by eye, and could use much more precise improvement
#	$dipole0{"dimensions"} 	= "405.1*cm 405.101*cm 110.63*cm 240*deg 105*deg";
	$dipole0{"dimensions"} 	= "207.2335*cm 602.9665*cm 110.63*cm 240*deg 105*deg";
	$dipole0{"visible"}    	= 1;
	$dipole0{"material"}    = "Air_Opt";
	$dipole0{"style"}      	= 1;
	$dipole0{"mfield"}		= "dipole_1.17591GeV";
	print_det(\%configuration, \%dipole0);

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
	$rq1{"material"}    = "Air_Opt";
	$rq1{"mfield"}		= "q1_1.17591GeV";
	print_det(\%configuration, \%rq1);

	my %rq2 = init_det();
	$rq2{"name"}       	= "rq2";
	$rq2{"mother"}     	= "rhrs";
	$rq2{"description"}	= "RHRS Q2 Magnet";
	$rq2{"pos"}        	= "0*cm -213.5*cm -545*cm";
	$rq2{"rotation"}   	= "0*deg 0*deg 0*deg";
	$rq2{"color"}	    = "B0E0E6";
	$rq2{"type"}       	= "Tube";
	$rq2{"dimensions"} 	= "0*cm 74.93*cm 90*cm 0*deg 360*deg";
	$rq2{"material"}    = "Air_Opt";
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
	$rq3{"material"}    = "Air_Opt";
	$rq3{"visible"}    	= 1;
	$rq3{"style"}      	= 1;
	$rq3{"mfield"}			= "q3_1.17591GeV";
	print_det(\%configuration, \%rq3);

	my %electron_pack = init_det();
	$electron_pack{"name"}       	= "electron_det_package";
	$electron_pack{"mother"}     	= "rhrs";
	$electron_pack{"description"}	= "Electron Detector Package";
	$electron_pack{"pos"}        	= "0*cm 718.5*cm 719*cm";
	$electron_pack{"rotation"}   	= "0*deg 0*deg 0*deg";
	$electron_pack{"color"}	        = "B0E0E6";
	$electron_pack{"type"}       	= "Box";
	$electron_pack{"dimensions"} 	= "358.15*cm 518.5*cm 519*cm";
	$electron_pack{"visible"}    	= 1;
	$electron_pack{"style"}      	= 0;
	print_det(\%configuration, \%electron_pack);

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
	$detector{"sensitivity"} = "flux";
	$detector{"hit_type"} 	 = "flux";
	$detector{"identifiers"} = "id manual 101";
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


build_hand();
build_rhrs();
build_target_holding_field();
build_target_cell();
