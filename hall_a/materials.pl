#!/usr/bin/perl -w

use strict;
use lib ("$ENV{GEMC}/io");
use utils;
use materials;

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
	$mat{"description"}   = "simple scintillator material";
	$mat{"density"}       = "1.032";  # in g/cm3
	$mat{"ncomponents"}   = "2";
	$mat{"components"}    = "C 9 H 10";
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
	$mat{"components"}    = "helium3Gas 1";
	print_mat(\%configuration, \%mat);
}

define_scintillator();
define_3HeCell();

