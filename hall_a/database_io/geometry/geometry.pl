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

my $basemat="Air_Opt";
#my $basemat="Vacuum";

#my $magfield="1.1759";
##my $magfield="1.17591";
#my $magfield="2.18130";
my $magfield="3.0855";

#my $test=0;
my $test=1;

if ($test eq 1)
{
	printf "#-#-#-#-#-#-#-#-#-# TEST MODE #-#-#-#-#-#-#-#-#-#-#-#-#\n";
	printf "     All HRS detector materials set to".$basemat."\n";
	printf "#-#-#-#-#-#-#-#-#-# TEST MODE #-#-#-#-#-#-#-#-#-#-#-#-#\n\n";
}

# Get RHRS angle from input file
my $rhrsAngle=0.0;
open my $inputFile, '<', "rhrsAngle.txt" or die $!;
while (<$inputFile>){
    if ($rhrsAngle==0) {$rhrsAngle=$_;}
}
close $inputFile or die $!;
my $rhrsAngleRad = $rhrsAngle*0.0174532925; # Degree --> Radians
# my $negRHRSAngl = - $rhrsAngle;
my $dummyDbl=0.0;
$dummyDbl=$rhrsAngle;
$dummyDbl=$rhrsAngle+0.0;
$rhrsAngle=$dummyDbl;

printf "\n\n******************************************\n";
printf "RHRS Angle: %.2f degrees\n", $rhrsAngle;
printf "RHRS Momentum Setting: ".$magfield." GeV\n";
printf "Hall Material: " .$basemat."\n";
printf "******************************************\n\n";

sub build_hall
{
	my %detector = init_det();
	$detector{"name"}        = "hall_a";
	$detector{"mother"}      = "root";
	$detector{"description"} = "Hall A";
	$detector{"pos"}         = "0*cm 0*cm -500*cm";
#	$detector{"pos"}         = "0*cm 0*cm 0*cm";
	$detector{"rotation"}    = "0*deg 0*deg 0*deg";
	$detector{"color"}       = "00BFFF";
	$detector{"type"}        = "Sphere";
#	$detector{"dimensions"}  = "0*cm 2000*cm 2000*cm 0*deg 360*deg";
	$detector{"dimensions"}  = "0*cm 4000*cm 0*deg 360*deg 0*deg 180*deg";
#	$detector{"dimensions"}  = "0*cm 0.6*cm 4000*cm 0*deg 360*deg";
	$detector{"material"}    = $basemat;
	$detector{"visible"}     = 1;
	$detector{"style"}       = 0;
	print_det(\%configuration, \%detector);

#	my %detector = init_det();
#	$detector{"name"}        = "box";
#	$detector{"mother"}      = "root";
#	$detector{"description"} = "Hall A";
#	$detector{"pos"}         = "0*cm 0*cm 0*cm";
##	$detector{"pos"}         = "0*cm 0*cm 0*cm";
#	$detector{"rotation"}    = "0*deg 0*deg 0*deg";
#	$detector{"color"}       = "00BFFF";
#	$detector{"type"}        = "Box";
#	$detector{"dimensions"}  = "20*m 20*m 20*m";
#	$detector{"material"}    = $basemat;
#	$detector{"visible"}     = 1;
#	$detector{"style"}       = 0;
#	print_det(\%configuration, \%detector);

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
	$beampipe{"dimensions"}  = "5*cm 5.5*cm 500*cm 0*deg 360*deg";
	$beampipe{"material"}    = "G4_Pb";
	$beampipe{"visible"}     = 1;
	$beampipe{"style"}       = 1;
#	print_det(\%configuration, \%beampipe);

	my %beampipevac = init_det();
	$beampipevac{"name"}        = "beampipevac";
	$beampipevac{"mother"}      = "hall_a";
	$beampipevac{"description"} = "Beam Pipe Vacuum";
#	$beampipevac{"pos"}         = "0*cm 0*cm 550*cm";
#	$beampipevac{"rotation"}    = "0*deg 0*deg 0*deg";
	$beampipevac{"pos"}         = "114.3514*cm 0*cm 537.98118*cm";
	$beampipevac{"rotation"}    = "0*deg -17*deg 0*deg";
	$beampipevac{"color"}       = "888888";
	$beampipevac{"type"}        = "Tube";
	$beampipevac{"dimensions"}  = "0*cm 5*cm 500*cm 0*deg 360*deg";
	$beampipevac{"material"}    = "Vacuum";
	$beampipevac{"visible"}     = 1;
	$beampipevac{"style"}       = 1;
	print_det(\%configuration, \%beampipevac);

	my %beampipe1 = init_det();
	$beampipe1{"name"}        = "beampipe1";
	$beampipe1{"mother"}      = "hall_a";
	$beampipe1{"description"} = "Beam Pipe";
	$beampipe1{"pos"}         = "0*cm 0*cm 1050*cm";
	$beampipe1{"rotation"}    = "0*deg 0*deg 0*deg";
	$beampipe1{"color"}       = "888888";
	$beampipe1{"type"}        = "Tube";
	$beampipe1{"dimensions"}  = "10*cm 10.5*cm 500*cm 0*deg 360*deg";
	$beampipe1{"material"}    = "G4_Pb";
	$beampipe1{"visible"}     = 1;
	$beampipe1{"style"}       = 1;
#	print_det(\%configuration, \%beampipe1);

	my %beampipe1vac = init_det();
	$beampipe1vac{"name"}        = "beampipe1vac";
	$beampipe1vac{"mother"}      = "hall_a";
	$beampipe1vac{"description"} = "Beam Pipe Vacuum";
#	$beampipe1vac{"pos"}         = "0*cm 0*cm 1050*cm";
#	$beampipe1vac{"rotation"}    = "0*deg 0*deg 0*deg";
	$beampipe1vac{"pos"}         = "218.30727*cm 0*cm 1027.05498*cm";
	$beampipe1vac{"rotation"}    = "0*deg -17*deg 0*deg";
	$beampipe1vac{"color"}       = "888888";
	$beampipe1vac{"type"}        = "Tube";
	$beampipe1vac{"dimensions"}  = "0*cm 10*cm 500*cm 0*deg 360*deg";
	$beampipe1vac{"material"}    = "Vacuum";
	$beampipe1vac{"visible"}     = 1;
	$beampipe1vac{"style"}       = 1;
	print_det(\%configuration, \%beampipe1vac);



}

