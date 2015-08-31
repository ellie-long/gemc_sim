// ********************************************
//
// This script will read through the Hall A GEMC
// output event-by-event to look for coincidence
// events where a knocked-out neutron or proton
// in HAND coincided with a scattered electron 
// in the RHRS.
//
// Elena Long
// ellie@jlab.org
// 8/24/2015
//
// ********************************************

#include <iostream>
#include <fstream>
#include <math.h>
#include <vector>
#include <string>
#include <stdio.h>
#include <stdlib.h>

using namespace std;

void en_coincidence()
{

	TString jobID;
	jobID = getenv("PBS_JOBID");
	
	TString filename = "../output/root/";
	filename += jobID;
	filename += "-output.root";

	TChain *flux = new TChain("flux");

	ifstream ifile(filename);
	if (ifile)
	{
		flux->Add(filename);
	}

	int nentries = int(flux->GetEntries());
	cout << "nentries: " << nentries << endl;

	vector<double> *pid;
	vector<double> *id;
	flux->SetBranchAddress("pid",&pid);
	flux->SetBranchAddress("id",&id);
	int vecSize;
	TString id_text = "";
	bool nHAND = false;
	bool pHAND = false;
	bool eHAND = false;
	bool gHAND = false;
	bool eRHRS = false;
	bool isHit = false;

	int p = 0;
	int n = 0;
	int e = 0;
	int eH = 0;
	int gH = 0;
	int ep = 0;
	int en = 0;
	int eeH = 0;
	int egH = 0;
	int hits = 0;

	for (int i=0; i<nentries; i++)
//	for (int i=0; i<500000; i++)
	{
		if (i%10000==0) 
		{
			cout << "Processing event " << i << endl;
			cout << "          (Max = " << nentries << ")" << endl;
		}
		nHAND = false;
		pHAND = false;
		eHAND = false;
		gHAND = false;
		eRHRS = false;
		flux->GetEntry(i+1);
//		cout << "i = " << i << ", pid = " << pid << ", id = " << id << ", id->size() = " << id->size() << endl;
		for (int j=0; j < id->size(); j++)
		{
			if (pid->at(j)==2112 && id->at(j)==400) {nHAND = true;}
			if (pid->at(j)==2212 && id->at(j)==400) {pHAND = true;}
			if (pid->at(j)==11 && id->at(j)==400) {eHAND = true;}
			if (pid->at(j)==22 && id->at(j)==400) {gHAND = true;}
			if (pid->at(j)==11 && (id->at(j)==100 || id->at(j)==101 || id->at(j)==102 || id->at(j)==103 || id->at(j)==104 || id->at(j)==105)) {eRHRS = true;}
		}
		if (nHAND) {n++;}
		if (pHAND) {p++;}
		if (eHAND) {eH++;}
		if (gHAND) {gH++;}
		if (eRHRS) {e++;}
		if (eRHRS && nHAND) {en++;}
		if (eRHRS && eHAND) {eeH++;}
		if (eRHRS && gHAND) {egH++;}
		if (eRHRS && pHAND) {ep++;}
		if (id->size()>0) {hits++;}
	}
	cout << "Events processed: " << i << endl;
	cout << "Hits: " << hits << endl;
	cout << "n in HAND: " << n << endl;
	cout << "p in HAND: " << p << endl;
	cout << "e in RHRS: " << e << endl;
	cout << "(e,e'n): " << en << endl;
	cout << "(e,e'p): " << ep << endl << endl;
	cout << "e in HAND: " << eH << endl;
	cout << "gamma in HAND: " << gH << endl;
	cout << "(e,e'e''): " << eeH << endl;
	cout << "(e,e'g): " << egH << endl;

	TString outFilename = "../output/evt_count/";
	outFilename += jobID;
	outFilename += ".dat";

	ofstream outFile;
	outFile.open(outFilename);
	outFile << "00	Num_Electrons:	" << i << endl;
	outFile << "01	Num_Hits:	" << hits << endl;
	outFile << "02	n_in_HAND:	" << n << endl;
	outFile << "03	p_in_HAND:	" << p << endl;
	outFile << "04	e_in_RHRS:	" << e << endl;
	outFile << "05	(e,e'n):	" << en << endl;
	outFile << "06	(e,e'p):	" << ep << endl;
	outFile << "07	e_in_HAND:	" << eH << endl;
	outFile << "08	gamma_in_HAND:	" << gH << endl;
	outFile << "09	(e,e'e''):	" << eeH << endl;
	outFile << "10	(e,e'g):	" << egH << endl;
	outFile.close();

	return;
} 
















