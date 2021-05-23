#!/bin/bash
DIR=$1
EVAL_DATA=$DIR/evaluation_data

WMT=$2

sl=en
tl=de

cat $EVAL_DATA/$WMT.clean.hyp.detok.$tl | sacrebleu -t $WMT -l en-de > $EVAL_DATA/$WMT.sacreBLUE.score
