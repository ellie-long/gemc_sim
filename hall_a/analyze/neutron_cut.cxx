// *************************************************** 
//
// This script should create a list of definitions for 
// all of the vetos and antivetos for the Hall A
// Neutron Detector 
//
// Elena Long
// 2011-10-14
// *************************************************** 

#include <iostream>
#include <fstream>
#include <math.h>
#include <vector>
#include <string>
#include <stdio.h>
#include <stdlib.h>

using namespace std;

void neutron_cut()
{

	TString jobID;
//	jobID = getenv("PBS_JOBID");
	cout << "Root file: ";
//	cin >> jobID;

	double q2;
	TString part;
	TString pbwall;
	TString momInfo;
	TString beamInfo;

	cout << "Enter Q2 (0.1, 0.5, 1.0): ";
	cin >> q2;
	cout << endl << "Enter particle (n=neutron, p=proton): ";
	cin >> part;
	cout << endl << "Lead wall? (y/n): ";
	cin >> pbwall;
	cout << endl;

	if (q2==0.1 && pbwall=="n")
	{
		// Q2=0.1 GeV2
		cout << "Q2=0.13 GeV^2, p_n = 0.393905 +/- 0.0793339 GeV" << endl;
		momInfo = "Q2=0.13 GeV^2, p_n = 0.393905 +/- 0.0793339 GeV";
		if (part=="p")
		{
//			jobID = "2015-11-06-13:14:29.6101-output.root";
			jobID = "2015-11-09-16:15:25.6303-output.root";
			cout << "Proton, no Pb wall" << endl;
			beamInfo = "Proton, no Pb wall";
		}
		if (part=="n")
		{
//			jobID = "2015-11-06-13:15:05.1994-output.root";
			jobID = "2015-11-16-15:25:02.1602-output.root";
			cout << "Neutron, no Pb wall" << endl;
			beamInfo = "Neutron, no Pb wall";
		}
	}
	else if (q2==0.1 && pbwall=="y")
	{
		// Q2=0.1 GeV2
		cout << "Q2=0.13 GeV^2, p_n = 0.393905 +/- 0.0793339 GeV" << endl;
		momInfo = "Q2=0.13 GeV^2, p_n = 0.393905 +/- 0.0793339 GeV";
		if (part=="p")
		{
			jobID = "2015-11-09-16:19:07.4512-output.root";
			cout << "Proton, with Pb wall" << endl;
			beamInfo = "Proton, with Pb wall";
		}
		if (part=="n")
		{
			jobID = "2015-11-16-10:24:37.6698-output.root";
			cout << "Neutron, with Pb wall" << endl;
			beamInfo = "Neutron, with Pb wall";
		}
	}
	else if (q2==0.5 && pbwall=="n")
	{
		// Q2=0.5 GeV2	
		cout << "Q2=0.46 GeV^2, p_n = 0.736819 +/- 0.0424121 GeV" << endl;
		momInfo = "Q2=0.46 GeV^2, p_n = 0.736819 +/- 0.0424121 GeV";
		if (part=="p")
		{
//			jobID = "2015-11-06-14:10:31.9020-output.root";
			jobID = "2015-11-16-10:25:32.3862-output.root";
			cout << "Proton, no Pb wall" << endl;
			beamInfo = "Proton, no Pb wall";
		}
		if (part=="n")
		{
//			jobID = "2015-11-06-14:10:15.3281-output.root";
			jobID = "2015-11-09-16:16:02.0547-output.root";
			cout << "Neutron, no Pb wall" << endl;
			beamInfo = "Neutron, no Pb wall";
		}
	}
	else if (q2==0.5 && pbwall=="y")
	{
		// Q2=0.5 GeV2	
		cout << "Q2=0.46 GeV^2, p_n = 0.736819 +/- 0.0424121 GeV" << endl;
		momInfo = "Q2=0.46 GeV^2, p_n = 0.736819 +/- 0.0424121 GeV";
		if (part=="p")
		{
			jobID = "2015-11-16-10:27:46.8780-output.root";
			cout << "Proton, with Pb wall" << endl;
			beamInfo = "Proton, with Pb wall";
		}
		if (part=="n")
		{
			jobID = "2015-11-16-10:28:20.2204-output.root";
			cout << "Neutron, with Pb wall" << endl;
			beamInfo = "Neutron, with Pb wall";
		}
	}
	else if (q2==1.0 && pbwall=="n")
	{
		// Q2=1.0 GeV2	
		cout << "Q2=0.96 GeV^2, p_n = 1.05507 +/- 0.0296188 GeV" << endl;
		momInfo = "Q2=0.96 GeV^2, p_n = 1.05507 +/- 0.0296188 GeV";
		if (part=="p")
		{
			jobID = "2015-11-16-11:53:24.8734-output.root";
			cout << "Proton, no Pb wall" << endl;
			beamInfo = "Proton, no Pb wall";
		}
		if (part=="n")
		{
			jobID = "2015-11-16-11:52:46.8647-output.root";
			cout << "Neutron, no Pb wall" << endl;
			beamInfo = "Neutron, no Pb wall";
		}
	}

	else if (q2==1.0 && pbwall=="y")
	{
		// Q2=1.0 GeV2	
		cout << "Q2=0.96 GeV^2, p_n = 1.05507 +/- 0.0296188 GeV" << endl;
		momInfo = "Q2=0.96 GeV^2, p_n = 1.05507 +/- 0.0296188 GeV";
		if (part=="p")
		{
//			jobID = "2015-11-06-15:02:01.6241-output.root";
			jobID = "2015-11-16-11:54:25.0559-output.root";
			cout << "Proton, with Pb wall" << endl;
			beamInfo = "Proton, with Pb wall";
		}
		if (part=="n")
		{
//			jobID = "2015-11-06-15:01:45.8999-output.root";
			jobID = "2015-11-16-11:54:56.8490-output.root";
			cout << "Neutron, with Pb wall" << endl;
			beamInfo = "Neutron, with Pb wall";
		}
	}
	else
	{
		cout << "Error: Invalid input." << endl;
		return;
	}

	// neutron, no Pb Wall:
//	jobID = "2015-10-26-14:45:41.5125-output.root";

	// neutron, with Pb Wall:
//	jobID = "2015-10-30-16:34:34.7135-output.root";
//	cout << "neutron, with Pb wall" << endl;

	// proton, no Pb wall:
//	jobID = "2015-10-30-16:29:57.2927-output.root";
	
	// proton, with Pb wall:
//	jobID = "2015-10-30-16:33:28.4328-output.root";
//	cout << "proton, with Pb wall" << endl;
	
	TString filename = "../output/root/";
	filename += jobID;
//	filename += "-output.root"

	TChain *ctof = new TChain("ctof");

	ifstream ifile(filename);
	if (ifile) {ctof->Add(filename);}

	int nentries = int(ctof->GetEntries());
	cout << "nentries: " << nentries << endl;

	vector<double> *pid;
	vector<double> *paddle;
	vector<double> *hitn;

	ctof->SetBranchAddress("pid",&pid);
	ctof->SetBranchAddress("paddle",&paddle);
	ctof->SetBranchAddress("hitn",&hitn);


	int vecSize;
	TString paddlesFired;
	TString vetosFired;
	int nPaddles;
	int nVetos;
	TString hitNum;
	int neutronHit=0;
	int goodNeutronHit=0;
	int vetoHit=0;
	int firstPaddle;
	int thisPad;
	int thisPid;
	int veto1; int veto2; int veto3; int veto4; int veto5; int veto6;
	double idealEff;
	std::list<int> padsHit;
 
	for (int i=0; i<nentries; i++)
	{
		ctof->GetEntry(i+1);
		paddlesFired = "";
		vetosFired = "";
		nPaddles = 0;
		nVetos = 0;
		hitNum = "";
		firstPaddle = 0;
		veto1 = 0; veto2 = 0; veto3 = 0; veto4 = 0; veto5 = 0; veto6 = 0;
//		if (pid->size()>0 && paddle->size()>0)
//		{
//			if ((((pid->at(0)==11) || (pid->at(0)==2212))) && paddle->at(0)>3000 && paddle->at(0)<6000)
//			{
//				firstPaddle = paddle->at(0);
//				getVetos(firstPaddle, veto1, veto2, veto3, veto4, veto5, veto6);
//				cout << "i: " << i << ", firstPaddle: " << firstPaddle <<", vetos:	";
//				cout << veto1 << "	" << veto2 << "	" << veto3 << "	" << veto4 << "	" << veto5 << "	" << veto6 << endl;
//			}
//		}
		for (int j=0; j < paddle->size(); j++)
		{
			thisPid = pid->at(j);
			thisPad = paddle->at(j);
			if(((pid->at(j)==11) || (pid->at(j)==2212)) && paddle->at(j)>3999)
			{
//				paddlesFired += paddle->at(j);
//				paddlesFired += "	";
				padsHit.push_back(paddle->at(j));
				nPaddles++;
//				hitNum += hitn->at(j);
//				hitNum += "	";
			}
		}
		padsHit.sort();
		for (int k=0; k<nPaddles; k++)
		{
			thisPad = padsHit.front();
			padsHit.pop_front();
			paddlesFired += thisPad;
			paddlesFired += "	";
			if (k==0) 
			{
				firstPaddle = thisPad;
				getVetos(thisPad, veto1, veto2, veto3, veto4, veto5, veto6);
			}
//			if(((pid->at(j)==11) || (pid->at(j)==2212)) && paddle->at(j)<4099)
//			if(((thisPid==11) || (thisPid==2212)) && (thisPad==veto1 || thisPad==veto2 || thisPad==veto3 || thisPad==veto4 || thisPad==veto5 || thisPad==veto6))
			if((firstPaddle<4100 || thisPad==veto1 || thisPad==veto2 || thisPad==veto3 || thisPad==veto4 || thisPad==veto5 || thisPad==veto6))
			{
				vetosFired += thisPad;
				vetosFired += "	";
				nVetos++;
//				hitNum += hitn->at(j);
//				hitNum += "	";
			}
		}
		if (nVetos>0)
		{
//			cout << nVetos << " vetos fired for #" << i << ": " << endl;
//			cout << vetosFired << endl;
			vetoHit++;
		}
		if (nPaddles>0)
		{
//			cout << "i: " << i << endl;
//			cout << nPaddles << " paddles fired for #" << i << ": ";
//			cout << "	pF:	" << paddlesFired << endl;
//			cout << "	1P+v:	" << firstPaddle << "	";
//			cout << veto1 << "	" << veto2 << "	" << veto3 << "	" << veto4 << "	" << veto5 << "	" << veto6 << endl;
//			cout << hitNum << endl << endl;
			neutronHit++;
		}
		if (nPaddles>0 && nVetos==0)
		{
			goodNeutronHit++;
		}
		if ((i%1000)==0) 
		{	
			cout << "Event " << i << " (" << double(i)/double(nentries)*100.0 << "\% done)" << endl;
			idealEff = double(goodNeutronHit)/double(i)*100.0;
			cout << momInfo << endl;
			cout << beamInfo << endl;
			if (part=="p")
			{
			cout << "Total Protons Thrown: " << i << endl;
			cout << "Total Neutrons Detected: " << goodNeutronHit << endl;
			cout << "Events in Vetos (Not Detected): " << vetoHit << endl;
			cout << "Mis-IDed Protons = " << idealEff << "%" << endl;
			}
			else if (part=="n")
			{
			cout << "Total Neutrons Thrown: " << i << endl;
			cout << "Total Neutrons Detected: " << goodNeutronHit << endl;
			cout << "Events in Vetos (Not Detected): " << vetoHit << endl;
			cout << "HAND Neutron ID efficiency = " << idealEff << "%" << endl;
			}	
			cout << endl;
		}
	}
	cout << endl << endl;
	cout << momInfo << endl;
	cout << beamInfo << endl;
	idealEff = double(goodNeutronHit)/double(nentries)*100.0;
	if (part=="p")
	{
	cout << "Total Protons Thrown: " << nentries << endl;
	cout << "Total Neutrons Detected: " << goodNeutronHit << endl;
	cout << "Events in Vetos (Not Detected): " << vetoHit << endl;
	cout << "Mis-IDed Protons = " << idealEff << "%" << endl;
	}
	else if (part=="n")
	{
	cout << "Total Neutrons Thrown: " << nentries << endl;
	cout << "Total Neutrons Detected: " << goodNeutronHit << endl;
	cout << "Events in Vetos (Not Detected): " << vetoHit << endl;
	cout << "HAND Neutron ID efficiency = " << idealEff << "%" << endl;
	}

}
	


