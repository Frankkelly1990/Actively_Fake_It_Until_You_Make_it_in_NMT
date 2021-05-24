#!/bin/bash
set -e

pip install sacrebleu
pip install subword-nmt

unzip ./wmt_test_scripts_mult_run.zip

EVAL_FILES=( ~/exp3/opus/orig_data_bpe ~/exp3/opus/orig_data_bpe1 ~/exp3/opus/synth_data_bpe ~/exp3/opus/synth_data_bpe1 ~/exp3/paracrawl/orig_data_bpe ~/exp3/paracrawl/synth_data_bpe )

for DIR in "${EVAL_FILES[@]}"
do

rm -r $DIR/scripts/wmt_test_scripts


cp -r -f ./wmt_test_scripts $DIR/scripts

done

rm -r ./wmt_test_scripts
