#!/bin/bash
DIR=$1
WMT=$2
RESULTS=$DIR/evaluation_data
MOSES_SCRIPTS=~/mosesdecoder/scripts/tokenizer

GEN=$RESULTS/$WMT.gen.out

grep ^D $GEN \
| sed 's/^D\-//' \
| sort -n -k 1 \
| cut -f 3 \
| sed -r 's/(@@ )|(@@ ?$)//g' \
| perl $MOSES_SCRIPTS/detokenizer.perl \
> $GEN.hyp.sorted.detok

