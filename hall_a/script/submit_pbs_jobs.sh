#!/bin/bash

subStatus="./job_status.log";
rm $subStatus;
printf "How many jobs would you like to submit?\n" | tee -a $subStatus;
read lines;
printf $lines | tee -a $subStatus;
./prep_gemc.csh | tee -a $subStatus;

batchSize=10000;
#batchSize=152;
#batchSize=8;
numBatches=`echo $lines/$batchSize | bc`;
numBatchespp=`echo $lines/$batchSize + 1 | bc`;
leftoverJobs=`echo $lines%$batchSize | bc`;
n=1;
perc=0;
for j in `seq 1 $numBatches`;
do
	printf "Submitting batch $j of $numBatchespp\n:" | tee -a $subStatus;
	for i in `seq 1 $batchSize`;
	do
		perc=`echo "$n/$lines*100" | bc -l`; perc=`echo "scale=2;$perc/1" | bc`;
		printf "\nSubmitting job $i of $batchSize\n" | tee -a $subStatus;
		printf "   ($n of $lines, or $perc%%):\n" | tee -a $subStatus;
		qsub batch_submit_UNH.sh | tee -a $subStatus;
		n=`echo "$n + 1" | bc`
	done
	printf "\nDone submitting job batch $j!\n" | tee -a $subStatus;
	printf "Now let's wait for them to finish then automatically move the files to /data1\n" | tee -a $subStatus;
	printf "\n\n\n" | tee -a $subStatus;
	./end_run.sh | tee -a $subStatus;
done;
printf "Submitting batch $numBatchespp of $numBatchespp:\n" | tee -a $subStatus;
for i in `seq 1 $leftoverJobs`;
do
	perc=`echo "$n/$lines*100" | bc -l`; perc=`echo "scale=2;$perc/1" | bc`;
	printf "\nSubmitting job $i of $leftoverJobs\n" | tee -a $subStatus;
	printf "   ($n of $lines, or $perc%%):\n" | tee -a $subStatus;
	qsub batch_submit_UNH.sh | tee -a $subStatus;
	n=`echo "$n + 1" | bc`
done
printf "\nDone submitting the last job batch!\n" | tee -a $subStatus;
printf "Now let's wait for them to finish then automatically move the files to /data1\n" | tee -a $subStatus;
printf "\n\n\n" | tee -a $subStatus;
./end_run.sh | tee -a $subStatus;

printf "Done submitting all job batches!\n" | tee -a $subStatus


