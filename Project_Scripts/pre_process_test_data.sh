#!/bin/bash
DIR=~/WMT_ONMT_EVAL_SETUP

DATA_IN_PATH=$DIR/preprocessed_test_data
DATA_OUT_PATH=$DIR/test_data

MOSES_SCRIPTS=~/mosesdecoder/scripts/tokenizer
CLEAN_SCRIPT=~/mosesdecoder/scripts/training/clean-corpus-n.perl

src_lang=en
tgt_lang=de

IN_EN=$DATA_IN_PATH/test.$src_lang
IN_DE=$DATA_IN_PATH/test.$tgt_lang

#Remove Old Files if they exists
rm -f $DATA_OUT_PATH/de.norm $DATA_OUT_PATH/en.norm
rm -f $DATA_OUT_PATH/de.norm.remv $DATA_OUT_PATH/en.norm.remv
rm -f $DATA_OUT_PATH/de.norm.low.remv $DATA_OUT_PATH/en.norm.low.remv
rm -f $DATA_OUT_PATH/de.norm.low.remv.tok $DATA_OUT_PATH/en.norm.low.remv.tok

#Step1. normalize-punctuation
perl $MOSES_SCRIPTS/normalize-punctuation.perl -l $src_lang < $IN_EN > $DATA_OUT_PATH/en.norm \n
perl $MOSES_SCRIPTS/normalize-punctuation.perl -l $tgt_lang < $IN_DE > $DATA_OUT_PATH/de.norm \n

#Step3. remove-non-printing-char
perl $MOSES_SCRIPTS/remove-non-printing-char.perl < $DATA_OUT_PATH/en.norm > $DATA_OUT_PATH/en.norm.remv \n
perl $MOSES_SCRIPTS/remove-non-printing-char.perl < $DATA_OUT_PATH/de.norm > $DATA_OUT_PATH/de.norm.remv \n

#Step3. Convert all charcters to lowercase
perl $MOSES_SCRIPTS/lowercase.perl < $DATA_OUT_PATH/en.norm > $DATA_OUT_PATH/en.norm.low.remv \n
perl $MOSES_SCRIPTS/lowercase.perl < $DATA_OUT_PATH/de.norm > $DATA_OUT_PATH/de.norm.low.remv \n


#Step4. tokenize
perl $MOSES_SCRIPTS/tokenizer.perl -l en -threads 10  < $DATA_OUT_PATH/en.norm.low.remv > $DATA_OUT_PATH/test.tok.$src_lang \n
perl $MOSES_SCRIPTS/tokenizer.perl -l de -threads 10  < $DATA_OUT_PATH/de.norm.low.remv > $DATA_OUT_PATH/test.tok.$tgt_lang \n

# clean empty and long sentences, and sentences with high source-target ratio (training corpus only)
perl $CLEAN_SCRIPT -ratio 1.5 $DATA_OUT_PATH/test.tok $src_lang $tgt_lang $DATA_OUT_PATH/test 2 80

rm -f $DATA_OUT_PATH/en.norm
rm -f $DATA_OUT_PATH/en.norm.remv
rm -f $DATA_OUT_PATH/en.norm.low.remv
rm -f $DATA_OUT_PATH/norm.low.remv.tok.en

rm -f $DATA_OUT_PATH/de.norm
rm -f $DATA_OUT_PATH/de.norm.remv
rm -f $DATA_OUT_PATH/de.norm.low.remv
rm -f $DATA_OUT_PATH/norm.low.remv.tok.de
rm -f $DATA_OUT_PATH/test.tok.$tgt_lang
rm -f $DATA_OUT_PATH/test.tok.$src_lang
