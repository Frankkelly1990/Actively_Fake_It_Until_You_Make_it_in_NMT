#!/bin/bash
set -e

SP_PATH=/usr/local/bin
DATA_DIR=$1

SPM_MODEL=$DATA_DIR/original_dataset/data
TEST_DATA=$DATA_DIR/test_data

runconfig=$DATA_DIR/original_dataset/orig_model_100K/wmt_ende_transformer
sl=en
tl=de

export PATH=$SP_PATH:$PATH
export CUDA_VISIBLE_DEVICES=0

cat $TEST_DATA/test.$sl | spm_encode --model=$SPM_MODEL/spm_wmt$sl$tl.model  > $TEST_DATA/test.spm.$sl

cd $TEST_DATA
split -l 1000 test.spm.$sl test.spm.$sl._