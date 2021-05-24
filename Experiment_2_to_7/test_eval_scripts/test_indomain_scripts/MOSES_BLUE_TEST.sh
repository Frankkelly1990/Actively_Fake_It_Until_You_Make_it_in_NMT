#!/bin/bash
set -e 

DIR=$1
RESULTS=$DIR/test_data

MOSES_SCRIPTS=~/mosesdecoder/scripts/generic

perl $MOSES_SCRIPTS/multi-bleu-detok.perl $RESULTS/test.detok.de < $RESULTS/test.gen.out.hyp.sorted.detok.de > $RESULTS/test.bleu.score