void getVetos(int firstPaddle, int& veto1, int& veto2, int& veto3, int& veto4, int& veto5, int& veto6)
{

	int nplane;
	int thisbar;
	int paddle = firstPaddle;
	if (paddle>4099 && paddle<4200)
	{
		nplane=1;
		thisbar = int(paddle-4101);
	}
	if (paddle>4199 && paddle<4300)
	{
		nplane=2;
		thisbar = int(paddle-4201);
	}
	if (paddle>4299 && paddle<4400)
	{
		nplane=3;
		thisbar = int(paddle-4301);
	}
	if (paddle>4399 && paddle<4500)
	{
		nplane=4;
		thisbar = int(paddle-4401);
	}
	
//	if (includeVetos) {useSwitch = true;}
	bool includeVetos = true;
	bool includeAntivetos = false;
	bool antivetosAsVetos = false;

//	cout << "vvvvvvvvvvvvvvvvvvvvvvvvv hand_define_vetos.h vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv" << endl;
//	cout << "Plane: " << nplane << ", Bar: " << thisbar << ", jentry: " << jentry << endl;
//	cout << "Running hand_define_vetos.h for p" << nplane << "b" << thisbar << " where includeVetos=" << includeVetos <<  " where includeAntivetos=" << includeAntivetos << " and antivetosAsVetos=" << antivetosAsVetos << endl;
	// This huge set of if statements defines the vetos for each good bar we're
	// going to look at. So far the Good Bar with the most vetos has 6 vetos.
	// Most of the bars do not, in which case the last different veto is repeated 
	// in the remaining veto spaves so that extra bars aren't counted.
	// It should only turn on if includeVetos is set to TRUE.
	// Hopefully this works.
	TString veto1plane = "";
	int veto1bar;
	TString veto2plane = "";
	int veto2bar;
	TString veto3plane = "";
	int veto3bar;
	TString veto4plane = "";
	int veto4bar;
	TString veto5plane = "";
	int veto5bar;
	TString veto6plane = "";
	int veto6bar;
	TString antiveto1plane = "";
	int antiveto1bar;
	TString antiveto2plane = "";
	int antiveto2bar;
	TString antiveto3plane = "";
	int antiveto3bar;
	TString allVetos = "";
	TString allAntivetos = "";

	switch (nplane)
	{

		case 1:
			switch (thisbar)
			{
				case 0:
					veto1plane = "veto"; veto1bar = 0;
					veto2plane = "veto"; veto2bar = 1;
					veto3plane = "veto"; veto3bar = 1;
					veto4plane = "veto"; veto4bar = 1;
					veto5plane = "nd.p1"; veto5bar = 1;
					veto6plane = "nd.p1"; veto6bar = 1;
					antiveto1plane = "nd.p2"; antiveto1bar = 0;
					antiveto2plane = "nd.p2"; antiveto2bar = 1;
					antiveto3plane = "nd.p2"; antiveto3bar = 1;
					break;
				case 1:
					veto1plane = "veto"; veto1bar = 0;
					veto2plane = "veto"; veto2bar = 1;
					veto3plane = "veto"; veto3bar = 1;
					veto4plane = "nd.p1"; veto4bar = 0;
					veto5plane = "nd.p1"; veto5bar = 2;
					veto6plane = "nd.p1"; veto6bar = 2;
					antiveto1plane = "nd.p2"; antiveto1bar = 0;
					antiveto2plane = "nd.p2"; antiveto2bar = 1;
					antiveto3plane = "nd.p2"; antiveto3bar = 1;
					break;
				case 2:
					veto1plane = "veto"; veto1bar = 1;
					veto2plane = "veto"; veto2bar = 2;
					veto3plane = "veto"; veto3bar = 2;
					veto4plane = "veto"; veto4bar = 2;
					veto5plane = "nd.p1"; veto5bar = 1;
					veto6plane = "nd.p1"; veto6bar = 3;
					antiveto1plane = "nd.p2"; antiveto1bar = 1;
					antiveto2plane = "nd.p2"; antiveto2bar = 2;
					antiveto3plane = "nd.p2"; antiveto3bar = 2;
					break;
				case 3:
					veto1plane = "veto"; veto1bar = 2;
					veto2plane = "veto"; veto2bar = 3;
					veto3plane = "veto"; veto3bar = 3;
					veto4plane = "veto"; veto4bar = 3;
					veto5plane = "nd.p1"; veto5bar = 2;
					veto6plane = "nd.p1"; veto6bar = 4;
					antiveto1plane = "nd.p2"; antiveto1bar = 2;
					antiveto2plane = "nd.p2"; antiveto2bar = 3;
					antiveto3plane = "nd.p2"; antiveto3bar = 3;
					break;
				case 4:
					veto1plane = "veto"; veto1bar = 3;
					veto2plane = "veto"; veto2bar = 4;
					veto3plane = "veto"; veto3bar = 4;
					veto4plane = "veto"; veto4bar = 4;
					veto5plane = "nd.p1"; veto5bar = 3;
					veto6plane = "nd.p1"; veto6bar = 5;
					antiveto1plane = "nd.p2"; antiveto1bar = 3;
					antiveto2plane = "nd.p2"; antiveto2bar = 4;
					antiveto3plane = "nd.p2"; antiveto3bar = 4;
					break;
				case 5:
					veto1plane = "veto"; veto1bar = 4;
					veto2plane = "veto"; veto2bar = 5;
					veto3plane = "veto"; veto3bar = 5;
					veto4plane = "veto"; veto4bar = 5;
					veto5plane = "nd.p1"; veto5bar = 4;
					veto6plane = "nd.p1"; veto6bar = 6;
					antiveto1plane = "nd.p2"; antiveto1bar = 3;
					antiveto2plane = "nd.p2"; antiveto2bar = 4;
					antiveto3plane = "nd.p2"; antiveto3bar = 5;
					break;
				case 6:
					veto1plane = "veto"; veto1bar = 5;
					veto2plane = "veto"; veto2bar = 6;
					veto3plane = "veto"; veto3bar = 6;
					veto4plane = "veto"; veto4bar = 6;
					veto5plane = "nd.p1"; veto5bar = 5;
					veto6plane = "nd.p1"; veto6bar = 7;
					antiveto1plane = "nd.p2"; antiveto1bar = 4;
					antiveto2plane = "nd.p2"; antiveto2bar = 5;
					antiveto3plane = "nd.p2"; antiveto3bar = 5;
					break;
				case 7: 
					veto1plane = "veto"; veto1bar = 6;
					veto2plane = "veto"; veto2bar = 7;
					veto3plane = "veto"; veto3bar = 7;
					veto4plane = "veto"; veto4bar = 7;
					veto5plane = "nd.p1"; veto5bar = 6;
					veto6plane = "nd.p1"; veto6bar = 8;
					antiveto1plane = "nd.p2"; antiveto1bar = 5;
					antiveto2plane = "nd.p2"; antiveto2bar = 6;
					antiveto3plane = "nd.p2"; antiveto3bar = 6;
					break;
				case 8:
					veto1plane = "veto"; veto1bar = 7;
					veto2plane = "veto"; veto2bar = 8; 
					veto3plane = "veto"; veto3bar = 10; 
					veto4plane = "veto"; veto4bar = 10;
					veto5plane = "nd.p1"; veto5bar = 7;
					veto6plane = "nd.p1"; veto6bar = 9;
					antiveto1plane = "nd.p2"; antiveto1bar = 6;
					antiveto2plane = "nd.p2"; antiveto2bar = 7;
					antiveto3plane = "nd.p2"; antiveto3bar = 7;
					break;
				case 9:
					veto1plane = "veto"; veto1bar = 8;
					veto2plane = "veto"; veto2bar = 9; 
					veto3plane = "veto"; veto3bar = 10;
					veto4plane = "veto"; veto4bar = 11; 
					veto5plane = "nd.p1"; veto5bar = 8;
					veto6plane = "nd.p1"; veto6bar = 10;
					antiveto1plane = "nd.p2"; antiveto1bar = 7;
					antiveto2plane = "nd.p2"; antiveto2bar = 8;
					antiveto3plane = "nd.p2"; antiveto3bar = 8;
					break;
				case 10:
					veto1plane = "veto"; veto1bar = 9;
					veto2plane = "veto"; veto2bar = 11;
					veto3plane = "veto"; veto3bar = 12;
					veto4plane = "veto"; veto4bar = 12;
					veto5plane = "nd.p1"; veto5bar = 9;
					veto6plane = "nd.p1"; veto6bar = 11;
					antiveto1plane = "nd.p2"; antiveto1bar = 7;
					antiveto2plane = "nd.p2"; antiveto2bar = 8;
					antiveto3plane = "nd.p2"; antiveto3bar = 9;
					break;
				case 11:
					veto1plane = "veto"; veto1bar = 9;
					veto2plane = "veto"; veto2bar = 12;
					veto3plane = "veto"; veto3bar = 13;
					veto4plane = "veto"; veto4bar = 13;
					veto5plane = "nd.p1"; veto5bar = 10;
					veto6plane = "nd.p1"; veto6bar = 12;
					antiveto1plane = "nd.p2"; antiveto1bar = 8;
					antiveto2plane = "nd.p2"; antiveto2bar = 9;
					antiveto3plane = "nd.p2"; antiveto3bar = 9;
					break;
				case 12:
					veto1plane = "veto"; veto1bar = 13;
					veto2plane = "veto"; veto2bar = 14;
					veto3plane = "veto"; veto3bar = 14;
					veto4plane = "veto"; veto4bar = 14;
					veto5plane = "nd.p1"; veto5bar = 11;
					veto6plane = "nd.p1"; veto6bar = 13;
					antiveto1plane = "nd.p2"; antiveto1bar = 9;
					antiveto2plane = "nd.p2"; antiveto2bar = 10;
					antiveto3plane = "nd.p2"; antiveto3bar = 10;
					break;
				case 13:
					veto1plane = "veto"; veto1bar = 13;
					veto2plane = "veto"; veto2bar = 14;
					veto3plane = "veto"; veto3bar = 15;
					veto4plane = "veto"; veto4bar = 15;
					veto5plane = "nd.p1"; veto5bar = 12;
					veto6plane = "nd.p1"; veto6bar = 14;
					antiveto1plane = "nd.p2"; antiveto1bar = 10;
					antiveto2plane = "nd.p2"; antiveto2bar = 11;
					antiveto3plane = "nd.p2"; antiveto3bar = 11;
					break;
				case 14:
					veto1plane = "veto"; veto1bar = 14;
					veto2plane = "veto"; veto2bar = 15;
					veto3plane = "veto"; veto3bar = 16;
					veto4plane = "veto"; veto4bar = 16;
					veto5plane = "nd.p1"; veto5bar = 13;
					veto6plane = "nd.p1"; veto6bar = 15;
					antiveto1plane = "nd.p2"; antiveto1bar = 11;
					antiveto2plane = "nd.p2"; antiveto2bar = 12;
					antiveto3plane = "nd.p2"; antiveto3bar = 12;
					break;
				case 15:
					veto1plane = "veto"; veto1bar = 15;
					veto2plane = "veto"; veto2bar = 16;
					veto3plane = "veto"; veto3bar = 17;
					veto4plane = "veto"; veto4bar = 17;
					veto5plane = "nd.p1"; veto5bar = 14;
					veto6plane = "nd.p1"; veto6bar = 16;
					antiveto1plane = "nd.p2"; antiveto1bar = 11;
					antiveto2plane = "nd.p2"; antiveto2bar = 12;
					antiveto3plane = "nd.p2"; antiveto3bar = 12;
					break;
				case 16:
					veto1plane = "veto"; veto1bar = 16;
					veto2plane = "veto"; veto2bar = 17;
					veto3plane = "veto"; veto3bar = 18;
					veto4plane = "veto"; veto4bar = 18;
					veto5plane = "nd.p1"; veto5bar = 15;
					veto6plane = "nd.p1"; veto6bar = 17;
					antiveto1plane = "nd.p2"; antiveto1bar = 12;
					antiveto2plane = "nd.p2"; antiveto2bar = 13;
					antiveto3plane = "nd.p2"; antiveto3bar = 13;
					break;
				case 17:
					veto1plane = "veto"; veto1bar = 17;
					veto2plane = "veto"; veto2bar = 18;
					veto3plane = "veto"; veto3bar = 19;
					veto4plane = "veto"; veto4bar = 19;
					veto5plane = "nd.p1"; veto5bar = 16;
					veto6plane = "nd.p1"; veto6bar = 18;
					antiveto1plane = "nd.p2"; antiveto1bar = 13;
					antiveto2plane = "nd.p2"; antiveto2bar = 14;
					antiveto3plane = "nd.p2"; antiveto3bar = 14;
					break;
				case 18:
					veto1plane = "veto"; veto1bar = 18;
					veto2plane = "veto"; veto2bar = 19;
					veto3plane = "veto"; veto3bar = 20;
					veto4plane = "veto"; veto4bar = 22;
					veto5plane = "nd.p1"; veto5bar = 17;
					veto6plane = "nd.p1"; veto6bar = 19;
					antiveto1plane = "nd.p2"; antiveto1bar = 14;
					antiveto2plane = "nd.p2"; antiveto2bar = 15;
					antiveto3plane = "nd.p2"; antiveto3bar = 15;
					break;
				case 19:
					veto1plane = "veto"; veto1bar = 19;
					veto2plane = "veto"; veto2bar = 20;
					veto3plane = "veto"; veto3bar = 22;
					veto4plane = "veto"; veto4bar = 22;
					veto5plane = "nd.p1"; veto5bar = 18;
					veto6plane = "nd.p1"; veto6bar = 20;
					antiveto1plane = "nd.p2"; antiveto1bar = 15;
					antiveto2plane = "nd.p2"; antiveto2bar = 16;
					antiveto3plane = "nd.p2"; antiveto3bar = 16;
					break;
				case 20:
					veto1plane = "veto"; veto1bar = 20;
					veto2plane = "veto"; veto2bar = 21;
					veto3plane = "veto"; veto3bar = 22;
					veto4plane = "veto"; veto4bar = 23;
					veto5plane = "nd.p1"; veto5bar = 19;
					veto6plane = "nd.p1"; veto6bar = 21;
					antiveto1plane = "nd.p2"; antiveto1bar = 15;
					antiveto2plane = "nd.p2"; antiveto2bar = 16;
					antiveto3plane = "nd.p2"; antiveto3bar = 17;
					break;
				case 21:
					veto1plane = "veto"; veto1bar = 21;
					veto2plane = "veto"; veto2bar = 23;
					veto3plane = "veto"; veto3bar = 24;
					veto4plane = "veto"; veto4bar = 24;
					veto5plane = "nd.p1"; veto5bar = 20;
					veto6plane = "nd.p1"; veto6bar = 22;
					antiveto1plane = "nd.p2"; antiveto1bar = 16;
					antiveto2plane = "nd.p2"; antiveto2bar = 17;
					antiveto3plane = "nd.p2"; antiveto3bar = 17;
					break;
				case 22:
					veto1plane = "veto"; veto1bar = 24;
					veto2plane = "veto"; veto2bar = 25;
					veto3plane = "veto"; veto3bar = 25;
					veto4plane = "veto"; veto4bar = 25;
					veto5plane = "nd.p1"; veto5bar = 21;
					veto6plane = "nd.p1"; veto6bar = 23;
					antiveto1plane = "nd.p2"; antiveto1bar = 17;
					antiveto2plane = "nd.p2"; antiveto2bar = 18;
					antiveto3plane = "nd.p2"; antiveto3bar = 18;
					break;
				case 23:
					veto1plane = "veto"; veto1bar = 25;
					veto2plane = "veto"; veto2bar = 26;
					veto3plane = "veto"; veto3bar = 26;
					veto4plane = "veto"; veto4bar = 26;
					veto5plane = "nd.p1"; veto5bar = 22;
					veto6plane = "nd.p1"; veto6bar = 24;
					antiveto1plane = "nd.p2"; antiveto1bar = 18;
					antiveto2plane = "nd.p2"; antiveto2bar = 19;
					antiveto3plane = "nd.p2"; antiveto3bar = 19;
					break;	
				case 24:
					veto1plane = "veto"; veto1bar = 26;
					veto2plane = "veto"; veto2bar = 27;
					veto3plane = "veto"; veto3bar = 27;
					veto4plane = "veto"; veto4bar = 27;
					veto5plane = "nd.p1"; veto5bar = 23;
					veto6plane = "nd.p1"; veto6bar = 25;
					antiveto1plane = "nd.p2"; antiveto1bar = 19;
					antiveto2plane = "nd.p2"; antiveto2bar = 20;
					antiveto3plane = "nd.p2"; antiveto3bar = 20;
					break;	
				case 25:
					veto1plane = "veto"; veto1bar = 27;
					veto2plane = "veto"; veto2bar = 28;
					veto3plane = "veto"; veto3bar = 28;
					veto4plane = "veto"; veto4bar = 28;
					veto5plane = "nd.p1"; veto5bar = 24;
					veto6plane = "nd.p1"; veto6bar = 26;
					antiveto1plane = "nd.p2"; antiveto1bar = 19;
					antiveto2plane = "nd.p2"; antiveto2bar = 20;
					antiveto3plane = "nd.p2"; antiveto3bar = 21;
					break;	
				case 26:
					veto1plane = "veto"; veto1bar = 27;
					veto2plane = "veto"; veto2bar = 28;
					veto3plane = "veto"; veto3bar = 29;
					veto4plane = "veto"; veto4bar = 29;
					veto5plane = "nd.p1"; veto5bar = 25;
					veto6plane = "nd.p1"; veto6bar = 27;
					antiveto1plane = "nd.p2"; antiveto1bar = 20;
					antiveto2plane = "nd.p2"; antiveto2bar = 21;
					antiveto3plane = "nd.p2"; antiveto3bar = 21;
					break;	
				case 27:
					veto1plane = "veto"; veto1bar = 28;
					veto2plane = "veto"; veto2bar = 29;
					veto3plane = "veto"; veto3bar = 30;
					veto4plane = "veto"; veto4bar = 30;
					veto5plane = "nd.p1"; veto5bar = 26;
					veto6plane = "nd.p1"; veto6bar = 28;
					antiveto1plane = "nd.p2"; antiveto1bar = 21;
					antiveto2plane = "nd.p2"; antiveto2bar = 22;
					antiveto3plane = "nd.p2"; antiveto3bar = 22;
					break;	
				case 28:
					veto1plane = "veto"; veto1bar = 29;
					veto2plane = "veto"; veto2bar = 30;
					veto3plane = "veto"; veto3bar = 31;
					veto4plane = "veto"; veto4bar = 31;
					veto5plane = "nd.p1"; veto5bar = 27;
					veto6plane = "nd.p1"; veto6bar = 29;
					antiveto1plane = "nd.p2"; antiveto1bar = 22;
					antiveto2plane = "nd.p2"; antiveto2bar = 23;
					antiveto3plane = "nd.p2"; antiveto3bar = 23;
					break;	
				case 29:
					veto1plane = "veto"; veto1bar = 30;
					veto2plane = "veto"; veto2bar = 31;
					veto3plane = "veto"; veto3bar = 31;
					veto4plane = "veto"; veto4bar = 31;
					veto5plane = "nd.p1"; veto5bar = 28;
					veto6plane = "nd.p1"; veto6bar = 28;
					antiveto1plane = "nd.p2"; antiveto1bar = 22;
					antiveto2plane = "nd.p2"; antiveto2bar = 23;
					antiveto3plane = "nd.p2"; antiveto3bar = 23;
					break;	
			}
			break;
		case 2:
			switch (thisbar)
			{
				case 0:
					veto1plane = "nd.p1"; veto1bar = 0;
					veto2plane = "nd.p1"; veto2bar = 1;
					veto3plane = "nd.p2"; veto3bar = 1;
					veto4plane = "nd.p2"; veto4bar = 1;
					veto5plane = "nd.p2"; veto5bar = 1;
					veto6plane = "nd.p2"; veto6bar = 1;
					antiveto1plane = "nd.p3"; antiveto1bar = 0;
					antiveto2plane = "nd.p3"; antiveto2bar = 0;
					antiveto3plane = "nd.p3"; antiveto3bar = 0;
					break;
				case 1:
					veto1plane = "nd.p1"; veto1bar = 1;
					veto2plane = "nd.p1"; veto2bar = 2;
					veto3plane = "nd.p2"; veto3bar = 0;
					veto4plane = "nd.p2"; veto4bar = 2;
					veto5plane = "nd.p2"; veto5bar = 2;
					veto6plane = "nd.p2"; veto6bar = 2;
					antiveto1plane = "nd.p3"; antiveto1bar = 0;
					antiveto2plane = "nd.p3"; antiveto2bar = 1;
					antiveto3plane = "nd.p3"; antiveto3bar = 1;
					break;
				case 2:
					veto1plane = "nd.p1"; veto1bar = 2;
					veto2plane = "nd.p1"; veto2bar = 3;
					veto3plane = "nd.p2"; veto3bar = 1;
					veto4plane = "nd.p2"; veto4bar = 3;
					veto5plane = "nd.p2"; veto5bar = 3;
					veto6plane = "nd.p2"; veto6bar = 3;
					antiveto1plane = "nd.p3"; antiveto1bar = 1;
					antiveto2plane = "nd.p3"; antiveto2bar = 2;
					antiveto3plane = "nd.p3"; antiveto3bar = 2;
					break;
				case 3:
					veto1plane = "nd.p1"; veto1bar = 3;
					veto2plane = "nd.p1"; veto2bar = 4;
					veto3plane = "nd.p1"; veto3bar = 5;
					veto4plane = "nd.p2"; veto4bar = 2;
					veto5plane = "nd.p2"; veto5bar = 4;
					veto6plane = "nd.p2"; veto6bar = 4;
					antiveto1plane = "nd.p3"; antiveto1bar = 2;
					antiveto2plane = "nd.p3"; antiveto2bar = 3;
					antiveto3plane = "nd.p3"; antiveto3bar = 3;
					break;
				case 4:
					veto1plane = "nd.p1"; veto1bar = 4;
					veto2plane = "nd.p1"; veto2bar = 5;
					veto3plane = "nd.p1"; veto3bar = 6;
					veto4plane = "nd.p2"; veto4bar = 3;
					veto5plane = "nd.p2"; veto5bar = 5;
					veto6plane = "nd.p2"; veto6bar = 5;
					antiveto1plane = "nd.p3"; antiveto1bar = 3;
					antiveto2plane = "nd.p3"; antiveto2bar = 4;
					antiveto3plane = "nd.p3"; antiveto3bar = 4;
					break;
				case 5:
					veto1plane = "nd.p1"; veto1bar = 6;
					veto2plane = "nd.p1"; veto2bar = 7;
					veto3plane = "nd.p2"; veto3bar = 4;
					veto4plane = "nd.p2"; veto4bar = 6;
					veto5plane = "nd.p2"; veto5bar = 6;
					veto6plane = "nd.p2"; veto6bar = 6;
					antiveto1plane = "nd.p3"; antiveto1bar = 4;
					antiveto2plane = "nd.p3"; antiveto2bar = 5;
					antiveto3plane = "nd.p3"; antiveto3bar = 5;
					break;
				case 6:
					veto1plane = "nd.p1"; veto1bar = 7;
					veto2plane = "nd.p1"; veto2bar = 8;
					veto3plane = "nd.p2"; veto3bar = 5;
					veto4plane = "nd.p2"; veto4bar = 7;
					veto5plane = "nd.p2"; veto5bar = 7;
					veto6plane = "nd.p2"; veto6bar = 7;
					antiveto1plane = "nd.p3"; antiveto1bar = 4;
					antiveto2plane = "nd.p3"; antiveto2bar = 5;
					antiveto3plane = "nd.p3"; antiveto3bar = 5;
					break;
				case 7: 
					veto1plane = "nd.p1"; veto1bar = 8;
					veto2plane = "nd.p1"; veto2bar = 9;
					veto3plane = "nd.p1"; veto3bar = 10;
					veto4plane = "nd.p2"; veto4bar = 6;
					veto5plane = "nd.p2"; veto5bar = 8;
					veto6plane = "nd.p2"; veto6bar = 8;
					antiveto1plane = "nd.p3"; antiveto1bar = 5;
					antiveto2plane = "nd.p3"; antiveto2bar = 6;
					antiveto3plane = "nd.p3"; antiveto3bar = 6;
					break;
				case 8:
					veto1plane = "nd.p1"; veto1bar = 9;
					veto2plane = "nd.p1"; veto2bar = 10; 
					veto3plane = "nd.p1"; veto3bar = 11; 
					veto4plane = "nd.p2"; veto4bar = 7;
					veto5plane = "nd.p2"; veto5bar = 9;
					veto6plane = "nd.p2"; veto6bar = 9;
					antiveto1plane = "nd.p3"; antiveto1bar = 6;
					antiveto2plane = "nd.p3"; antiveto2bar = 7;
					antiveto3plane = "nd.p3"; antiveto3bar = 7;
					break;
				case 9:
					veto1plane = "nd.p1"; veto1bar = 11;
					veto2plane = "nd.p1"; veto2bar = 12; 
					veto3plane = "nd.p2"; veto3bar = 8;
					veto4plane = "nd.p2"; veto4bar = 10; 
					veto5plane = "nd.p2"; veto5bar = 10;
					veto6plane = "nd.p2"; veto6bar = 10;
					antiveto1plane = "nd.p3"; antiveto1bar = 7;
					antiveto2plane = "nd.p3"; antiveto2bar = 8;
					antiveto3plane = "nd.p3"; antiveto3bar = 8;
					break;
				case 10:
					veto1plane = "nd.p1"; veto1bar = 12;
					veto2plane = "nd.p1"; veto2bar = 13;
					veto3plane = "nd.p2"; veto3bar = 9;
					veto4plane = "nd.p2"; veto4bar = 11;
					veto5plane = "nd.p1"; veto5bar = 11;
					veto6plane = "nd.p1"; veto6bar = 14;
					antiveto1plane = "nd.p3"; antiveto1bar = 8;
					antiveto2plane = "nd.p3"; antiveto2bar = 9;
					antiveto3plane = "nd.p3"; antiveto3bar = 10;
					break;
				case 11:
					veto1plane = "nd.p1"; veto1bar = 13;
					veto2plane = "nd.p1"; veto2bar = 14;
					veto3plane = "nd.p1"; veto3bar = 15;
					veto4plane = "nd.p2"; veto4bar = 10;
					veto5plane = "nd.p2"; veto5bar = 12;
					veto6plane = "nd.p2"; veto6bar = 12;
					antiveto1plane = "nd.p3"; antiveto1bar = 9;
					antiveto2plane = "nd.p3"; antiveto2bar = 10;
					antiveto3plane = "nd.p3"; antiveto3bar = 11;
					break;
				case 12:
					veto1plane = "nd.p1"; veto1bar = 14;
					veto2plane = "nd.p1"; veto2bar = 15;
					veto3plane = "nd.p1"; veto3bar = 16;
					veto4plane = "nd.p2"; veto4bar = 11;
					veto5plane = "nd.p2"; veto5bar = 13;
					veto6plane = "nd.p2"; veto6bar = 13;
					antiveto1plane = "nd.p3"; antiveto1bar = 10;
					antiveto2plane = "nd.p3"; antiveto2bar = 11;
					antiveto3plane = "nd.p3"; antiveto3bar = 12;
					break;
				case 13:
					veto1plane = "nd.p1"; veto1bar = 16;
					veto2plane = "nd.p1"; veto2bar = 17;
					veto3plane = "nd.p2"; veto3bar = 12;
					veto4plane = "nd.p2"; veto4bar = 14;
					veto5plane = "nd.p2"; veto5bar = 14;
					veto6plane = "nd.p2"; veto6bar = 14;
					antiveto1plane = "nd.p3"; antiveto1bar = 12;
					antiveto2plane = "nd.p3"; antiveto2bar = 13;
					antiveto3plane = "nd.p3"; antiveto3bar = 13;
					break;
				case 14:
					veto1plane = "nd.p1"; veto1bar = 17;
					veto2plane = "nd.p1"; veto2bar = 18;
					veto3plane = "nd.p2"; veto3bar = 13;
					veto4plane = "nd.p2"; veto4bar = 15;
					veto5plane = "nd.p2"; veto5bar = 15;
					veto6plane = "nd.p2"; veto6bar = 15;
					antiveto1plane = "nd.p3"; antiveto1bar = 13;
					antiveto2plane = "nd.p3"; antiveto2bar = 14;
					antiveto3plane = "nd.p3"; antiveto3bar = 14;
					break;
				case 15:
					veto1plane = "nd.p1"; veto1bar = 18;
					veto2plane = "nd.p1"; veto2bar = 19;
					veto3plane = "nd.p1"; veto3bar = 20;
					veto4plane = "nd.p2"; veto4bar = 14;
					veto5plane = "nd.p2"; veto5bar = 16;
					veto6plane = "nd.p2"; veto6bar = 16;
					antiveto1plane = "nd.p3"; antiveto1bar = 14;
					antiveto2plane = "nd.p3"; antiveto2bar = 15;
					antiveto3plane = "nd.p3"; antiveto3bar = 15;
					break;
				case 16:
					veto1plane = "nd.p1"; veto1bar = 19;
					veto2plane = "nd.p1"; veto2bar = 20;
					veto3plane = "nd.p1"; veto3bar = 21;
					veto4plane = "nd.p2"; veto4bar = 15;
					veto5plane = "nd.p2"; veto5bar = 17;
					veto6plane = "nd.p2"; veto6bar = 17;
					antiveto1plane = "nd.p3"; antiveto1bar = 15;
					antiveto2plane = "nd.p3"; antiveto2bar = 16;
					antiveto3plane = "nd.p3"; antiveto3bar = 16;
					break;
				case 17:
					veto1plane = "nd.p1"; veto1bar = 21;
					veto2plane = "nd.p1"; veto2bar = 22;
					veto3plane = "nd.p2"; veto3bar = 16;
					veto4plane = "nd.p2"; veto4bar = 18;
					veto5plane = "nd.p2"; veto5bar = 18;
					veto6plane = "nd.p2"; veto6bar = 18;
					antiveto1plane = "nd.p3"; antiveto1bar = 16;
					antiveto2plane = "nd.p3"; antiveto2bar = 17;
					antiveto3plane = "nd.p3"; antiveto3bar = 17;
					break;
				case 18:
					veto1plane = "nd.p1"; veto1bar = 22;
					veto2plane = "nd.p1"; veto2bar = 23;
					veto3plane = "nd.p1"; veto3bar = 23;
					veto4plane = "nd.p2"; veto4bar = 17;
					veto5plane = "nd.p2"; veto5bar = 19;
					veto6plane = "nd.p2"; veto6bar = 19;
					antiveto1plane = "nd.p3"; antiveto1bar = 16;
					antiveto2plane = "nd.p3"; antiveto2bar = 17;
					antiveto3plane = "nd.p3"; antiveto3bar = 17;
					break;
				case 19:
					veto1plane = "nd.p1"; veto1bar = 23;
					veto2plane = "nd.p1"; veto2bar = 24;
					veto3plane = "nd.p1"; veto3bar = 25;
					veto4plane = "nd.p2"; veto4bar = 18;
					veto5plane = "nd.p2"; veto5bar = 20;
					veto6plane = "nd.p2"; veto6bar = 20;
					antiveto1plane = "nd.p3"; antiveto1bar = 17;
					antiveto2plane = "nd.p3"; antiveto2bar = 18;
					antiveto3plane = "nd.p3"; antiveto3bar = 18;
					break;
				case 20:
					veto1plane = "nd.p1"; veto1bar = 24;
					veto2plane = "nd.p1"; veto2bar = 25;
					veto3plane = "nd.p1"; veto3bar = 26;
					veto4plane = "nd.p2"; veto4bar = 19;
					veto5plane = "nd.p2"; veto5bar = 21;
					veto6plane = "nd.p2"; veto6bar = 21;
					antiveto1plane = "nd.p3"; antiveto1bar = 18;
					antiveto2plane = "nd.p3"; antiveto2bar = 19;
					antiveto3plane = "nd.p3"; antiveto3bar = 19;
					break;
				case 21:
					veto1plane = "nd.p1"; veto1bar = 26;
					veto2plane = "nd.p1"; veto2bar = 27;
					veto3plane = "nd.p1"; veto3bar = 27;
					veto4plane = "nd.p2"; veto4bar = 20;
					veto5plane = "nd.p2"; veto5bar = 22;
					veto6plane = "nd.p2"; veto6bar = 22;
					antiveto1plane = "nd.p3"; antiveto1bar = 19;
					antiveto2plane = "nd.p3"; antiveto2bar = 20;
					antiveto3plane = "nd.p3"; antiveto3bar = 20;
					break;
				case 22:
					veto1plane = "nd.p1"; veto1bar = 27;
					veto2plane = "nd.p1"; veto2bar = 28;
					veto3plane = "nd.p1"; veto3bar = 28;
					veto4plane = "nd.p2"; veto4bar = 21;
					veto5plane = "nd.p2"; veto5bar = 23;
					veto6plane = "nd.p2"; veto6bar = 23;
					antiveto1plane = "nd.p3"; antiveto1bar = 20;
					antiveto2plane = "nd.p3"; antiveto2bar = 21;
					antiveto3plane = "nd.p3"; antiveto3bar = 21;
					break;
				case 23:
					veto1plane = "nd.p1"; veto1bar = 28;
					veto2plane = "nd.p1"; veto2bar = 29;
					veto3plane = "nd.p1"; veto3bar = 29;
					veto4plane = "nd.p2"; veto4bar = 22;
					veto5plane = "nd.p2"; veto5bar = 22;
					veto6plane = "nd.p2"; veto6bar = 22;
					antiveto1plane = "nd.p3"; antiveto1bar = 21;
					antiveto2plane = "nd.p3"; antiveto2bar = 21;
					antiveto3plane = "nd.p3"; antiveto3bar = 21;
					break;
			}
			break;
		case 3:
			switch (thisbar)
			{
				case 0:
					veto1plane = "nd.p2"; veto1bar = 0;
					veto2plane = "nd.p2"; veto2bar = 1;
					veto3plane = "nd.p2"; veto3bar = 1;
					veto4plane = "nd.p2"; veto4bar = 1;
					veto5plane = "nd.p3"; veto5bar = 1;
					veto6plane = "nd.p3"; veto6bar = 1;
					antiveto1plane = "nd.p4"; antiveto1bar = 0;
					antiveto2plane = "nd.p4"; antiveto2bar = 0;
					antiveto3plane = "nd.p4"; antiveto3bar = 0;
					break;
				case 1:
					veto1plane = "nd.p2"; veto1bar = 1;
					veto2plane = "nd.p2"; veto2bar = 2;
					veto3plane = "nd.p2"; veto3bar = 2;
					veto4plane = "nd.p2"; veto4bar = 2;
					veto5plane = "nd.p3"; veto5bar = 0;
					veto6plane = "nd.p3"; veto6bar = 2;
					antiveto1plane = "nd.p4"; antiveto1bar = 0;
					antiveto2plane = "nd.p4"; antiveto2bar = 1;
					antiveto3plane = "nd.p4"; antiveto3bar = 1;
					break;
				case 2:
					veto1plane = "nd.p2"; veto1bar = 2;
					veto2plane = "nd.p2"; veto2bar = 3;
					veto3plane = "nd.p2"; veto3bar = 3;
					veto4plane = "nd.p2"; veto4bar = 3;
					veto5plane = "nd.p3"; veto5bar = 1;
					veto6plane = "nd.p3"; veto6bar = 3;
					antiveto1plane = "nd.p4"; antiveto1bar = 1;
					antiveto2plane = "nd.p4"; antiveto2bar = 1;
					antiveto3plane = "nd.p4"; antiveto3bar = 1;
					break;
				case 3:
					veto1plane = "nd.p2"; veto1bar = 3;
					veto2plane = "nd.p2"; veto2bar = 4;
					veto3plane = "nd.p2"; veto3bar = 4;
					veto4plane = "nd.p2"; veto4bar = 4;
					veto5plane = "nd.p3"; veto5bar = 2;
					veto6plane = "nd.p3"; veto6bar = 4;
					antiveto1plane = "nd.p4"; antiveto1bar = 1;
					antiveto2plane = "nd.p4"; antiveto2bar = 2;
					antiveto3plane = "nd.p4"; antiveto3bar = 2;
					break;
				case 4:
					veto1plane = "nd.p2"; veto1bar = 4;
					veto2plane = "nd.p2"; veto2bar = 5;
					veto3plane = "nd.p2"; veto3bar = 6;
					veto4plane = "nd.p2"; veto4bar = 6;
					veto5plane = "nd.p3"; veto5bar = 3;
					veto6plane = "nd.p3"; veto6bar = 5;
					antiveto1plane = "nd.p4"; antiveto1bar = 2;
					antiveto2plane = "nd.p4"; antiveto2bar = 3;
					antiveto3plane = "nd.p4"; antiveto3bar = 3;
					break;
				case 5:
					veto1plane = "nd.p2"; veto1bar = 5;
					veto2plane = "nd.p2"; veto2bar = 6;
					veto3plane = "nd.p2"; veto3bar = 7;
					veto4plane = "nd.p2"; veto4bar = 7;
					veto5plane = "nd.p3"; veto5bar = 4;
					veto6plane = "nd.p3"; veto6bar = 6;
					antiveto1plane = "nd.p4"; antiveto1bar = 2;
					antiveto2plane = "nd.p4"; antiveto2bar = 3;
					antiveto3plane = "nd.p4"; antiveto3bar = 3;
					break;
				case 6:
					veto1plane = "nd.p2"; veto1bar = 7;
					veto2plane = "nd.p2"; veto2bar = 8;
					veto3plane = "nd.p2"; veto3bar = 8;
					veto4plane = "nd.p2"; veto4bar = 8;
					veto5plane = "nd.p3"; veto5bar = 5;
					veto6plane = "nd.p3"; veto6bar = 7;
					antiveto1plane = "nd.p4"; antiveto1bar = 3;
					antiveto2plane = "nd.p4"; antiveto2bar = 4;
					antiveto3plane = "nd.p4"; antiveto3bar = 4;
					break;
				case 7:
					veto1plane = "nd.p2"; veto1bar = 8;
					veto2plane = "nd.p2"; veto2bar = 9;
					veto3plane = "nd.p2"; veto3bar = 9;
					veto4plane = "nd.p2"; veto4bar = 9;
					veto5plane = "nd.p3"; veto5bar = 6;
					veto6plane = "nd.p3"; veto6bar = 8;
					antiveto1plane = "nd.p4"; antiveto1bar = 4;
					antiveto2plane = "nd.p4"; antiveto2bar = 4;
					antiveto3plane = "nd.p4"; antiveto3bar = 4;
					break;
				case 8:
					veto1plane = "nd.p2"; veto1bar = 9;
					veto2plane = "nd.p2"; veto2bar = 10;
					veto3plane = "nd.p2"; veto3bar = 10;
					veto4plane = "nd.p2"; veto4bar = 10;
					veto5plane = "nd.p3"; veto5bar = 7;
					veto6plane = "nd.p3"; veto6bar = 9;
					antiveto1plane = "nd.p4"; antiveto1bar = 4;
					antiveto2plane = "nd.p4"; antiveto2bar = 5;
					antiveto3plane = "nd.p4"; antiveto3bar = 5;
					break;
				case 9:
					veto1plane = "nd.p2"; veto1bar = 10;
					veto2plane = "nd.p2"; veto2bar = 11;
					veto3plane = "nd.p2"; veto3bar = 11;
					veto4plane = "nd.p2"; veto4bar = 11;
					veto5plane = "nd.p3"; veto5bar = 8;
					veto6plane = "nd.p3"; veto6bar = 10;
					antiveto1plane = "nd.p4"; antiveto1bar = 5;
					antiveto2plane = "nd.p4"; antiveto2bar = 5;
					antiveto3plane = "nd.p4"; antiveto3bar = 5;
					break;
				case 10:
					veto1plane = "nd.p2"; veto1bar = 11;
					veto2plane = "nd.p2"; veto2bar = 12;
					veto3plane = "nd.p2"; veto3bar = 12;
					veto4plane = "nd.p2"; veto4bar = 12;
					veto5plane = "nd.p3"; veto5bar = 9;
					veto6plane = "nd.p3"; veto6bar = 11;
					antiveto1plane = "nd.p4"; antiveto1bar = 5;
					antiveto2plane = "nd.p4"; antiveto2bar = 6;
					antiveto3plane = "nd.p4"; antiveto3bar = 6;
					break;
				case 11:
					veto1plane = "nd.p2"; veto1bar = 11;
					veto2plane = "nd.p2"; veto2bar = 12;
					veto3plane = "nd.p2"; veto3bar = 12;
					veto4plane = "nd.p2"; veto4bar = 12;
					veto5plane = "nd.p3"; veto5bar = 10;
					veto6plane = "nd.p3"; veto6bar = 12;
					antiveto1plane = "nd.p4"; antiveto1bar = 5;
					antiveto2plane = "nd.p4"; antiveto2bar = 6;
					antiveto3plane = "nd.p4"; antiveto3bar = 6;
					break;
				case 12:
					veto1plane = "nd.p2"; veto1bar = 12;
					veto2plane = "nd.p2"; veto2bar = 13;
					veto3plane = "nd.p2"; veto3bar = 14;
					veto4plane = "nd.p2"; veto4bar = 14;
					veto5plane = "nd.p3"; veto5bar = 11;
					veto6plane = "nd.p3"; veto6bar = 13;
					antiveto1plane = "nd.p4"; antiveto1bar = 6;
					antiveto2plane = "nd.p4"; antiveto2bar = 6;
					antiveto3plane = "nd.p4"; antiveto3bar = 7;

			//		antiveto1plane = "nd.p1"; antiveto1bar = 16;
			//		antiveto2plane = "nd.p2"; antiveto2bar = 13;
			//		antiveto3plane = "nd.p4"; antiveto3bar = 6;
					break;
				case 13:
					veto1plane = "nd.p2"; veto1bar = 13;
					veto2plane = "nd.p2"; veto2bar = 14;
					veto3plane = "nd.p2"; veto3bar = 14;
					veto4plane = "nd.p2"; veto4bar = 14;
					veto5plane = "nd.p3"; veto5bar = 12;
					veto6plane = "nd.p3"; veto6bar = 14;
					antiveto1plane = "nd.p4"; antiveto1bar = 6;
					antiveto2plane = "nd.p4"; antiveto2bar = 7;
					antiveto3plane = "nd.p4"; antiveto3bar = 7;
					break;
				case 14:
					veto1plane = "nd.p2"; veto1bar = 14;
					veto2plane = "nd.p2"; veto2bar = 15;
					veto3plane = "nd.p2"; veto3bar = 15;
					veto4plane = "nd.p2"; veto4bar = 15;
					veto5plane = "nd.p3"; veto5bar = 13;
					veto6plane = "nd.p3"; veto6bar = 15;
					antiveto1plane = "nd.p4"; antiveto1bar = 7;
					antiveto2plane = "nd.p4"; antiveto2bar = 7;
					antiveto3plane = "nd.p4"; antiveto3bar = 7;
					break;
				case 15:
					veto1plane = "nd.p2"; veto1bar = 15;
					veto2plane = "nd.p2"; veto2bar = 16;
					veto3plane = "nd.p2"; veto3bar = 16;
					veto4plane = "nd.p2"; veto4bar = 16;
					veto5plane = "nd.p3"; veto5bar = 14;
					veto6plane = "nd.p3"; veto6bar = 16;
					antiveto1plane = "nd.p4"; antiveto1bar = 7;
					antiveto2plane = "nd.p4"; antiveto2bar = 8;
					antiveto3plane = "nd.p4"; antiveto3bar = 8;
					break;
				case 16:
					veto1plane = "nd.p2"; veto1bar = 16;
					veto2plane = "nd.p2"; veto2bar = 17;
					veto3plane = "nd.p2"; veto3bar = 18;
					veto4plane = "nd.p2"; veto4bar = 18;
					veto5plane = "nd.p3"; veto5bar = 15;
					veto6plane = "nd.p3"; veto6bar = 17;
					antiveto1plane = "nd.p4"; antiveto1bar = 8;
					antiveto2plane = "nd.p4"; antiveto2bar = 9;
					antiveto3plane = "nd.p4"; antiveto3bar = 9;
					break;
				case 17:
					veto1plane = "nd.p2"; veto1bar = 17;
					veto2plane = "nd.p2"; veto2bar = 18;
					veto3plane = "nd.p2"; veto3bar = 19;
					veto4plane = "nd.p2"; veto4bar = 19;
					veto5plane = "nd.p3"; veto5bar = 16;
					veto6plane = "nd.p3"; veto6bar = 18;
					antiveto1plane = "nd.p4"; antiveto1bar = 8;
					antiveto2plane = "nd.p4"; antiveto2bar = 9;
					antiveto3plane = "nd.p4"; antiveto3bar = 9;
					break;
				case 18:
					veto1plane = "nd.p2"; veto1bar = 19;
					veto2plane = "nd.p2"; veto2bar = 20;
					veto3plane = "nd.p2"; veto3bar = 20;
					veto4plane = "nd.p2"; veto4bar = 20;
					veto5plane = "nd.p3"; veto5bar = 17;
					veto6plane = "nd.p3"; veto6bar = 19;
					antiveto1plane = "nd.p4"; antiveto1bar = 9;
					antiveto2plane = "nd.p4"; antiveto2bar = 10;
					antiveto3plane = "nd.p4"; antiveto3bar = 10;
					break;
				case 19:
					veto1plane = "nd.p2"; veto1bar = 20;
					veto2plane = "nd.p2"; veto2bar = 21;
					veto3plane = "nd.p2"; veto3bar = 21;
					veto4plane = "nd.p2"; veto4bar = 21;
					veto5plane = "nd.p3"; veto5bar = 18;
					veto6plane = "nd.p3"; veto6bar = 20;
					antiveto1plane = "nd.p4"; antiveto1bar = 10;
					antiveto2plane = "nd.p4"; antiveto2bar = 10;
					antiveto3plane = "nd.p4"; antiveto3bar = 10;
					break;
				case 20:
					veto1plane = "nd.p2"; veto1bar = 21;
					veto2plane = "nd.p2"; veto2bar = 22;
					veto3plane = "nd.p2"; veto3bar = 22;
					veto4plane = "nd.p2"; veto4bar = 22;
					veto5plane = "nd.p3"; veto5bar = 19;
					veto6plane = "nd.p3"; veto6bar = 21;
					antiveto1plane = "nd.p4"; antiveto1bar = 10;
					antiveto2plane = "nd.p4"; antiveto2bar = 11;
					antiveto3plane = "nd.p4"; antiveto3bar = 11;
					break;
				case 21:
					veto1plane = "nd.p2"; veto1bar = 22;
					veto2plane = "nd.p2"; veto2bar = 23;
					veto3plane = "nd.p2"; veto3bar = 23;
					veto4plane = "nd.p2"; veto4bar = 23;
					veto5plane = "nd.p3"; veto5bar = 20;
					veto6plane = "nd.p3"; veto6bar = 20;
					antiveto1plane = "nd.p4"; antiveto1bar = 11;
					antiveto2plane = "nd.p4"; antiveto2bar = 11;
					antiveto3plane = "nd.p4"; antiveto3bar = 11;
					break;
			}
			break;
		case 4:
			switch (thisbar)
			{
				case 0:
					veto1plane = "nd.p3"; veto1bar = 0;
					veto2plane = "nd.p3"; veto2bar = 1;
					veto3plane = "nd.p3"; veto3bar = 1;
					veto4plane = "nd.p3"; veto4bar = 1;
					veto5plane = "nd.p4"; veto5bar = 1;
					veto6plane = "nd.p4"; veto6bar = 1;
					break;
				case 1:
					veto1plane = "nd.p3"; veto1bar = 1;
					veto2plane = "nd.p3"; veto2bar = 2;
					veto3plane = "nd.p3"; veto3bar = 3;
					veto4plane = "nd.p3"; veto4bar = 3;
					veto5plane = "nd.p4"; veto5bar = 0;
					veto6plane = "nd.p4"; veto6bar = 2;
					break;
				case 2:
					veto1plane = "nd.p3"; veto1bar = 3;
					veto2plane = "nd.p3"; veto2bar = 4;
					veto3plane = "nd.p3"; veto3bar = 5;
					veto4plane = "nd.p3"; veto4bar = 5;
					veto5plane = "nd.p4"; veto5bar = 1;
					veto6plane = "nd.p4"; veto6bar = 3;
					break;
				case 3:
					veto1plane = "nd.p3"; veto1bar = 4;
					veto2plane = "nd.p3"; veto2bar = 5;
					veto3plane = "nd.p3"; veto3bar = 6;
					veto4plane = "nd.p3"; veto4bar = 6;
					veto5plane = "nd.p4"; veto5bar = 2;
					veto6plane = "nd.p4"; veto6bar = 4;
					break;
				case 4:
					veto1plane = "nd.p3"; veto1bar = 6;
					veto2plane = "nd.p3"; veto2bar = 7;
					veto3plane = "nd.p3"; veto3bar = 8;
					veto4plane = "nd.p3"; veto4bar = 8;
					veto5plane = "nd.p4"; veto5bar = 3;
					veto6plane = "nd.p4"; veto6bar = 5;
					break;
				case 5:
					veto1plane = "nd.p3"; veto1bar = 8;
					veto2plane = "nd.p3"; veto2bar = 9;
					veto3plane = "nd.p3"; veto3bar = 10;
					veto4plane = "nd.p3"; veto4bar = 11;
					veto5plane = "nd.p4"; veto5bar = 4;
					veto6plane = "nd.p4"; veto6bar = 6;
					break;
				case 6:
					veto1plane = "nd.p3"; veto1bar = 10;
					veto2plane = "nd.p3"; veto2bar = 11;
					veto3plane = "nd.p3"; veto3bar = 12;
					veto4plane = "nd.p3"; veto4bar = 13;
					veto5plane = "nd.p4"; veto5bar = 5;
					veto6plane = "nd.p4"; veto6bar = 7;
					break;
				case 7:
					veto1plane = "nd.p3"; veto1bar = 13;
					veto2plane = "nd.p3"; veto2bar = 14;
					veto3plane = "nd.p3"; veto3bar = 15;
					veto4plane = "nd.p3"; veto4bar = 15;
					veto5plane = "nd.p4"; veto5bar = 6;
					veto6plane = "nd.p4"; veto6bar = 8;
					break;
				case 8:
					veto1plane = "nd.p3"; veto1bar = 15;
					veto2plane = "nd.p3"; veto2bar = 16;
					veto3plane = "nd.p3"; veto3bar = 17;
					veto4plane = "nd.p3"; veto4bar = 17;
					veto5plane = "nd.p4"; veto5bar = 7;
					veto6plane = "nd.p4"; veto6bar = 9;
					break;
				case 9:
					veto1plane = "nd.p3"; veto1bar = 16;
					veto2plane = "nd.p3"; veto2bar = 17;
					veto3plane = "nd.p3"; veto3bar = 18;
					veto4plane = "nd.p3"; veto4bar = 18;
					veto5plane = "nd.p4"; veto5bar = 8;
					veto6plane = "nd.p4"; veto6bar = 10;
					break;
				case 10:
					veto1plane = "nd.p3"; veto1bar = 18;
					veto2plane = "nd.p3"; veto2bar = 19;
					veto3plane = "nd.p3"; veto3bar = 20;
					veto4plane = "nd.p3"; veto4bar = 20;
					veto5plane = "nd.p4"; veto5bar = 9;
					veto6plane = "nd.p4"; veto6bar = 11;
					break;
				case 11:
					veto1plane = "nd.p3"; veto1bar = 20;
					veto2plane = "nd.p3"; veto2bar = 21;
					veto3plane = "nd.p3"; veto3bar = 21;
					veto4plane = "nd.p3"; veto4bar = 21;
					veto5plane = "nd.p4"; veto5bar = 10;
					veto6plane = "nd.p4"; veto6bar = 10;
					break;
			}
			break;
	}
	if (!includeVetos)
	{
			veto1plane = ""; veto1bar = 0;
			veto2plane = ""; veto2bar = 0;
			veto3plane = ""; veto3bar = 0;
			veto4plane = ""; veto4bar = 0;
			veto5plane = ""; veto5bar = 0;
			veto6plane = ""; veto6bar = 0;

	}
	if (!includeAntivetos)
	{
			antiveto1plane = ""; antiveto1bar = 0;
			antiveto2plane = ""; antiveto2bar = 0;
			antiveto3plane = ""; antiveto3bar = 0;
	}

	// This allVetos is going to be used when drawing the
	// image of the HAND as a searchable string to find
	// out if any particular bar is a veto bar or not.
	// Similarly with goodBar and allAntivetos;
	// **************************************************
/*	allVetos = veto1plane;
	allVetos += ".";
	allVetos += veto1bar;
	allVetos += " ";
	allVetos += veto2plane;
	allVetos += ".";
	allVetos += veto2bar;
	allVetos += " ";
	allVetos += veto3plane;
	allVetos += ".";
	allVetos += veto3bar;
	allVetos += " ";
	allVetos += veto4plane;
	allVetos += ".";
	allVetos += veto4bar;
	allVetos += " ";
	allVetos += veto5plane;
	allVetos += ".";
	allVetos += veto5bar;
	allVetos += " ";
	allVetos += veto6plane;
	allVetos += ".";
	allVetos += veto6bar;
	allVetos += " ";

	allAntivetos = antiveto1plane;
	allAntivetos += ".";
	allAntivetos += antiveto1bar;
	allAntivetos += " ";
	allAntivetos += antiveto2plane;
	allAntivetos += ".";
	allAntivetos += antiveto2bar;
	allAntivetos += " ";
	allAntivetos += antiveto3plane;
	allAntivetos += ".";
	allAntivetos += antiveto3bar;
	allAntivetos += " ";

	if (nplane==0) {allVetos = "";}
	if (nplane==0) {allAntivetos = "";}
	if (antivetosAsVetos && includeVetos) { allVetos += allAntivetos;}
*/
//	cout << "Vetos: " << allVetos << endl;
//	cout << "allAntivetos: " << allAntivetos << endl;

	// Below are the  veto cuts. They're split apart because I want
	// to be able to put this in a loop eventually to automize
	// the flow of data to histograms
	int veto1=0;
	int veto2=0;
	int veto3=0;
	int veto4=0;
	int veto5=0;
	int veto6=0;
	double barid=0;

// Define First Veto
	if (veto1plane=="veto") 
	{
		barid = 4000;
		barid = barid + veto1bar + 1;
		veto1 = barid;

	}
	else if (veto1plane=="nd.p1")
	{ 
		barid = 4100;
		barid = barid + veto1bar + 1;
		veto1 = barid;
	}
	else if (veto1plane=="nd.p2")
	{ 
		barid = 4200;
		barid = barid + veto1bar + 1;
		veto1 = barid;
	}
	else if (veto1plane=="nd.p3")
	{ 
		barid = 4300;
		barid = barid + veto1bar + 1;
		veto1 = barid;
	}
	else if (veto1plane=="nd.p4")
	{ 
		barid = 4400;
		barid = barid + veto1bar + 1;
		veto1 = barid;
	}

// Define Second Veto
	if (veto2plane=="veto") 
	{
		barid = 4000;
		barid = barid + veto2bar + 1;
		veto2 = barid;
	}
	else if (veto2plane=="nd.p1")
	{ 
		barid = 4100;
		barid = barid + veto2bar + 1;
		veto2 = barid;
	}
	else if (veto2plane=="nd.p2")
	{ 
		barid = 4200;
		barid = barid + veto2bar + 1;
		veto2 = barid;
	}
	else if (veto2plane=="nd.p3")
	{ 
		barid = 4300;
		barid = barid + veto2bar + 1;
		veto2 = barid;
	}
	else if (veto2plane=="nd.p4")
	{ 
		barid = 4400;
		barid = barid + veto2bar + 1;
		veto2 = barid;
	}

// Define Third Veto
	if (veto3plane=="veto") 
	{
		barid = 4000;
		barid = barid + veto3bar + 1;
		veto3 = barid;
	}
	else if (veto3plane=="nd.p1")
	{ 
		barid = 4100;
		barid = barid + veto3bar + 1;
		veto3 = barid;
	}
	else if (veto3plane=="nd.p2")
	{ 
		barid = 4200;
		barid = barid + veto3bar + 1;
		veto3 = barid;
	}
	else if (veto3plane=="nd.p3")
	{ 
		barid = 4300;
		barid = barid + veto3bar + 1;
		veto3 = barid;
	}
	else if (veto3plane=="nd.p4")
	{ 
		barid = 4400;
		barid = barid + veto3bar + 1;
		veto3 = barid;
	}

// Define Fourth Veto
	if (veto4plane=="veto") 
	{
		barid = 4000;
		barid = barid + veto4bar + 1;
		veto4 = barid;
	}
	else if (veto4plane=="nd.p1")
	{ 
		barid = 4100;
		barid = barid + veto4bar + 1;
		veto4 = barid;
	}
	else if (veto4plane=="nd.p2")
	{ 
		barid = 4200;
		barid = barid + veto4bar + 1;
		veto4 = barid;
	}
	else if (veto4plane=="nd.p3")
	{ 
		barid = 4300;
		barid = barid + veto4bar + 1;
		veto4 = barid;
	}
	else if (veto4plane=="nd.p4")
	{ 
		barid = 4400;
		barid = barid + veto4bar + 1;
		veto4 = barid;
	}

// Define Fifth Veto
	if (veto5plane=="veto") 
	{
		barid = 4000;
		barid = barid + veto5bar + 1;
		veto5 = barid;
	}
	else if (veto5plane=="nd.p1")
	{ 
		barid = 4100;
		barid = barid + veto5bar + 1;
		veto5 = barid;
	}
	else if (veto5plane=="nd.p2")
	{ 
		barid = 4200;
		barid = barid + veto5bar + 1;
		veto5 = barid;
	}
	else if (veto5plane=="nd.p3")
	{ 
		barid = 4300;
		barid = barid + veto5bar + 1;
		veto5 = barid;
	}
	else if (veto5plane=="nd.p4")
	{ 
		barid = 4400;
		barid = barid + veto5bar + 1;
		veto5 = barid;
	}

// Define Sixth Veto
	if (veto6plane=="veto") 
	{
		barid = 4000;
		barid = barid + veto6bar + 1;
		veto6 = barid;
	}
	else if (veto6plane=="nd.p1")
	{ 
		barid = 4100;
		barid = barid + veto6bar + 1;
		veto6 = barid;
	}
	else if (veto6plane=="nd.p2")
	{ 
		barid = 4200;
		barid = barid + veto6bar + 1;
		veto6 = barid;
	}
	else if (veto6plane=="nd.p3")
	{ 
		barid = 4300;
		barid = barid + veto6bar + 1;
		veto6 = barid;
	}
	else if (veto6plane=="nd.p4")
	{ 
		barid = 4400;
		barid = barid + veto6bar + 1;
		veto6 = barid;
	}


//	cout << "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" << endl;



}

