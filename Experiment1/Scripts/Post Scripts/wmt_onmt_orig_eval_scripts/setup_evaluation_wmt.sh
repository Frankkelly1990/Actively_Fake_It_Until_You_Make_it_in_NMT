#!/bin/bash

dir=$1
WMT=$2

cd $dir

mkdir -p evaluation_data
cd evaluation_data

sacrebleu -t $WMT -l en-de --echo src > $WMT.en-de.src
sacrebleu -t $WMT -l en-de --echo ref > $WMT.en-de.ref

