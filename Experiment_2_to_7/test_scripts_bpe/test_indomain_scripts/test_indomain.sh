#!/bin/bash
set -e
#Set Directory Paths
DIR=$1

MODEL_DATA=$DIR/execution_data
DATA_DIR=$DIR/test_data
CHECKPOINT_DIR=$DIR/checkpoints

src_lang=en
tgt_lang=de

DATA_IN=$DATA_DIR/test.tok.bpe.$src_lang

rm -f $DATA_DIR/test.gen.out

cat $DATA_IN | CUDA_VISIBLE_DEVICES=0 fairseq-interactive \
            --path $CHECKPOINT_DIR/checkpoint_best.pt $MODEL_DATA \
            --source-lang en --target-lang de \
            --beam 4 \
            --fp16 \
            --lenpen 0.6 > $DATA_DIR/test.gen.out 
            
