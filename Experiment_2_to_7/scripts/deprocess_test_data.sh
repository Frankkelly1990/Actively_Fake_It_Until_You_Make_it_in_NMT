#!/bin/bash
DIR=~/exp3/paracrawl/orig_data_bpe1
RESULTS=$DIR/results
MOSES_SCRIPTS=~/mosesdecoder/scripts/tokenizer
SRC_LANG=en
TGT_LANG=de

sed -r 's/\@\@ //g' $RESULTS/test.bpe.$SRC_LANG | perl $MOSES_SCRIPTS/detokenizer.perl -l $SRC_LANG > $RESULTS/test.detok.$SRC_LANG
sed -r 's/\@\@ //g' $RESULTS/test.bpe.$TGT_LANG | perl $MOSES_SCRIPTS/detokenizer.perl -l $TGT_LANG > $RESULTS/test.detok.$TGT_LANG
