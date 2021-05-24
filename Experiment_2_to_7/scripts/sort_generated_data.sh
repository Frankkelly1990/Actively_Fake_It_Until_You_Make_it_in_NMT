#!/bin/bash
DIR=~/exp3/paracrawl/orig_data_bpe1
RESULTS=$DIR/results
GEN=$RESULTS/gen.out

grep ^H $GEN \
| sed 's/^H\-//' \
| sort -n -k 1 \
| cut -f 3 \
| sacremoses detokenize \
> $GEN.sorted.detok