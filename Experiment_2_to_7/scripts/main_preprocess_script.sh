#!/bin/bash
DATA_DIR=~/exp3/UFAL/orig_data_bpe
cd $DATA_DIR

mkdir -p execution_data
mkdir -p BPE
mkdir -p processed_data
mkdir -p checkpoints
mkdir -p tensorboard_log
mkdir -p results
cd scripts

echo "Preprocessign using moses scripts"
bash moses_pre_process.sh $DATA_DIR

echo "Train BPE model and Apply to Corpus"
bash bpe_encoding.sh $DATA_DIR

echo "Split Preprocessed corpus into Train Test Val "
bash train_test_val_split.sh $DATA_DIR

echo "Build netowrk dictionary and binarise data for model"
bash fairseq_pre_process.sh $DATA_DIR