#!/bin/bash
# exit when any command fails
set -e

DIR=$1


SRC_LANG=en
TGT_LANG=de

cd $DIR/scripts/wmt_onmt_orig_eval_scripts
WMT_ARRAY=( wmt17 wmt18 wmt19 wmt20 )

for WMT in "${WMT_ARRAY[@]}"
do

echo $WMT
echo $DIR

echo "Preprocessing using moses scripts"
bash setup_evaluation_wmt.sh $DIR $WMT

echo "Apply SPM Encoding"
bash spm_encoding_wmt.sh $DIR $WMT

echo "Generating Hypothesis"
bash onmt_wmt_test.sh $DIR $WMT

echo "Remove SPM Encoding"
bash spm_decoding_wmt.sh $DIR $WMT

echo "Generate BLUE Score"
bash sacreBLEU_WMT.sh $DIR $WMT

echo "Generate chrF Score"
bash chrf_wmt.sh $DIR $WMT

done