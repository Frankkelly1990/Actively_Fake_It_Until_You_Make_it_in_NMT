#!/bin/bash
DIR=$1
SRC_DIR=$DIR/processed_data
RESULTS=$DIR/results
MOSES_SCRIPTS=~/mosesdecoder/scripts/tokenizer
SRC_LANG=$3
TGT_LANG=$2

sed -r 's/\@\@ //g' $SRC_DIR/test.$SRC_LANG | perl $MOSES_SCRIPTS/detokenizer.perl -l $SRC_LANG > $RESULTS/test.detok.$SRC_LANG
sed -r 's/\@\@ //g' $SRC_DIR/test.$TGT_LANG | perl $MOSES_SCRIPTS/detokenizer.perl -l $TGT_LANG > $RESULTS/test.detok.$TGT_LANG
