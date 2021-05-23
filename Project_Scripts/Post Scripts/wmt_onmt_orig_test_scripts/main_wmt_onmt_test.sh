#!/bin/bash
# exit when any command fails
set -e

DIR=$1


SRC_LANG=en
TGT_LANG=de

cd $DIR/scripts/wmt_onmt_orig_test_scripts

echo $DIR

echo "Apply SPM Encoding"
bash spm_encoding_test.sh $DIR 

echo "Generating Hypothesis"
bash onmt_wmt_test.sh $DIR

echo "Remove SPM Encoding"
bash spm_decoding_test.sh $DIR 

echo "Generate BLUE Score"
bash multi_blue_eval.sh $DIR 

echo "Generate chrF Score"
bash chrf_test.sh $DIR 
