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

#my $basemat="Air_Opt";
my $basemat="Vacuum";

my $rhrsAngle=0;
#my $rhrsAngle=90;
#my $rhrsAngle=-12;

my $magfield="1.17591";
#my $magfield="2.18130";

sub build_hall
{
	my %detector = init_det();
	$detector{"name"}        = "hall_a";
	$detector{"mother"}      = "root";
	$detector{"description"} = "Hall A";
	$detector{"pos"}         = "0*cm 0*cm -500*cm";
	$detector{"rotation"}    = "0*deg 0*deg 0*deg";
	$detector{"color"}       = "00BFFF";
	$detector{"type"}        = "Sphere";
#	$detector{"dimensions"}  = "0*cm 2000*cm 2000*cm 0*deg 360*deg";
	$detector{"dimensions"}  = "0*cm 3500*cm 0*deg 360*deg 0*deg 180*deg";
#	$detector{"dimensions"}  = "0*cm 0.6*cm 4000*cm 0*deg 360*deg";
	$detector{"material"}    = $basemat;
	$detector{"visible"}     = 1;
	$detector{"style"}       = 0;
	print_det(\%configuration, \%detector);
}

sub build_beampipe
{
	my %beampipe = init_det();
	$beampipe{"name"}        = "beampipe";
	$beampipe{"mother"}      = "hall_a";
	$beampipe{"description"} = "Beam Pipe";
	$beampipe{"pos"}         = "0*cm 0*cm 550*cm";
	$beampipe{"rotation"}    = "0*deg 0*deg 0*deg";
	$beampipe{"color"}       = "888888";
	$beampipe{"type"}        = "Tube";
	$beampipe{"dimensions"}  = "1.9*cm 5*cm 500*cm 0*deg 360*deg";
	$beampipe{"material"}    = "G4_Pb";
	$beampipe{"visible"}     = 1;
	$beampipe{"style"}       = 1;
	print_det(\%configuration, \%beampipe);

	my %beampipevac = init_det();
	$beampipevac{"name"}        = "beampipevac";
	$beampipevac{"mother"}      = "hall_a";
	$beampipevac{"description"} = "Beam Pipe Vacuum";
	$beampipevac{"pos"}         = "0*cm 0*cm 550*cm";
	$beampipevac{"rotation"}    = "0*deg 0*deg 0*deg";
	$beampipevac{"color"}       = "888888";
	$beampipevac{"type"}        = "Tube";
	$beampipevac{"dimensions"}  = "0*cm 1.9*cm 500*cm 0*deg 360*deg";
	$beampipevac{"material"}    = "Vacuum";
	$beampipevac{"visible"}     = 0;
	$beampipevac{"style"}       = 0;
	print_det(\%configuration, \%beampipevac);

	my %beampipe1 = init_det();
	$beampipe1{"name"}        = "beampipe1";
	$beampipe1{"mother"}      = "hall_a";
	$beampipe1{"description"} = "Beam Pipe";
	$beampipe1{"pos"}         = "0*cm 0*cm 1050*cm";
	$beampipe1{"rotation"}    = "0*deg 0*deg 0*deg";
	$beampipe1{"color"}       = "888888";
	$beampipe1{"type"}        = "Tube";
	$beampipe1{"dimensions"}  = "4.9*cm 10*cm 500*cm 0*deg 360*deg";
	$beampipe1{"material"}    = "G4_Pb";
	$beampipe1{"visible"}     = 1;
	$beampipe1{"style"}       = 1;
	print_det(\%configuration, \%beampipe1);

	my %beampipe1vac = init_det();
	$beampipe1vac{"name"}        = "beampipe1vac";
	$beampipe1vac{"mother"}      = "hall_a";
	$beampipe1vac{"description"} = "Beam Pipe Vacuum";
	$beampipe1vac{"pos"}         = "0*cm 0*cm 1050*cm";
	$beampipe1vac{"rotation"}    = "0*deg 0*deg 0*deg";
	$beampipe1vac{"color"}       = "888888";
	$beampipe1vac{"type"}        = "Tube";
	$beampipe1vac{"dimensions"}  = "0*cm 4.9*cm 500*cm 0*deg 360*deg";
	$beampipe1vac{"material"}    = "Vacuum";
	$beampipe1vac{"visible"}     = 0;
	$beampipe1vac{"style"}       = 0;
	print_det(\%configuration, \%beampipe1vac);



}

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
#	$detector{"material"}    = "helium3Gas";
	$detector{"visible"}     = 1;
	$detector{"style"}       = 1;
	print_det(\%configuration, \%detector);
}

