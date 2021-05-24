#!/bin/bash
pip install sacrebleu
pip install subword-nmt


EVAL_FILES=( ~/exp3/opus/orig_data_bpe ~/exp3/opus/orig_data_bpe1 ~/exp3/opus/synth_data_bpe ~/exp3/opus/synth_data_bpe1 ~/exp3/paracrawl/orig_data_bpe ~/exp3/paracrawl/synth_data_bpe )

for DIR in "${EVAL_FILES[@]}"
do

EVAL_SCRIPTS=$DIR/scripts/wmt_test_scripts

cd $EVAL_SCRIPTS

bash main_wmt_evaluation.sh $DIR

cd $DIR
zip -r evaluation_data.zip evaluation_data

done