sub build_3he_target
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


	my %target = init_det();
	$target{"name"}        = "target";
	$target{"mother"}      = "3he_holding_field";
	$target{"description"} = "3He target";
	$target{"pos"}         = "0*cm 0*cm 0*cm";
#	$target{"rotation"}    = "0*deg 0*deg 0*deg";
	$target{"rotation"}    = "0*deg $rhrsAngle*deg 0*deg";
	$target{"color"}       = "00BFFF";
	$target{"type"}        = "Tube";
	$target{"dimensions"}  = "0*cm 0.6*cm 20*cm 0*deg 360*deg";
	$target{"material"}    = "3He_Cell";
	$target{"visible"}     = 1;
	$target{"style"}       = 1;
	print_det(\%configuration, \%target);
}



sub build_rhrs
{
#	my $deg				= $rhrsAngle;
#	my $deg				= -12;
	my $deg				= 0;
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
#	$rhrs{"material"}	    = "G4_Pb";
#	$rhrs{"dimensions"} 	= "358.15*cm 518.5*cm 1038*cm";
	$rhrs{"dimensions"} 	= "112*cm 319.5*cm 1038*cm";
#	$rhrs{"dimensions"} 	= "358.15*cm 1037*cm 1238*cm";
	$rhrs{"visible"}    	= 1;
	$rhrs{"style"}      	= 0;
	print_det(\%configuration, \%rhrs);

#	my %dipolemother = init_det();
#	$dipolemother{"name"}       	= "rdipole";
#	$dipolemother{"mother"}     	= "rhrs";
#	$dipolemother{"description"}	= "RHRS Dipole Magnet";
#	$dipolemother{"pos"}        	= "0*cm -117.38*cm 293.3*cm";
#	$dipolemother{"pos"}        	= "0*cm 626.5*cm -42*cm";
#	$dipolemother{"rotation"}   	= "0*deg 90*deg 0*deg";
#	$dipolemother{"color"}		    = "B0E0E6";
#	$dipolemother{"type"}       	= "Tube";
#	$dipolemother{"dimensions"} 	= "666.824*cm 1013.176*cm 110.63*cm 270*deg 45*deg";
#	$dipolemother{"dimensions"} 	= "666.824*cm 1013.176*cm 110.63*cm 0*deg 360*deg";
#	$dipolemother{"dimensions"} 	= "835*cm 845*cm 110.63*cm 270*deg 45*deg";
#	$dipolemother{"material"} 	   	= "Air_Opt";
#	$dipolemother{"material"} 	   	= $basemat;
#	$dipolemother{"visible"}    	= 1;
#	$dipolemother{"style"}      	= 1;
#	print_det(\%configuration, \%dipolemother);

#	my $n				= 49.381;
	my $n				= 0;
#	$x					= $n*0.3827+183.7;
#	my $y				= -$n*0.9239-443.46; 
	$x					= 0;
	my $y				= 160; 
	$z					= 160;
	my $rdipole_placement	= $x."*cm ".$y."*cm ".$z."*cm";
	printf("RDipole Placement: $rdipole_placement\n");

	my %dipole0 = init_det();
	$dipole0{"name"}       	= "rdipole";
	$dipole0{"mother"}     	= "rhrs";
	$dipole0{"description"}	= "RHRS Dipole Magnet";
#	$dipole0{"pos"}        	= "0*cm -117.38*cm 293.3*cm";
#	$dipole0{"pos"}        	= "321.5*cm -776.1*cm 0*cm";
#	$dipole0{"pos"}        	= "183.7*cm -443.46*cm 0*cm";
	$dipole0{"pos"}        	= $rdipole_placement;
	$dipole0{"rotation"}   	= "0*deg 90*deg 0*deg";
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
	$rq1{"visible"}    	= 0;
	$rq1{"style"}      	= 1;
#	$rq1{"material"}    = "Air_Opt";
	$rq1{"material"}    = $basemat;
	$rq1{"mfield"}		= "q1_".$magfield."GeV";
	print_det(\%configuration, \%rq1);

	my %rq1shield = init_det();
	$rq1shield{"name"}       	= "rq1shield";
	$rq1shield{"mother"}     	= "rhrs";
	$rq1shield{"description"}	= "RHRS Q1 Magnet Shield";
	$rq1shield{"pos"}        	= "0*cm -213.5*cm -829*cm";
	$rq1shield{"rotation"}   	= "0*deg 0*deg 0*deg";
	$rq1shield{"color"}			= "C0C0C0";
	$rq1shield{"type"}       	= "Tube";
	$rq1shield{"dimensions"} 	= "45.72*cm 50*cm 40*cm 20*deg 310*deg";
	$rq1shield{"visible"}    	= 1;
	$rq1shield{"style"}      	= 1;
	$rq1shield{"material"}		= "G4_STAINLESS-STEEL";
#	$rq1shield{"material"}		= "G4_Pb";
	print_det(\%configuration, \%rq1shield);



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
	$rq2{"visible"}    	= 0;
	$rq2{"style"}      	= 1;
	$rq2{"mfield"}		= "q2_".$magfield."GeV";
	print_det(\%configuration, \%rq2);

	my %rq2shield = init_det();
	$rq2shield{"name"}       	= "rq2shield";
	$rq2shield{"mother"}     	= "rhrs";
	$rq2shield{"description"}	= "RHRS Q2 Magnet Shield";
	$rq2shield{"pos"}        	= "0*cm -213.5*cm -545*cm";
	$rq2shield{"rotation"}   	= "0*deg 0*deg 0*deg";
	$rq2shield{"color"}	    	= "C0C0C0";
	$rq2shield{"type"}       	= "Tube";
	$rq2shield{"dimensions"} 	= "74.93*cm 80*cm 90*cm 0*deg 360*deg";
	$rq2shield{"material"}    	= "G4_STAINLESS-STEEL";
	$rq2shield{"visible"}    	= 1;
	$rq2shield{"style"}      	= 1;
#	$rq2shield{"material"}		= "G4_Pb";
	$rq2shield{"field"}    		= "no_field";
	print_det(\%configuration, \%rq2shield);


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
	$rq3{"visible"}    	= 0;
	$rq3{"style"}      	= 1;
	$rq3{"mfield"}		= "q3_".$magfield."GeV";
	print_det(\%configuration, \%rq3);

	my %rq3shield = init_det();
	$rq3shield{"name"}       	= "rq3shield";
	$rq3shield{"mother"}     	= "rhrs";
	$rq3shield{"description"}	= "RHRS Q3 Magnet Shield";
#	$rq3shield{"pos"}        	= "0*cm 202.42*cm 721.92*cm";
	$rq3shield{"pos"}        	= "0*cm 202.42*cm 721.92*cm";
	$rq3shield{"rotation"}   	= "45*deg 0*deg 0*deg";
	$rq3shield{"color"}	    	= "C0C0C0";
	$rq3shield{"type"}       	= "Tube";
	$rq3shield{"dimensions"} 	= "74.93*cm 150*cm 90*cm 0*deg 360*deg";
	$rq3shield{"material"}   	= "G4_STAINLESS-STEEL";
#	$rq3shield{"material"}   	= "G4_Pb";
	$rq3shield{"visible"}    	= 1;
	$rq3shield{"style"}      	= 1;
	print_det(\%configuration, \%rq3shield);

}

