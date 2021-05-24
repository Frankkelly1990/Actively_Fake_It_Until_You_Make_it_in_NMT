#!/bin/bash
DATA_DIR=$1
WMT=$2

DATA_IN_PATH=$DATA_DIR/evaluation_data/$WMT.en-de.src
DATA_OUT_PATH=$DATA_DIR/evaluation_data

MOSES_SCRIPTS=~/mosesdecoder/scripts/tokenizer
CLEAN_SCRIPT=~/mosesdecoder/scripts/training/clean-corpus-n.perl

src_lang=en

IN_EN=$DATA_IN_PATH

#Remove Old Files if they exists
rm -f $DATA_OUT_PATH/de.norm $DATA_OUT_PATH/en.norm
rm -f $DATA_OUT_PATH/de.norm.remv $DATA_OUT_PATH/en.norm.remv
rm -f $DATA_OUT_PATH/de.norm.low.remv $DATA_OUT_PATH/en.norm.low.remv
rm -f $DATA_OUT_PATH/de.norm.low.remv.tok $DATA_OUT_PATH/en.norm.low.remv.tok

#Step1. normalize-punctuation
perl $MOSES_SCRIPTS/normalize-punctuation.perl -l $src_lang < $IN_EN > $DATA_OUT_PATH/en.norm \n

#Step3. remove-non-printing-char
perl $MOSES_SCRIPTS/remove-non-printing-char.perl < $DATA_OUT_PATH/en.norm > $DATA_OUT_PATH/en.norm.remv \n
 
#Step3. Convert all charcters to lowercase
perl $MOSES_SCRIPTS/lowercase.perl < $DATA_OUT_PATH/en.norm > $DATA_OUT_PATH/en.norm.low.remv \n

#Step4. tokenize
perl $MOSES_SCRIPTS/tokenizer.perl -l en -threads 10  < $DATA_OUT_PATH/en.norm.low.remv > $DATA_OUT_PATH/$WMT.clean.$src_lang \n

rm -f $DATA_OUT_PATH/en.norm
rm -f $DATA_OUT_PATH/en.norm.remv
rm -f $DATA_OUT_PATH/en.norm.low.remv
rm -f $DATA_OUT_PATH/norm.low.remv.tok.en