sub build_target_holding_field
{
	my %detector = init_det();
	$detector{"name"}        = "3he_holding_field";
#	$detector{"mother"}      = "root";
	$detector{"mother"}      = "hall_a";
	$detector{"description"} = "Magnetic Holding Field";
	$detector{"pos"}         = "0*cm 0*cm 0*cm";
	$detector{"rotation"}    = "0*deg 0*deg 0*deg";
	$detector{"color"}       = "FFD700";
	$detector{"type"}        = "Sphere";
	$detector{"dimensions"}  = "0*cm 50*cm 0*deg 360*deg 0*deg 180*deg";
	$detector{"material"}    = $basemat;
	$detector{"visible"}     = 1;
	$detector{"style"}       = 0;
	$detector{"mfield"}	 	 = "3He_holding_field";
	print_det(\%configuration, \%detector);

}


sub build_rhrs
{
	my $deg				= $rhrsAngle;
#	my $deg				= -12;
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
#	$rhrs{"mother"}     	= "root";
	$rhrs{"mother"}     	= "hall_a";
	$rhrs{"description"}	= "RHRS";
	$rhrs{"pos"}        	= $rhrs_placement;
	$rhrs{"rotation"}   	= $rhrs_rotation;
	$rhrs{"color"}	        = "B0E0E6";
	$rhrs{"type"}       	= "Box";
#	$rhrs{"material"}	    = "Air_Opt";
	$rhrs{"material"}	    = $basemat;
#	$rhrs{"dimensions"} 	= "358.15*cm 518.5*cm 1038*cm";
	$rhrs{"dimensions"} 	= "112*cm 319.5*cm 1038*cm";
#	$rhrs{"dimensions"} 	= "358.15*cm 1037*cm 1238*cm";
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
#	$dipolemother{"material"} 	   	= "Air_Opt";
	$dipolemother{"material"} 	   	= $basemat;
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
#	$dipole0{"material"}    = "Air_Opt";
	$dipole0{"material"}    = $basemat;
	$dipole0{"style"}      	= 1;
	$dipole0{"mfield"}		= "dipole_".$magfield."GeV";
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
#	$detector{"mfield"}			= "dipole_".$magfield."GeV";
#	print_det(\%configuration, \%detector);

#	$detector{"pos"}        	= "0*cm -117.38*cm 293.3*cm";
#	$detector{"rotation"}   	= "0*deg 0*deg 0*deg";
#	$detector{"color"}	        = "B0E0E6";
#	$detector{"type"}       	= "Box";
#	$detector{"dimensions"} 	= "107.63*cm 205*cm 381*cm";
#	$detector{"visible"}    	= 1;
#	$detector{"style"}      	= 1;
#	$detector{"mfield"}			= "dipole_".$magfield."GeV";

	my %rq1 = init_det();
	$rq1{"name"}       	= "rq1";
	$rq1{"mother"}     	= "rhrs";
	$rq1{"description"}	= "RHRS Q1 Magnet";
	$rq1{"pos"}        	= "0*cm -213.5*cm -829*cm";
	$rq1{"rotation"}   	= "0*deg 0*deg 0*deg";
	$rq1{"color"}		= "B0E0E6";
	$rq1{"type"}       	= "Tube";
	$rq1{"dimensions"} 	= "0*cm 45.72*cm 40*cm 0*deg 360*deg";
	$rq1{"visible"}    	= 1;
	$rq1{"style"}      	= 1;
#	$rq1{"material"}    = "Air_Opt";
	$rq1{"material"}    = $basemat;
	$rq1{"mfield"}		= "q1_".$magfield."GeV";
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
#	$rq2{"material"}    = "Air_Opt";
	$rq2{"material"}    = $basemat;
	$rq2{"visible"}    	= 1;
	$rq2{"style"}      	= 1;
	$rq2{"mfield"}			= "q2_".$magfield."GeV";
	print_det(\%configuration, \%rq2);

	my %rq3 = init_det();
	$rq3{"name"}       	= "rq3";
	$rq3{"mother"}     	= "rhrs";
	$rq3{"description"}	= "RHRS Q3 Magnet";
#	$rq3{"pos"}        	= "0*cm 202.42*cm 721.92*cm";
	$rq3{"pos"}        	= "0*cm 202.42*cm 721.92*cm";
	$rq3{"rotation"}   	= "45*deg 0*deg 0*deg";
	$rq3{"color"}	    = "B0E0E6";
	$rq3{"type"}       	= "Tube";
	$rq3{"dimensions"} 	= "0*cm 74.93*cm 90*cm 0*deg 360*deg";
#	$rq3{"material"}    = "Air_Opt";
	$rq3{"material"}    = $basemat;
	$rq3{"visible"}    	= 1;
	$rq3{"style"}      	= 1;
	$rq3{"mfield"}			= "q3_".$magfield."GeV";
	print_det(\%configuration, \%rq3);
}