sub build_eleShieldHouse
{
	my $r				= 2100;
#	my $x				= $r*sin($rhrsAngleRad);
#	my $z				= $r*cos($rhrsAngleRad);
	my $x				= $r*sin(0);
	my $z				= $r*cos(0);
	my $xstr			= sprintf("%.5f", $x);
	my $zstr			= sprintf("%.5f", $z);
	my $rotstr			= sprintf("%.5f", $z);
#	my $rot				= -$rhrsAngle;
	my $rot				= 0;
	my $eshield_placement	= "";
#	$eshield_placement	= $xstr."*cm 1235*cm ".$zstr."*cm";
#	$eshield_placement	= $xstr."*cm 1000*cm ".$zstr."*cm";
#	$eshield_placement	= $xstr."*cm 1018.5*cm ".$zstr."*cm";
	$eshield_placement	= $xstr."*cm 1036*cm ".$zstr."*cm";
	my $eshield_rotation	= "0*deg ".$rot."*deg 0*deg";

	my %electron_shield = init_det();
	$electron_shield{"name"}       	= "electron_arm_shield_house";
#	$electron_shield{"mother"}     	= "root";
	$electron_shield{"mother"}     	= "hall_a";
	$electron_shield{"description"}	= "Electron Arm Shield House";
#	$electron_shield{"pos"}        	= "0*cm 768.5*cm 719*cm";
	$electron_shield{"pos"}        	= $eshield_placement;
#	$electron_shield{"rotation"}   	= "0*deg 0*deg 0*deg";
	$electron_shield{"rotation"}   	= $eshield_rotation;
	$electron_shield{"color"}	    = "B0E0E6";
	$electron_shield{"type"}       	= "Box";
#	$electron_shield{"dimensions"} 	= "358.15*cm 500*cm 500*cm";
	$electron_shield{"dimensions"} 	= "250*cm 500*cm 500*cm";
#	$electron_shield{"material"} 		= "Air_Opt";
	$electron_shield{"material"} 		= $basemat;
	$electron_shield{"visible"}    	= 0;
	$electron_shield{"style"}      	= 0;
	print_det(\%configuration, \%electron_shield);

	my %shield1 = init_det();
	$shield1{"name"}       	= "pb_shield1";
	$shield1{"mother"}     	= "electron_arm_shield_house";
	$shield1{"description"}	= "Lead Shielding Front";
	$shield1{"pos"}        	= "0*cm 0*cm -450*cm";
	$shield1{"rotation"}   	= "0*deg 0*deg 0*deg";
	$shield1{"color"}	    = "FFFFFF";
	$shield1{"type"}       	= "Box";
	$shield1{"dimensions"} 	= "250*cm 500*cm 50*cm";
	$shield1{"material"}    = "G4_Pb";
	$shield1{"visible"}    	= 1;
	$shield1{"style"}      	= 1;
	print_det(\%configuration, \%shield1);

	my %shield2 = init_det();
	$shield2{"name"}       	= "pb_shield2";
	$shield2{"mother"}     	= "electron_arm_shield_house";
	$shield2{"description"}	= "Lead Shielding Left";
	$shield2{"pos"}        	= "200*cm 0*cm 0*cm";
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
	$shield3{"mother"}     	= "electron_arm_shield_house";
	$shield3{"description"}	= "Lead Shielding Right";
	$shield3{"pos"}        	= "-200*cm 0*cm 0*cm";
	$shield3{"rotation"}   	= "0*deg 0*deg 0*deg";
	$shield3{"color"}	    = "FFFFFF";
	$shield3{"type"}       	= "Box";
	$shield3{"dimensions"} 	= "50*cm 500*cm 500*cm";
	$shield3{"material"}    = "G4_Pb";
	$shield3{"visible"}    	= 1;
	$shield3{"style"}      	= 0;
	print_det(\%configuration, \%shield3);

	my %shield4 = init_det();
	$shield4{"name"}       	= "pb_shield4";
	$shield4{"mother"}     	= "electron_arm_shield_house";
	$shield4{"description"}	= "Lead Shielding BotLeft";
	$shield4{"pos"}        	= "-150*cm -495*cm 0*cm";
	$shield4{"rotation"}   	= "0*deg 0*deg 0*deg";
	$shield4{"color"}	    = "FFFFFF";
	$shield4{"type"}       	= "Box";
	$shield4{"dimensions"} 	= "100*cm 5*cm 500*cm";
	$shield4{"material"}    = "G4_Pb";
	$shield4{"visible"}    	= 1;
	$shield4{"style"}      	= 1;
	print_det(\%configuration, \%shield4);

	my %shield5 = init_det();
	$shield5{"name"}       	= "pb_shield5";
	$shield5{"mother"}     	= "electron_arm_shield_house";
	$shield5{"description"}	= "Lead Shielding BotRight";
	$shield5{"pos"}        	= "150*cm -495*cm 0*cm";
	$shield5{"rotation"}   	= "0*deg 0*deg 0*deg";
	$shield5{"color"}	    = "FFFFFF";
	$shield5{"type"}       	= "Box";
	$shield5{"dimensions"} 	= "100*cm 5*cm 500*cm";
	$shield5{"material"}    = "G4_Pb";
	$shield5{"visible"}    	= 1;
	$shield5{"style"}      	= 1;
	print_det(\%configuration, \%shield5);

	my %shield7 = init_det();
	$shield7{"name"}       	= "pb_shield7";
	$shield7{"mother"}     	= "electron_arm_shield_house";
	$shield7{"description"}	= "Lead Shielding BotBack";
	$shield7{"pos"}        	= "0*cm -495*cm 220*cm";
	$shield7{"rotation"}   	= "0*deg 0*deg 0*deg";
	$shield7{"color"}	    = "FFFFFF";
	$shield7{"type"}       	= "Box";
	$shield7{"dimensions"} 	= "250*cm 5*cm 280*cm";
	$shield7{"material"}    = "G4_Pb";
	$shield7{"visible"}    	= 1;
	$shield7{"style"}      	= 1;
	print_det(\%configuration, \%shield7);

	my %shield6 = init_det();
	$shield6{"name"}       	= "pb_shield6";
	$shield6{"mother"}     	= "electron_arm_shield_house";
	$shield6{"description"}	= "Lead Shielding Top";
	$shield6{"pos"}        	= "0*cm 450*cm 0*cm";
	$shield6{"rotation"}   	= "0*deg 0*deg 0*deg";
	$shield6{"color"}	    = "FFFFFF";
	$shield6{"type"}       	= "Box";
	$shield6{"dimensions"} 	= "250*cm 50*cm 500*cm";
	$shield6{"material"}    = "G4_Pb";
	$shield6{"visible"}    	= 1;
	$shield6{"style"}      	= 1;
	print_det(\%configuration, \%shield6);

	my %shield8 = init_det();
	$shield8{"name"}       	= "pb_shield8";
	$shield8{"mother"}     	= "electron_arm_shield_house";
	$shield8{"description"}	= "Lead Shielding Back";
	$shield8{"pos"}        	= "0*cm 0*cm 450*cm";
	$shield8{"rotation"}   	= "0*deg 0*deg 0*deg";
	$shield8{"color"}	    = "FFFFFF";
	$shield8{"type"}       	= "Box";
	$shield8{"dimensions"} 	= "250*cm 500*cm 50*cm";
	$shield8{"material"}    = "G4_Pb";
	$shield8{"visible"}    	= 1;
	$shield8{"style"}      	= 1;
	print_det(\%configuration, \%shield8);

}

