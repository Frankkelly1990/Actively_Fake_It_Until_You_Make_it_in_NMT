#!/bin/bash
DIR=~/exp3/opus/orig_data_bpe

RESULTS=$DIR/results
MOSES_SCRIPTS=~/mosesdecoder/scripts/generic/
SRC_LANG=en

perl $MOSES_SCRIPTS/multi-bleu-detok.perl ~/exp3/paracrawl/orig_data_bpe/results/test.detok.de < ~/exp3/paracrawl/orig_data_bpe/results/gen.out.sorted.detok
