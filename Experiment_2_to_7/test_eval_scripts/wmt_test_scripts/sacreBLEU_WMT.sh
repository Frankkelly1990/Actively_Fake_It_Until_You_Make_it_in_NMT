#!/bin/bash
DIR=$1
RESULTS=$DIR/evaluation_data
WMT=$2

cat $RESULTS/$WMT.gen.out.hyp.sorted.detok | sacrebleu -t $WMT -l en-de > $RESULTS/$WMT.sacreBLUE.score
