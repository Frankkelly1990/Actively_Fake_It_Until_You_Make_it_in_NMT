#!/bin/bash
set -e 

MOSES_SCRIPTS=~/mosesdecoder/scripts/tokenizer
SRC_LANG=en
TGT_LANG=de

TEST_FILES=( ~/exp3/test_scripts_bpe/dev/paracrawl/orig_data_bpe )

for DIR in "${TEST_FILES[@]}"
do

mv  $DIR/test.$SRC_LANG $DIR/test_dev.$SRC_LANG
mv  $DIR/test.$TGT_LANG $DIR/test_dev.$TGT_LANG

sed -r 's/\@\@ //g' $DIR/test_dev.$SRC_LANG | perl $MOSES_SCRIPTS/detokenizer.perl -l $SRC_LANG > $DIR/test.$SRC_LANG
sed -r 's/\@\@ //g' $DIR/test_dev.$TGT_LANG | perl $MOSES_SCRIPTS/detokenizer.perl -l $TGT_LANG > $DIR/test.$TGT_LANG

rm -f $DIR/test_dev.$SRC_LANG
rm -f $DIR/test_dev.$TGT_LANG

done
