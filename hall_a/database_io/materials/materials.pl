#!/usr/bin/perl -w

use strict;
use lib ("$ENV{GEMC}/io");
use utils;
use materials;
use mirrors;

# Help Message
sub help()
{
	print "\n Usage: \n";
	print "   materials.pl <configuration filename>\n";
 	print "   Will create the Hall A materials\n";
	exit;
}

# Make sure the argument list is correct
# If not pring the help
if( scalar @ARGV != 1)
{
	help();
	exit;
}


# Loading configuration file from argument
our %configuration = load_configuration($ARGV[0]);

sub define_scintillator
{
	# Scintillator
	my %mat = init_mat();
	$mat{"name"}          = "scintillator";
	$mat{"description"}   = "Plastic Scintillator";
	$mat{"density"}       = "1.032";  # in g/cm3
	$mat{"ncomponents"}   = "2";
	$mat{"components"}    = "C 9 H 10";
	$mat{"photonEnergy"}  = "2*eV 6*eV";
	$mat{"indexOfRefraction"} = "1.001 1.05";
#	$mat{"components"}    = "C 1 H 1";
	print_mat(\%configuration, \%mat);
}

sub define_co2
{
	# Carbon Dioxide
	my %mat = init_mat();
	$mat{"name"}          = "CO2";
	$mat{"description"}   = "Carbon Dioxide at 1 atm";
	$mat{"density"}       = "0.001977";  # in g/cm3
	$mat{"ncomponents"}   = "2";
	$mat{"components"}    = "C 1 O 2";
	print_mat(\%configuration, \%mat);
}

sub define_3HeCell
{
	# 3He Target Cell
	my %mat = init_mat();
	$mat{"name"}          = "3He_Cell";
	$mat{"description"}   = "Helium 3 Cell";
	$mat{"density"}       = "0.8344";  # in g/cm3 at 0.64 MPa
#	$mat{"density"}       = "0.0001345";  # in g/cm3 at 1 atm
	$mat{"ncomponents"}   = "1";
#	$mat{"components"}    = "He 2";
#	$mat{"components"}    = "helium3Gas 2";
	$mat{"components"}    = "helium3Gas 1";
	print_mat(\%configuration, \%mat);
}

sub define_3HeGlassCell
{
	# 3He Target Cell
	my %mat = init_mat();
	$mat{"name"}          = "3He_GlassCell";
	$mat{"description"}   = "Helium 3 Glass Cell";
	$mat{"density"}       = "33.376";  # in g/cm3
#	$mat{"density"}       = "2.52";  # in g/cm3 (Density of glass)
	$mat{"ncomponents"}   = "1";
#	$mat{"components"}    = "He 2";
#	$mat{"components"}    = "helium3Gas 2";
	$mat{"components"}    = "helium3Gas 1";
	print_mat(\%configuration, \%mat);
}



define_scintillator();
define_3HeCell();
define_3HeGlassCell();
