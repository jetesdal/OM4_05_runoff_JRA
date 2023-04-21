#!/bin/bash

echo "compare data content of runoff files and metadata of v1.5.0 and v1.4.0"
echo "global attributes and encoding are expected to differ"

module load nccmp

dir14=/archive/gold/datasets/OM4_025/INPUT.JRA.v2019.07.04
#dir15=./
#dir15=./save_originals
#dir15=./save_v150_pyajarun
dir15=./save_v150_nonullchar

#for year in $( seq 1958 2018 ) ; do
for year in 1958 1959 2017 2018  ; do

    echo comparing friver on year $year

    nccmp -mdf $dir14/friver_input4MIPs_atmosphericState_OMIP_MRI-JRA55-do-1-4-0_gr_${year}0101-${year}1231.padded.compressed.nc $dir15/friver_input4MIPs_atmosphericState_OMIP_MRI-JRA55-do-1-5-0_gr_${year}0101-${year}1231.padded.compressed.nc

    echo comparing licalvf on year $year
    nccmp -mdf $dir14/licalvf_input4MIPs_atmosphericState_OMIP_MRI-JRA55-do-1-4-0_gr_${year}0101-${year}1231.padded.compressed.nc $dir15/licalvf_input4MIPs_atmosphericState_OMIP_MRI-JRA55-do-1-5-0_gr_${year}0101-${year}1231.padded.compressed.nc

done
