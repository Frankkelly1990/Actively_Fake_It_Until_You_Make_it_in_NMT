#!/bin/bash
DIR=~/exp3/paracrawl/orig_data_bpe1

RESULTS=$DIR/results
FAIRSEQ_SCRIPT=~/fairseq/scripts


bash $FAIRSEQ_SCRIPT/compound_split_bleu.sh $RESULTS/gen.out