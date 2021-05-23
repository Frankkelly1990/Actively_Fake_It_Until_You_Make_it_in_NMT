#!/bin/bash
DIR=$1
WMT=$2
tl=de
sl=en
EVAL_SCRIPTS=$DIR/evaluation_data

python ~/chrF/chrF++.py -R $EVAL_SCRIPTS/$WMT.en-de.ref -H $EVAL_SCRIPTS/$WMT.clean.hyp.detok.$tl > $EVAL_SCRIPTS/$WMT.chrF.score
