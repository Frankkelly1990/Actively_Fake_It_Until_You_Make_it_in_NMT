#!/bin/bash
DIR=~/exp3/paracrawl/orig_data_bpe
EVAL_SCRIPTS=$DIR/scripts/eval_scripts
RESULTS=$DIR/results

TGT_LANG=de
SRC_LANG=en

bash $EVAL_SCRIPTS/deprocess_test_data.sh $DIR $TGT_LANG $SRC_LANG

bash $EVAL_SCRIPTS/sort_generated_data.sh $DIR

bash $EVAL_SCRIPTS/MOSES_BLUE_EVAL.sh $DIR $TGT_LANG

python ~/chrF/chrF++.py -R $RESULTS/test.detok.$TGT_LANG -H $RESULTS/gen.out.sorted.detok