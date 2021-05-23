#!/bin/bash

# set relevant paths
SP_PATH=/usr/local/bin
DATA_PATH=/home/jupyter/NewBasicModel/dataset
TEST_PATH=$DATA_PATH/test

# set vocabulary size and source and target languages
vocab_size=32000
sl=en
tl=de

# Download the default datasets into the $DATA_PATH; mkdir if it doesn't exist
mkdir -p $DATA_PATH
cd $DATA_PATH

# set training, validation, and test corpuses
corpus[1]=tgt-train
corpus[2]=src-train

validset=validation
testset=testset


export PATH=$SP_PATH:$PATH

# retrieve file preparation from Moses repository
wget -nc https://raw.githubusercontent.com/moses-smt/mosesdecoder/master/scripts/ems/support/input-from-sgm.perl

##################################################################################
# Starting from here, original files are supposed to be in $DATA_PATH
# a data folder will be created in scripts/wmt
##################################################################################

# Data preparation using SentencePiece
# First we concat all the datasets to train the SP model
if true; then
 mkdir -p data
 echo "$0: Training sentencepiece model"
 rm -f data/train.txt
 for ((i=1; i<= ${#corpus[@]}; i++))
 do
  for f in $DATA_PATH/${corpus[$i]}.$sl $DATA_PATH/${corpus[$i]}.$tl
   do
    cat $f >> data/train.txt
   done
 done
 spm_train --input=data/train.txt --model_prefix=wmt$sl$tl \
           --vocab_size=$vocab_size --character_coverage=1
fi

# Second we use the trained model to tokenize all the files
if true; then
 echo "$0: Tokenizing with sentencepiece model"
 rm -f data/train.txt
 for ((i=1; i<= ${#corpus[@]}; i++))
 do
  for f in $DATA_PATH/${corpus[$i]}.$sl $DATA_PATH/${corpus[$i]}.$tl
   do
    file=$(basename $f)
    spm_encode --model=wmt$sl$tl.model < $f > data/$file.sp
   done
 done
fi

# We concat the training sets into two (src/tgt) tokenized files
if true; then
 cat data/*.$sl.sp > data/train.$sl
 cat data/*.$tl.sp > data/train.$tl
fi

# We concat the training sets into two (src/tgt) tokenized files
if true; then
 cat data/*.$sl.sp > data/training_set.$sl
 cat data/*.$tl.sp > data/training_set.$tl
fi

#  We use the same tokenization method for a valid set (and test set)
if true; then
 perl input-from-sgm.perl < $TEST_PATH/$validset.$sl.sgm \
    | spm_encode --model=wmt$sl$tl.model > data/valid.$sl
 perl input-from-sgm.perl < $TEST_PATH/$validset.$tl.sgm \
    | spm_encode --model=wmt$sl$tl.model > data/valid.$tl
 perl input-from-sgm.perl < $TEST_PATH/$testset.$sl.sgm \
    | spm_encode --model=wmt$sl$tl.model > data/test.$sl
 perl input-from-sgm.perl < $TEST_PATH/$testset.$tl.sgm \
    | spm_encode --model=wmt$sl$tl.model > data/test.$tl
fi

# Let's finish and clean up
mv wmt$sl$tl.model data/wmt$sl$tl.model

# Prepare vocabulary for OpenNMT-tf
onmt-build-vocab --from_format sentencepiece --from_vocab wmt$sl$tl.vocab --save_vocab data/wmt$sl$tl.vocab