sub build_eleDetector
{
	my %electron_pack = init_det();
	$electron_pack{"name"}       	= "electron_det_package";
#	$electron_pack{"mother"}     	= "root";
	$electron_pack{"mother"}     	= "electron_arm_shield_house";
	$electron_pack{"description"}	= "Electron Detector Package";
#	$electron_pack{"pos"}        	= "0*cm -245*cm -140*cm";
	$electron_pack{"pos"}        	= "0*cm -245*cm -90*cm";
#	$electron_pack{"pos"}        	= "0*cm -245*cm 0*cm";
	$electron_pack{"rotation"}   	= "0*deg 0*deg 0*deg";
	$electron_pack{"color"}	        = "B0E0E6";
	$electron_pack{"type"}       	= "Box";
#	$electron_pack{"dimensions"} 	= "358.15*cm 500*cm 500*cm";
	$electron_pack{"dimensions"} 	= "50*cm 255*cm 220*cm";
#	$electron_pack{"material"} 		= "Air_Opt";
	$electron_pack{"material"} 		= $basemat;
	$electron_pack{"visible"}    	= 0;
	$electron_pack{"style"}      	= 0;
	print_det(\%configuration, \%electron_pack);

	my %vdc_det = init_det();
	$vdc_det{"name"}       	= "vdc";
	$vdc_det{"mother"}     	= "electron_det_package";
	$vdc_det{"description"}	= "Vertical Drift Chamber";
#	$vdc_det{"pos"}        	= "0*cm -250*cm -30*cm";
	$vdc_det{"pos"}        	= "0*cm -250*cm -70*cm";
	$vdc_det{"rotation"}   	= "0*deg 0*deg 0*deg";
	$vdc_det{"color"}	    = "B87333";
	$vdc_det{"type"}       	= "Box";
	$vdc_det{"dimensions"} 	= "40*cm 1.935*cm 130*cm";
	$vdc_det{"material"}    = $basemat;
	$vdc_det{"visible"}    	= 1;
	$vdc_det{"style"}      	= 1;
	$vdc_det{"sensitivity"}	= "flux";
	$vdc_det{"hit_type"}	= "flux";
	$vdc_det{"identifiers"}	= "id manual 100";
	print_det(\%configuration, \%vdc_det);


	my %s1_det = init_det();
	$s1_det{"name"}       	= "scint_s1";
	$s1_det{"mother"}     	= "electron_det_package";
	$s1_det{"description"}	= "S1 Scintillator";
#	$s1_det{"pos"}        	= "0*cm -150*cm 0*cm";
	$s1_det{"pos"}        	= "0*cm -150*cm -40*cm";
	$s1_det{"rotation"}   	= "-45*deg 0*deg 0*deg";
	$s1_det{"color"}	        = "585858";
	$s1_det{"type"}       	= "Box";
	$s1_det{"dimensions"} 	= "40*cm 0.15*cm 130*cm";
	if ($test eq 1)
	{
		$s1_det{"material"}    	= "Air_Opt";
	}
	else
	{
		$s1_det{"material"}    	= "scintillator";
	}
	$s1_det{"visible"}    	= 1;
	$s1_det{"style"}      	= 1;
	$s1_det{"sensitivity"}	= "flux";
	$s1_det{"hit_type"}		= "flux";
	$s1_det{"identifiers"}	= "id manual 101";
	print_det(\%configuration, \%s1_det);

	my %cherenkov_det = init_det();
	$cherenkov_det{"name"}       	= "cherenkov";
	$cherenkov_det{"mother"}     	= "electron_det_package";
	$cherenkov_det{"description"}	= "Cherenkov";
#	$cherenkov_det{"pos"}        	= "0*cm -58.07611*cm 91.923875*cm";
	$cherenkov_det{"pos"}        	= "0*cm -58.07611*cm 51.923875*cm";
	$cherenkov_det{"rotation"}   	= "-45*deg 0*deg 0*deg";
	$cherenkov_det{"color"}	    	= "0000CC";
	$cherenkov_det{"type"}       	= "Box";
	$cherenkov_det{"dimensions"} 	= "40*cm 65*cm 130*cm";
	$cherenkov_det{"material"}    	= "CO2";
	$cherenkov_det{"visible"}    	= 1;
	$cherenkov_det{"style"}      	= 1;
	$cherenkov_det{"sensitivity"}	= "flux";
	$cherenkov_det{"hit_type"}		= "flux";
	$cherenkov_det{"identifiers"}	= "id manual 103";
	print_det(\%configuration, \%cherenkov_det);


	my %s2_det = init_det();
	$s2_det{"name"}       	= "scint_s2";
	$s2_det{"mother"}     	= "electron_det_package";
	$s2_det{"description"}	= "S2 Scintillator";
#	$s2_det{"pos"}        	= "0*cm -8.57864*cm 141.42135*cm";
	$s2_det{"pos"}        	= "0*cm -8.57864*cm 101.42135*cm";
	$s2_det{"rotation"}   	= "-45*deg 0*deg 0*deg";
	$s2_det{"color"}	    = "585858";
	$s2_det{"type"}       	= "Box";
	$s2_det{"dimensions"} 	= "40*cm 0.15*cm 130*cm";
	if ($test eq 1)
	{
		$s2_det{"material"}    	= "Air_Opt";
	}
	else
	{
		$s2_det{"material"}    	= "scintillator";
	}
	$s2_det{"visible"}    	= 1;
	$s2_det{"style"}      	= 1;
	$s2_det{"sensitivity"}	= "flux";
	$s2_det{"hit_type"}		= "flux";
	$s2_det{"identifiers"}	= "id manual 102";
	print_det(\%configuration, \%s2_det);

	my %psal_det = init_det();
	$psal_det{"name"}       	= "ps_al";
	$psal_det{"mother"}     	= "electron_det_package";
	$psal_det{"description"}	= "Preshower Alumninum Shield";
#	$psal_det{"pos"}        	= "0*cm -5.043706*cm 144.95688*cm";
	$psal_det{"pos"}        	= "0*cm -5.043706*cm 104.95688*cm";
	$psal_det{"rotation"}   	= "-45*deg 0*deg 0*deg";
	$psal_det{"color"}	    	= "E0E0E0";
	$psal_det{"type"}       	= "Box";
	$psal_det{"dimensions"} 	= "40*cm 0.065*cm 130*cm";
	if ($test eq 1)
	{
		$psal_det{"material"}	= $basemat;
	}
	else
	{
		$psal_det{"material"}    	= "G4_Al";
	}
	$psal_det{"visible"}    	= 1;
	$psal_det{"style"}      	= 1;
	print_det(\%configuration, \%psal_det);

	my %ps_det = init_det();
	$ps_det{"name"}       	= "ps";
	$ps_det{"mother"}     	= "electron_det_package";
	$ps_det{"description"}	= "Preshower";
#	$ps_det{"pos"}        	= "0*cm -1.462206*cm 148.53838*cm";
	$ps_det{"pos"}        	= "0*cm -1.462206*cm 108.53838*cm";
	$ps_det{"rotation"}   	= "-45*deg 0*deg 0*deg";
	$ps_det{"color"}	    = "CC9933";
	$ps_det{"type"}       	= "Box";
	$ps_det{"dimensions"} 	= "35*cm 5*cm 120*cm";
#	$ps_det{"material"}    	= "G4_GLASS_LEAD";
	$ps_det{"material"}    	= $basemat;
	$ps_det{"visible"}    	= 1;
	$ps_det{"style"}      	= 1;
	$ps_det{"sensitivity"}	= "flux";
	$ps_det{"hit_type"}		= "flux";
	$ps_det{"identifiers"}	= "id manual 104";
	print_det(\%configuration, \%ps_det);

	my %shal_det = init_det();
	$shal_det{"name"}       	= "sh_al";
	$shal_det{"mother"}     	= "electron_det_package";
	$shal_det{"description"}	= "Shower Alumninum Shield";
#	$shal_det{"pos"}        	= "0*cm 2.140503*cm 152.14109*cm";
	$shal_det{"pos"}        	= "0*cm 2.140503*cm 112.14109*cm";
	$shal_det{"rotation"}   	= "-45*deg 0*deg 0*deg";
	$shal_det{"color"}	    	= "E0E0E0";
	$shal_det{"type"}       	= "Box";
	$shal_det{"dimensions"} 	= "40*cm 0.095*cm 130*cm";
	if ($test eq 1)
	{
		$shal_det{"material"}	= $basemat;
	}
	else
	{
		$shal_det{"material"}    	= "G4_Al";
	}
	$shal_det{"visible"}    	= 1;
	$shal_det{"style"}      	= 1;
	print_det(\%configuration, \%shal_det);

	my %sh_det = init_det();
	$sh_det{"name"}       	= "sh";
	$sh_det{"mother"}     	= "electron_det_package";
	$sh_det{"description"}	= "Shower";
#	$sh_det{"pos"}        	= "0*cm 14.5820*cm 164.5826*cm";
	$sh_det{"pos"}        	= "0*cm 14.5820*cm 124.5826*cm";
	$sh_det{"rotation"}   	= "-45*deg 0*deg 0*deg";
	$sh_det{"color"}	    = "CC9933";
	$sh_det{"type"}       	= "Box";
	$sh_det{"dimensions"} 	= "36.25*cm 17.5*cm 116*cm";
	if ($test eq 1)
	{
		$sh_det{"material"}	= $basemat;
	}
	else
	{
		$sh_det{"material"}    	= "G4_GLASS_LEAD";
	}
	$sh_det{"visible"}    	= 1;
	$sh_det{"style"}      	= 1;
	$sh_det{"sensitivity"}	= "flux";
	$sh_det{"hit_type"}		= "flux";
	$sh_det{"identifiers"}	= "id manual 105";
	print_det(\%configuration, \%sh_det);



}

