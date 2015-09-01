#!/bin/sh

subStatus="./job_status.log";

convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "%02dh:%02dm:%02ds\n" $h $m $s
}

t1="$(date +"%s")"
line="$(qstat -u elong | grep elong | grep -v C)";
#echo $line;
while [ ! -z "$line" ];
do
	sleep .5;
	date="$(date)";
	line="$(qstat -u elong | grep elong | grep -v C)";
	njobs="$(echo "$line" | wc -l)";
	t2="$(date +"%s")";
	elTime="$(echo $t2-$t1 | bc)";
	elTimeNice="$(echo $(convertsecs $elTime))";
	sed -i '$ d' $subStatus;
	echo -en "\rWaiting for $njobs jobs to finish... (Elapsed time: $elTimeNice)" | tee -a $subStatus;
done
echo | tee -a $subStatus; echo "Jobs done!" | tee -a $subStatus;
echo | tee -a $subStatus; echo "Moving logs to /data1" | tee -a $subStatus;
./move_data.sh | tee -a $subStatus;

t2="$(date +"%s")";
elTime="$(echo $t2-$t1 | bc)";
elTimeNice="$(echo $(convertsecs $elTime))";

echo "All done! Elapsed time: ${elTimeNice}" | tee -a $subStatus;

