#!/bin/bash
# exit when any command fails
set -e

DIR=$1

SRC_LANG=en
TGT_LANG=de

cd $DIR/scripts/test_indomain_scripts

echo "Preprocessing using moses scripts"
bash pre_process_test.sh $DIR

echo "Applying BPE Encoding to test data"
bash bpe_encoding_test.sh $DIR

echo "Generating Hypothesis"
bash test_indomain.sh $DIR

echo "Post Process Data"
bash post_process_gen_data.sh $DIR
bash deprocess_test_data.sh $DIR

echo "Generate BLUE Score"
bash MOSES_BLUE_TEST.sh $DIR 

echo "Generate chrF Score"
bash chrf_test.sh $DIR $WMT $TGT_LANG
