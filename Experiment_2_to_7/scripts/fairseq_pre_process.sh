#!/bin/bash
#Take input path from Main_preprocess_script.sh
DATA_DIR=$1
DATA_IN=$DATA_DIR/processed_data
DATA_OUT=$DATA_DIR/execution_data
FAIRSEQ_CLIENT=~/fairseq/fairseq_cli
DICTIONARY=$DATA_DIR/BPE/vocab
TBOARD_DIR=$DATA_DIR/tensorboard_log
src_lang=en
tgt_lang=de
myseed=44219

src_vocab_len=$(wc -l $DICTIONARY.$src_lang | sed 's/[^0-9]*//g')
tgt_vocab_len=$(wc -l $DICTIONARY.$tgt_lang | sed 's/[^0-9]*//g')

python $FAIRSEQ_CLIENT/preprocess.py --source-lang $src_lang --target-lang $tgt_lang \
    --source-lang en --target-lang de \
    --trainpref $DATA_IN/train \
    --validpref $DATA_IN/val \
    --testpref $DATA_IN/test \
    --destdir $DATA_OUT \
    --nwordssrc $src_vocab_len --nwordstgt $tgt_vocab_len \
    --joined-dictionary 