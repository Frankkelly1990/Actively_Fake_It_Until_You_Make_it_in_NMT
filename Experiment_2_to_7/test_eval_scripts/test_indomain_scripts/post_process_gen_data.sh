#!/bin/bash
set -e

DIR=$1

RESULTS=$DIR/test_data
MOSES_SCRIPTS=~/mosesdecoder/scripts/tokenizer

GEN=$RESULTS/test.gen.out

grep ^D $GEN \
| sed 's/^D\-//' \
| sort -n -k 1 \
| cut -f 3 \
| sed -r 's/(@@ )|(@@ ?$)//g' \
| perl $MOSES_SCRIPTS/detokenizer.perl \
> $GEN.hyp.sorted.detok.de
