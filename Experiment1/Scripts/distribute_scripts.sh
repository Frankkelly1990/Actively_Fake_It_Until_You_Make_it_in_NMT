#!/bin/bash
set -e

# pip install sacrebleu
# pip install subword-nmt

# ORIG_EVAL_FILES=( ~/experiment1-100k-original_data ~/experiment1-100k-original_data1 ~/experiment1-100k-original_data2 )

# for DIR in "${ORIG_EVAL_FILES[@]}"
# do

# echo $DIR

# rm -r -f $DIR/scripts/wmt_onmt_eval_scripts
# rm -r -f $DIR/scripts/wmt_onmt_orig_eval_scripts
# rm -r -f $DIR/scripts/wmt_onmt_orig_test_scripts

# cp -r -f ./wmt_onmt_orig_eval_scripts $DIR/scripts/
# cp -r -f ./wmt_onmt_orig_test_scripts $DIR/scripts/

# done


SYNTH_EVAL_FILES=( ~/experiment1-100k-synthetic_data1 ~/experiment1-100k-synthetic_data2  )

for DIR in "${SYNTH_EVAL_FILES[@]}"
do

echo $DIR

rm -r -f $DIR/scripts/wmt_onmt_eval_scripts
rm -r -f $DIR/scripts/wmt_onmt_synth_eval_scripts
rm -r -f $DIR/scripts/wmt_onmt_synth_test_scripts

cp -r -f ./wmt_onmt_synth_eval_scripts $DIR/scripts/
cp -r -f ./wmt_onmt_synth_test_scripts $DIR/scripts/
done