#!/bin/bash
DIR=$1

RESULTS=$DIR/results
MOSES_SCRIPTS=~/mosesdecoder/scripts/generic/
TGT_LANG=$2

perl $MOSES_SCRIPTS/multi-bleu-detok.perl $RESULTS/test.detok.$TGT_LANG < $RESULTS/gen.out.sorted.detok
