#!/bin/bash

subStatus="./job_status.log";
rm $subStatus;
echo "How many jobs would you like to submit?" | tee -a $substatus;
read lines;
echo $lines | tee -a $substatus;
./prep_gemc.csh | tee -a $substatus;

batchSize=10000;
#batchSize=152;
#batchSize=8;
numBatches=`echo $lines/$batchSize | bc`;
numBatchespp=`echo $lines/$batchSize + 1 | bc`;
leftoverJobs=`echo $lines%$batchSize | bc`;
for j in `seq 1 $numBatches`;
do
	echo "Submitting batch $j of $numBatchespp:" | tee -a $subStatus;
	for i in `seq 1 $batchSize`;
	do
		echo "Submitting job $i of $batchSize:" | tee -a $subStatus;
		qsub batch_submit_UNH.sh | tee -a $subStatus;
	done
	echo "Done submitting job batch $j!" | tee -a $substatus;
	echo "Now let's wait for them to finish then automatically move the files to /data1" | tee -a $substatus;
	echo | tee -a $substatus;echo | tee -a $substatus;echo | tee -a $substatus;
	./end_run.sh;
done;
echo "Submitting batch $numBatchespp of $numBatchespp:" | tee -a $subStatus;
for i in `seq 1 $leftoverJobs`;
do
	echo "Submitting job $i of $leftoverJobs:" | tee -a $subStatus;
	qsub batch_submit_UNH.sh | tee -a $subStatus;
done
echo "Done submitting the last job batch!" | tee -a $substatus;
echo "Now let's wait for them to finish then automatically move the files to /data1" | tee -a $substatus;
echo | tee -a $substatus;echo | tee -a $substatus;echo | tee -a $substatus;
./end_run.sh;

echo "Done submitting all job batches!" | tee -a $subStatus


