#!/bin/bash
DATA_DIR=$1
DATA_IN_PATH=$DATA_DIR/test_data/test
DATA_OUT_PATH=$DATA_DIR/test_data

MOSES_SCRIPTS=/home/jupyter/mosesdecoder/scripts/tokenizer
CLEAN_SCRIPT=/home/jupyter/mosesdecoder/scripts/training/clean-corpus-n.perl

src_lang=en
tgt_lang=de

IN_DE=$DATA_IN_PATH.de
IN_EN=$DATA_IN_PATH.en

#Remove Old Files if they exists
rm -f $DATA_OUT_PATH/de.norm $DATA_OUT_PATH/en.norm
rm -f $DATA_OUT_PATH/de.norm.remv $DATA_OUT_PATH/en.norm.remv
rm -f $DATA_OUT_PATH/de.norm.low.remv $DATA_OUT_PATH/en.norm.low.remv
rm -f $DATA_OUT_PATH/de.norm.low.remv.tok $DATA_OUT_PATH/en.norm.low.remv.tok

#Step1. normalize-punctuation
perl $MOSES_SCRIPTS/normalize-punctuation.perl -l $tgt_lang < $IN_DE > $DATA_OUT_PATH/de.norm \n
perl $MOSES_SCRIPTS/normalize-punctuation.perl -l $src_lang < $IN_EN > $DATA_OUT_PATH/en.norm \n

#Step3. remove-non-printing-char
perl $MOSES_SCRIPTS/remove-non-printing-char.perl < $DATA_OUT_PATH/en.norm > $DATA_OUT_PATH/en.norm.remv \n
perl $MOSES_SCRIPTS/remove-non-printing-char.perl < $DATA_OUT_PATH/de.norm > $DATA_OUT_PATH/de.norm.remv \n
 
#Step3. Convert all charcters to lowercase
perl $MOSES_SCRIPTS/lowercase.perl < $DATA_OUT_PATH/en.norm.remv > $DATA_OUT_PATH/en.norm.low.remv \n
perl $MOSES_SCRIPTS/lowercase.perl < $DATA_OUT_PATH/de.norm.remv > $DATA_OUT_PATH/de.norm.low.remv \n

#Step4. tokenize
perl $MOSES_SCRIPTS/tokenizer.perl -l de -threads 10  < $DATA_OUT_PATH/de.norm.low.remv > $DATA_OUT_PATH/norm.low.remv.tok.de \n
perl $MOSES_SCRIPTS/tokenizer.perl -l en -threads 10  < $DATA_OUT_PATH/en.norm.low.remv > $DATA_OUT_PATH/norm.low.remv.tok.en \n

#Step5. Remove too long or too short sentences
perl $CLEAN_SCRIPT -ratio 1.5 $DATA_OUT_PATH/norm.low.remv.tok $src_lang $tgt_lang $DATA_OUT_PATH/test.tok 2 200

rm -f $DATA_OUT_PATH/de.norm $DATA_OUT_PATH/en.norm
rm -f $DATA_OUT_PATH/de.norm.remv $DATA_OUT_PATH/en.norm.remv
rm -f $DATA_OUT_PATH/de.norm.low.remv $DATA_OUT_PATH/en.norm.low.remv
rm -f $DATA_OUT_PATH/norm.low.remv.tok.de $DATA_OUT_PATH/norm.low.remv.tok.en

#Get test data from https://github.com/hsing-wang/WMT2020_BioMedical/blob/master/Bio-18-19-testset/
#wget https://raw.githubusercontent.com/hsing-wang/WMT2020_BioMedical/master/Bio-18-19-testset/wmt18.medline.en-de.de
#wget https://raw.githubusercontent.com/hsing-wang/WMT2020_BioMedical/master/Bio-18-19-testset/wmt18.medline.en-de.en