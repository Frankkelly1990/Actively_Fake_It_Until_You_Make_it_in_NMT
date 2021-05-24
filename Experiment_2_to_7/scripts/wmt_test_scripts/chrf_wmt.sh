#!/bin/bash
DIR=$1
WMT=$2
TGT_LANG=$3
RESULTS=$DIR/evaluation_data

python ~/chrF/chrF++.py -R $RESULTS/$WMT.en-de.ref -H $RESULTS/$WMT.gen.out.hyp.sorted.detok  > $RESULTS/$WMT.chrF.score