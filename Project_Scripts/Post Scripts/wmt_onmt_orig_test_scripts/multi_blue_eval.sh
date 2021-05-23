#!/bin/bash
set -e
DIR=$1
TEST_DATA=$DIR/test_data
MOSES_BLEU_SCRIPT=~/mosesdecoder/scripts/generic/multi-bleu-detok.perl

sl=en
tl=de

perl $MOSES_BLEU_SCRIPT $TEST_DATA/test.$tl < $TEST_DATA/test.hyp.detok.$tl > $TEST_DATA/test.bleu.score