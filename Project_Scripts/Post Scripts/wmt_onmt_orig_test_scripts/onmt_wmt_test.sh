#!/bin/bash
set -e
SP_PATH=/usr/local/bin

DIR=$1
WMT=$2

runconfig=$DIR/original_dataset/orig_model_100K/wmt_ende_transformer

TEST_DATA=$DIR/test_data
sl=en
tl=de
export PATH=$SP_PATH:$PATH
export CUDA_VISIBLE_DEVICES=0

rm -f $TEST_DATA/test.hyp.$tl

FEAT_PREFIX=test.spm.en

cd $TEST_DATA

for FEAT_FILE in $FEAT_PREFIX.*
do

CUDA_VISIBLE_DEVICES=0 onmt-main --model_type Transformer \
            --config $DIR/original_dataset/config/wmt_ende.yml \
            --auto_config \
            --checkpoint_path $runconfig \
            infer \
            --features_file $TEST_DATA/$FEAT_FILE \
            >> $TEST_DATA/test.hyp.$tl

rm -f $TEST_DATA/$FEAT_FILE

done




