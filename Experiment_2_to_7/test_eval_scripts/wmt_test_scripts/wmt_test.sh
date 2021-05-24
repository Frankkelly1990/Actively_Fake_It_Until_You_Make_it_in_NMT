#!/bin/bash
#Set Directory Paths
DIR=$1
WMT=$2
src_lang=en
BPE_MODEL=$DIR/BPE/model_en.de.bpe
MODEL_DATA=$DIR/execution_data
DATA_DIR=$DIR/evaluation_data


DATA_IN=$DATA_DIR/$WMT.clean.bpe.$src_lang

CHECKPOINT_DIR=$DIR/checkpoints

FAIRSEQ_CLIENT=~/fairseq/fairseq_cli
MULTI_BLUE=~/mosesdecoder/scripts/generic/multi-bleu.perl
src_lang=en
tgt_lang=de

rm -f $DATA_DIR/$WMT.gen.out

cat $DATA_IN | CUDA_VISIBLE_DEVICES=0 fairseq-interactive \
            --path $CHECKPOINT_DIR/checkpoint_best.pt $MODEL_DATA \
            --source-lang en --target-lang de \
            --beam 4 \
            --fp16 \
            --lenpen 0.6 > $DATA_DIR/$WMT.gen.out   
            
