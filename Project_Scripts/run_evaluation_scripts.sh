#!/bin/bash
set -e

pip install sacrebleu
pip install subword-nmt


ORIG_EVAL_FILES=( ~/experiment1-100k-original_data ~/experiment1-100k-original_data1 ~/experiment1-100k-original_data2 )

for DIR in "${ORIG_EVAL_FILES[@]}"
do

ORIG_EVAL_FILES=$DIR/scripts/wmt_onmt_orig_eval_scripts

cd $ORIG_EVAL_FILES

bash main_wmt_onmt_evaluation.sh $DIR

cd $DIR
zip -r evaluation_data.zip evaluation_data

done

SYNTH_EVAL_FILES=( ~/experiment1-100k-synthetic_data )

for DIR in "${SYNTH_EVAL_FILES[@]}"
do

SYNTH_EVAL_FILES=$DIR/scripts/wmt_onmt_synth_eval_scripts

cd $SYNTH_EVAL_FILES

bash main_wmt_onmt_evaluation.sh $DIR

cd $DIR
zip -r evaluation_data.zip evaluation_data

done