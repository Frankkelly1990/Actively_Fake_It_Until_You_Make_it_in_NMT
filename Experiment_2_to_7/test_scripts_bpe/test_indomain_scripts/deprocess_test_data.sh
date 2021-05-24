#!/bin/bash
set -e 

DIR=$1
RESULTS=$DIR/test_data
MOSES_SCRIPTS=~/mosesdecoder/scripts/tokenizer
SRC_LANG=en
TGT_LANG=de

sed -r 's/\@\@ //g' $RESULTS/test.$SRC_LANG | perl $MOSES_SCRIPTS/detokenizer.perl -l $SRC_LANG > $RESULTS/test.detok.$SRC_LANG
sed -r 's/\@\@ //g' $RESULTS/test.$TGT_LANG | perl $MOSES_SCRIPTS/detokenizer.perl -l $TGT_LANG > $RESULTS/test.detok.$TGT_LANG
