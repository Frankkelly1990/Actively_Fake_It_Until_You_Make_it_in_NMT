DIR=~/exp3/paracrawl/orig_data_bpe
DATA=$DIR/WMT20_TEST
SYS_OUTPUT=$DATA/wmt20_translations.txt
REF_TXT=$DATA/WMT20_en_de.ref1

fairseq-score -s $SYS_OUTPUT -r $REF_TXT