sub build_eleDetector
{
	my $r				= 2100;
	my $x				= $r*sin($rhrsAngle);
	my $z				= $r*cos($rhrsAngle);
	my $xstr			= sprintf("%.5f", $x);
	my $zstr			= sprintf("%.5f", $z);
	my $rotstr			= sprintf("%.5f", $z);
	my $rot				= -$rhrsAngle;
	my $epack_placement	= "";
#	$epack_placement	= $xstr."*cm 1235*cm ".$zstr."*cm";
#	$epack_placement	= $xstr."*cm 1000*cm ".$zstr."*cm";
#	$epack_placement	= $xstr."*cm 1018.5*cm ".$zstr."*cm";
	$epack_placement	= $xstr."*cm 1035*cm ".$zstr."*cm";
	my $epack_rotation	= "0*deg ".$rot."*deg 0*deg";

	my %electron_pack = init_det();
	$electron_pack{"name"}       	= "electron_det_package";
#	$electron_pack{"mother"}     	= "root";
	$electron_pack{"mother"}     	= "hall_a";
	$electron_pack{"description"}	= "Electron Detector Package";
#	$electron_pack{"pos"}        	= "0*cm 768.5*cm 719*cm";
	$electron_pack{"pos"}        	= $epack_placement;
#	$electron_pack{"rotation"}   	= "0*deg 0*deg 0*deg";
	$electron_pack{"rotation"}   	= $epack_rotation;
	$electron_pack{"color"}	        = "B0E0E6";
	$electron_pack{"type"}       	= "Box";
#	$electron_pack{"dimensions"} 	= "358.15*cm 500*cm 500*cm";
	$electron_pack{"dimensions"} 	= "500*cm 500*cm 500*cm";
#	$electron_pack{"material"} 		= "Air_Opt";
	$electron_pack{"material"} 		= $basemat;
	$electron_pack{"visible"}    	= 1;
	$electron_pack{"style"}      	= 0;
	print_det(\%configuration, \%electron_pack);

	my %block_det = init_det();
	$block_det{"name"}       	= "electron_det";
	$block_det{"mother"}     	= "electron_det_package";
	$block_det{"description"}	= "Electron Detector";
	$block_det{"pos"}        	= "0*cm -2*cm 0*cm";
	$block_det{"rotation"}   	= "0*deg 0*deg 0*deg";
	$block_det{"color"}	        = "585858";
	$block_det{"type"}       	= "Box";
	$block_det{"dimensions"} 	= "300*cm 300*cm 300*cm";
#	$block_det{"material"}    	= "G4_GLASS_LEAD";
	$block_det{"material"}    	= "Air_Opt";
	$block_det{"visible"}    	= 1;
	$block_det{"style"}      	= 1;
	$block_det{"sensitivity"}	= "flux";
	$block_det{"hit_type"}		= "flux";
	$block_det{"identifiers"}	= "id manual 102";
	print_det(\%configuration, \%block_det);

	my %shield1 = init_det();
	$shield1{"name"}       	= "pb_shield1";
	$shield1{"mother"}     	= "electron_det_package";
	$shield1{"description"}	= "Lead Shielding Front";
	$shield1{"pos"}        	= "0*cm 0*cm -400*cm";
	$shield1{"rotation"}   	= "0*deg 0*deg 0*deg";
	$shield1{"color"}	    = "FFFFFF";
	$shield1{"type"}       	= "Box";
	$shield1{"dimensions"} 	= "500*cm 500*cm 95*cm";
	$shield1{"material"}    = "G4_Pb";
	$shield1{"visible"}    	= 1;
	$shield1{"style"}      	= 1;
	print_det(\%configuration, \%shield1);

	my %shield2 = init_det();
	$shield2{"name"}       	= "pb_shield2";
	$shield2{"mother"}     	= "electron_det_package";
	$shield2{"description"}	= "Lead Shielding Left";
	$shield2{"pos"}        	= "400*cm 0*cm 0*cm";
	$shield2{"rotation"}   	= "0*deg 0*deg 0*deg";
	$shield2{"color"}	    = "FFFFFF";
	$shield2{"type"}       	= "Box";
	$shield2{"dimensions"} 	= "50*cm 500*cm 500*cm";
	$shield2{"material"}    = "G4_Pb";
	$shield2{"visible"}    	= 1;
	$shield2{"style"}      	= 1;
	print_det(\%configuration, \%shield2);

	my %shield3 = init_det();
	$shield3{"name"}       	= "pb_shield3";
	$shield3{"mother"}     	= "electron_det_package";
	$shield3{"description"}	= "Lead Shielding Right";
	$shield3{"pos"}        	= "-400*cm 0*cm 0*cm";
	$shield3{"rotation"}   	= "0*deg 0*deg 0*deg";
	$shield3{"color"}	    = "FFFFFF";
	$shield3{"type"}       	= "Box";
	$shield3{"dimensions"} 	= "50*cm 500*cm 500*cm";
	$shield3{"material"}    = "G4_Pb";
	$shield3{"visible"}    	= 1;
	$shield3{"style"}      	= 1;
	print_det(\%configuration, \%shield3);

	my %shield4 = init_det();
	$shield4{"name"}       	= "pb_shield4";
	$shield4{"mother"}     	= "electron_det_package";
	$shield4{"description"}	= "Lead Shielding BotLeft";
	$shield4{"pos"}        	= "-250*cm -400*cm 0*cm";
	$shield4{"rotation"}   	= "0*deg 0*deg 0*deg";
	$shield4{"color"}	    = "FFFFFF";
	$shield4{"type"}       	= "Box";
	$shield4{"dimensions"} 	= "190*cm 50*cm 500*cm";
	$shield4{"material"}    = "G4_Pb";
	$shield4{"visible"}    	= 1;
	$shield4{"style"}      	= 1;
	print_det(\%configuration, \%shield4);

	my %shield5 = init_det();
	$shield5{"name"}       	= "pb_shield5";
	$shield5{"mother"}     	= "electron_det_package";
	$shield5{"description"}	= "Lead Shielding BotRight";
	$shield5{"pos"}        	= "250*cm -400*cm 0*cm";
	$shield5{"rotation"}   	= "0*deg 0*deg 0*deg";
	$shield5{"color"}	    = "FFFFFF";
	$shield5{"type"}       	= "Box";
	$shield5{"dimensions"} 	= "190*cm 50*cm 500*cm";
	$shield5{"material"}    = "G4_Pb";
	$shield5{"visible"}    	= 1;
	$shield5{"style"}      	= 1;
	print_det(\%configuration, \%shield5);

	my %shield6 = init_det();
	$shield6{"name"}       	= "pb_shield6";
	$shield6{"mother"}     	= "electron_det_package";
	$shield6{"description"}	= "Lead Shielding Top";
	$shield6{"pos"}        	= "0*cm 400*cm 0*cm";
	$shield6{"rotation"}   	= "0*deg 0*deg 0*deg";
	$shield6{"color"}	    = "FFFFFF";
	$shield6{"type"}       	= "Box";
	$shield6{"dimensions"} 	= "500*cm 50*cm 500*cm";
	$shield6{"material"}    = "G4_Pb";
	$shield6{"visible"}    	= 1;
	$shield6{"style"}      	= 1;
	print_det(\%configuration, \%shield6);

}