sub build_hand
{
	my $deg				= 62.5+$rhrsAngle;
	my $rot				= -$deg;
	my $r				= 600;
	my $angle			= $deg*0.0174532925; # Degree -> Radians
	my $x				= $r*sin($angle);
	my $z				= $r*cos($angle);
	my $xstr			= sprintf("%.5f", $x);
	my $zstr			= sprintf("%.5f", $z);
	my $rotstr			= sprintf("%.5f", $z);
	my $hand_placement	= "";
	$hand_placement	= $xstr."*cm 0*cm ".$zstr."*cm";
	my $hand_rotation	= "0*deg ".$rot."*deg 0*deg";

	if($magfield == "1.1759")
	{
		$deg			= 71.0+$rhrsAngle;
		$rot			= -$deg;
		$r				= 600;
		$angle			= $deg*0.0174532925; # Degree -> Radians
		$x				= $r*sin($angle);
		$z				= $r*cos($angle);
		$xstr			= sprintf("%.5f", $x);
		$zstr			= sprintf("%.5f", $z);
		$rotstr			= sprintf("%.5f", $z);
		$hand_placement	= "";
		$hand_placement	= $xstr."*cm 0*cm ".$zstr."*cm";
		$hand_rotation	= "0*deg ".$rot."*deg 0*deg";

	}
	if($magfield == "2.18130")
	{
		$deg			= 62.5+$rhrsAngle;
		$rot			= -$deg;
		$r				= 600;
		$angle			= $deg*0.0174532925; # Degree -> Radians
		$x				= $r*sin($angle);
		$z				= $r*cos($angle);
		$xstr			= sprintf("%.5f", $x);
		$zstr			= sprintf("%.5f", $z);
		$rotstr			= sprintf("%.5f", $z);
		$hand_placement	= "";
		$hand_placement	= $xstr."*cm 0*cm ".$zstr."*cm";
		$hand_rotation	= "0*deg ".$rot."*deg 0*deg";

	}
	if($magfield == "3.0855")
	{
		$deg			= 54.0+$rhrsAngle;
		$rot			= -$deg;
		$r				= 600;
		$angle			= $deg*0.0174532925; # Degree -> Radians
		$x				= $r*sin($angle);
		$z				= $r*cos($angle);
		$xstr			= sprintf("%.5f", $x);
		$zstr			= sprintf("%.5f", $z);
		$rotstr			= sprintf("%.5f", $z);
		$hand_placement	= "";
		$hand_placement	= $xstr."*cm 0*cm ".$zstr."*cm";
		$hand_rotation	= "0*deg ".$rot."*deg 0*deg";

	}

	printf("HAND Pb Wall Placement: $hand_placement\n");

	my %detector = init_det();
	$detector{"name"}        = "hand";
#	$detector{"mother"}      = "root";
	$detector{"mother"}      = "hall_a";
	$detector{"description"} = "Hall A Neutron Detector";
#                                 x      y     z where z=beam direction, y=Ay0 direction
	$detector{"pos"}         = $hand_placement;
	$detector{"rotation"}    = $hand_rotation;
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
	$detector{"identifiers"} = "id manual 400";
	print_det(\%configuration, \%detector);
}

