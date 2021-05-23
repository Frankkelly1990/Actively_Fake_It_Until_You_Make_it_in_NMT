#!/bin/bash
SP_PATH=/usr/local/bin

DIR=$1
WMT=$2

runconfig=$DIR/original_dataset/orig_model_100K/wmt_ende_transformer

EVAL_DATA=$DIR/evaluation_data

sl=en
tl=de

export PATH=$SP_PATH:$PATH
export CUDA_VISIBLE_DEVICES=0

CUDA_VISIBLE_DEVICES=0 onmt-main --model_type Transformer \
            --config $DIR/original_dataset/config/wmt_ende.yml \
            --auto_config \
            --checkpoint_path $runconfig \
            infer \
            --features_file $EVAL_DATA/$WMT.clean.spm.$sl \
            > $EVAL_DATA/$WMT.clean.hyp.$tl
