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

cat ../output/evt_count/*.dat > temp_all 2> temp_err
cat ../data_output/evt_count/*.dat >> temp_all 2> temp_err

awk '{A[$1"	"$2"	"]+=$3;next}END{for(i in A){print i,A[i]}}' temp_all > temp_totcount

sort temp_totcount > temp_final

cat temp_final

rm temp*

