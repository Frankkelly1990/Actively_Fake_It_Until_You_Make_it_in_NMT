DIR=~/exp3/opus/orig_data_bpe
DATA=$DIR/WMT20_TEST
mkdir -p $DATA

cd $DATA

sacrebleu --test-set wmt20/tworefs --language-pair en-de --echo src > $DATA/WMT20_en_de.src
sacrebleu --test-set wmt20/tworefs --language-pair en-de --echo ref > WMT20_en_de.ref

while IFS=$'\t' read -r ref1 ref2; do
    echo "$ref1\n" >> WMT20_en_de.ref1
    echo "$ref2\n" >> WMT20_en_de.ref2
done < WMT20_en_de.ref
