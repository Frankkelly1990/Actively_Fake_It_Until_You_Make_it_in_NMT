#!/bin/bash
set -e

EVAL_FILES=( ~/exp3/opus/orig_data_bpe ~/exp3/opus/orig_data_bpe1 ~/exp3/paracrawl/orig_data_bpe )

for DIR in "${EVAL_FILES[@]}"
do

rm -r -f $DIR/scripts/test_indomain_scripts

cp -r -f ./test_indomain_scripts $DIR/scripts

done

