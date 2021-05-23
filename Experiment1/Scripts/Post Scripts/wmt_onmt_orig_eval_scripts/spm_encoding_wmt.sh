#!/bin/bash
set -e

SP_PATH=/usr/local/bin
DATA_DIR=$1
WMT=$2

SPM_MODEL=$DATA_DIR/original_dataset/data
EVAL_DATA=$DATA_DIR/evaluation_data

runconfig=$DATA_DIR/original_dataset/orig_model_100K/wmt_ende_transformer
sl=en
tl=de

export PATH=$SP_PATH:$PATH
export CUDA_VISIBLE_DEVICES=0

cat $EVAL_DATA/$WMT.$sl-$tl.src | spm_encode --model=$SPM_MODEL/spm_wmt$sl$tl.model  > $EVAL_DATA/$WMT.clean.spm.$sl
