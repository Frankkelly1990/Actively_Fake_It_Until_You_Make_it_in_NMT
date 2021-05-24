#!/bin/bash
#Take input path from Main_preprocess_script.sh
DATA_DIR=$1
lang1=en
lang2=de
OUT_DIR=$DATA_DIR/processed_data
data_file=$DATA_DIR/processed_data/opus.clean.bpe

cd $DATA_DIR


(head -23000 > dump.$lang1; cat > $OUT_DIR/train.$lang1) < $data_file.$lang1
(head -23000 > dump.$lang2; cat > $OUT_DIR/train.$lang2) < $data_file.$lang2

(head -3000 > $OUT_DIR/val.$lang1; cat > $OUT_DIR/test.$lang1) < dump.$lang1
(head -3000 > $OUT_DIR/val.$lang2; cat > $OUT_DIR/test.$lang2) < dump.$lang2

rm -f dump.$lang1 dump.$lang2
 
