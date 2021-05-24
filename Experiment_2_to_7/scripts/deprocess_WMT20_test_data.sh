DIR=~/exp3/paracrawl/orig_data_bpe1
DATA_DIR=$DIR/WMT20_TEST
DATA=$DATA_DIR/wmt20_gen.out

grep -P "D-[0-9]+" $DATA | cut -f3 > $DATA_DIR/wmt20_translations.txt