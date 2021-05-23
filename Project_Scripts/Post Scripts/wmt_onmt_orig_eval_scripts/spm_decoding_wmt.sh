#!/bin/bash
set -e

SP_PATH=/usr/local/bin
DATA_DIR=$1
WMT=$2

SPM_MODEL=$DATA_DIR/original_dataset/data
EVAL_DATA=$DATA_DIR/evaluation_data

sl=en
tl=de

export PATH=$SP_PATH:$PATH
export CUDA_VISIBLE_DEVICES=0

spm_decode --model=$SPM_MODEL/spm_wmt$sl$tl.model --input_format=piece \
             < $EVAL_DATA/$WMT.clean.hyp.$tl \
             > $EVAL_DATA/$WMT.clean.hyp.detok.$tl
