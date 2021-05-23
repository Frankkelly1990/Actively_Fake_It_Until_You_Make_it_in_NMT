#!/bin/bash
set -e

SP_PATH=/usr/local/bin
DATA_DIR=$1
WMT=$2

SPM_MODEL=$DATA_DIR/original_dataset/data
TEST_DATA=$DATA_DIR/test_data

sl=en
tl=de

export PATH=$SP_PATH:$PATH
export CUDA_VISIBLE_DEVICES=0

spm_decode --model=$SPM_MODEL/spm_wmt$sl$tl.model --input_format=piece \
             < $TEST_DATA/test.hyp.$tl \
             > $TEST_DATA/test.hyp.detok.$tl
