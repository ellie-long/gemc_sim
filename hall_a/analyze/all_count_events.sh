#!/bin/sh

# vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
#
# count_events.sh
#
# This script will count the events in all of the output
# files in ../evt_count
#
# Elena Long
# ellie@jlab.org
#
# 8/27/2015 
# 
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

cd /net/home/elong/gemc_sim/hall_a/output/evt_count/
ls | xargs -n 32 -P 8 cat >> /net/home/elong/gemc_sim/hall_a/analyze/temp_all 2> /net/home/elong/gemc_sim/hall_a/analyze/temp_err
cd /net/home/elong/gemc_sim/hall_a/data_output/evt_count/
ls | xargs -n 32 -P 8 cat >> /net/home/elong/gemc_sim/hall_a/analyze/temp_all 2> /net/home/elong/gemc_sim/hall_a/analyze/temp_err

awk '{A[$1"	"$2"	"]+=$3;next}END{for(i in A){print i,A[i]}}' /net/home/elong/gemc_sim/hall_a/analyze/temp_all > /net/home/elong/gemc_sim/hall_a/analyze/temp_totcount

sort /net/home/elong/gemc_sim/hall_a/analyze/temp_totcount > /net/home/elong/gemc_sim/hall_a/analyze/temp_final

cat /net/home/elong/gemc_sim/hall_a/analyze/temp_final > /net/home/elong/gemc_sim/hall_a/analyze/ana_final.dat
cat /net/home/elong/gemc_sim/hall_a/analyze/temp_final

rm /net/home/elong/gemc_sim/hall_a/analyze/temp*


