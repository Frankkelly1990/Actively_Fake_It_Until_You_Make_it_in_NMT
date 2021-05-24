#!/bin/bash
# exit when any command fails
set -e

DIR=$1

SRC_LANG=en
TGT_LANG=de

cd $DIR/scripts/wmt_test_scripts

WMT_ARRAY=( wmt17 wmt18 wmt19 wmt20 )

for WMT in "${WMT_ARRAY[@]}"
do

echo $WMT
echo $DIR

echo "Preprocessing using moses scripts"
bash setup_evaluation_wmt.sh $DIR $WMT

echo "Tokenise Test Data "
bash pre_process_wmt.sh $DIR $WMT

echo "Apply BPE Encoding"
bash bpe_encoding_wmt.sh $DIR $WMT

echo "Generating Hypothesis"
bash wmt_test.sh $DIR $WMT

echo "Post Process Data"
bash post_process_gen_data_wmt.sh $DIR $WMT

echo "Generate BLUE Score"
bash sacreBLEU_WMT.sh $DIR $WMT

echo "Generate chrF Score"
bash chrf_wmt.sh $DIR $WMT $TGT_LANG

done