sub build_pbwall
{

	my $deg				= 62.5+$rhrsAngle;
	my $rot				= -$deg;
	my $r				= 500;
	my $angle			= $deg*0.0174532925; # Degree -> Radians
	my $x				= $r*sin($angle);
	my $z				= $r*cos($angle);
	my $xstr			= sprintf("%.5f", $x);
	my $zstr			= sprintf("%.5f", $z);
	my $rotstr			= sprintf("%.5f", $z);
	my $hand_placement	= "";
	$hand_placement	= $xstr."*cm 0*cm ".$zstr."*cm";
	my $hand_rotation	= "0*deg ".$rot."*deg 0*deg";
	printf("HAND Pb Wall Placement: $hand_placement\n");

	my %pbwall = init_det();
	$pbwall{"name"}        = "lead_wall";
	$pbwall{"mother"}      = "hall_a";
	$pbwall{"description"} = "Hall A Neutron Detector - Pb Wall";
#                                 x      y     z where z=beam direction, y=Ay0 direction
	$pbwall{"pos"}         = $hand_placement;
	$pbwall{"rotation"}    = $hand_rotation;
	$pbwall{"color"}       = "B7410E";
	$pbwall{"type"}        = "Box";
	$pbwall{"dimensions"}  = "100*cm 160*cm 5*cm";
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
#build_beampipe();
build_hand();
#build_pbwall();
build_rhrs();
build_eleShieldHouse();
build_eleDetector();
build_3he_target();