sub build_hand
{
	my %detector = init_det();
	$detector{"name"}        = "hand";
#	$detector{"mother"}      = "root";
	$detector{"mother"}      = "hall_a";
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

	my %pbwall = init_det();
	$pbwall{"name"}        = "lead_wall";
	$pbwall{"mother"}      = "hall_a";
	$pbwall{"description"} = "Hall A Neutron Detector - Pb Wall";
#                                 x      y     z where z=beam direction, y=Ay0 direction
	$pbwall{"pos"}         = "672*cm 0*cm 193*cm";
	$pbwall{"rotation"}    = "0*deg -74*deg 0*deg";
	$pbwall{"color"}       = "B7410E";
	$pbwall{"type"}        = "Box";
#	$pbwall{"dimensions"}  = "100*cm 320*cm 40*cm";
	$pbwall{"dimensions"}  = "100*cm 160*cm 5*cm";
#	$pbwall{"material"}    = "G4_GLASS_LEAD";
	$pbwall{"material"}    = "G4_Pb";
	$pbwall{"visible"}     = 1;
	$pbwall{"style"}       = 1;
	print_det(\%configuration, \%pbwall);

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


build_hall();
build_hand();
build_rhrs();
build_eleDetector();
build_target_holding_field();
build_target_cell();
#build_beampipe();
