gemc_sim
========

GEANT4 simulations built by Ellie Long using gemc. Each code is run using 

./run_gemc.csh

To build gemc (from https://gemc.jlab.org/gemc/Support/Entries/2011/8/1_Step_by_Step.html):

GENERAL REQUIREMENTS:
    -about 4GB of disk space
    -csh shell
    -cmake >= 2.8 (for clhep and geant4)
    -network connection to dwonload packages during installation
    -wget
    -scons

--------------------------------------------------------------------------
INSTALLATION INSTRUCTIONS:

If at any point these instructions fail, please contact ungaro@jlab.org with the error message.

1) Choose a directory “JLAB_ROOT” to install the software, and a JLAB_VERSION.
    A common choice for JLAB_ROOT is /opt/jlab_software.
    A good choice for JLAB_VERSION is “1.1”. All available choices can be found here.
    Set the environment variable accordingly:
    setenv JLAB_ROOT /opt/jlab_software
    setenv JLAB_VERSION 1.1

2) Get the installation scripts:
   
   cd $JLAB_ROOT
   wget http://www.jlab.org/12gev_phys/packages/sources/ceInstall/ceInstall_$JLAB_VERSION.tar.gz
   tar -zxpvf ceInstall_$JLAB_VERSION.tar.gz

3) From now on you can use these lines to setup the environment. Remember to cleanup your login scripts to avoid conflicts.

   setenv JLAB_ROOT /opt/jlab_software
   setenv JLAB_VERSION devel
   source $JLAB_ROOT/$JLAB_VERSION/ce/jlab.csh

4) Start a new shell. Now you should see a log similar to this:
  > Common Environment Version: <devel>  (Tue, 25 Feb 2014)
  > Running as ungaro on Maurizios-Mac-Pro.local
  > OS Release:    Darwin_macosx10.8-x86_64-gcc4.2.1
  > JLAB_ROOT set to:     /opt/jlab_software
  > /opt/jlab_software/devel/Darwin_macosx10.8-x86_64-gcc4.2.1 is not a directory. Creating it.
  ? Attention: No CLHEP installation found.
  ? Attention: No XERCES installation found.
  ? Attention: No mysql installation found.
  ? Attention: No QTDIR installation found.
  ? Attention: No GEANT4 installation found.
  ? Attention: No ROOT installation found.
  ? Attention: No GEMC installation found.
  ? Attention: No JANA installation found.
  ? Attention: No Scons Script installation found.
  ? Attention: No EVIO installation found.
  ? Attention: No BANKS installation found.

If you do, great. You're ready to run the installation scripts

5) Run the installation script

    cd $JLAB_ROOT/$JLAB_VERSION/install
  
    ./go_clhep
    ./go_xercesc
    ./go_mysql
    ./go_qt4
    ./go_geant4
    ./go_sconsscript
    ./go_evio
    ./go_gemc
   
    Optional: JLab magnetic field, cern ROOT, JLab banks library, JANA

    ./go_fields
    ./go_root
    ./go_banks
    ./go_jana

-------------------------------------------------

** OS version of Qt:
- Packages needed: qt qt-devel qtwebkit qtwebkit-devel qt-x11 qt-mysql









