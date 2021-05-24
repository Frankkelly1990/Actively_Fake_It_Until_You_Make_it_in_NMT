DATA_DIR=$1
WMT=$2

src_lang=en
tgt_lang=de

BPE_SCRIPTS=~/subword-nmt/subword_nmt
BPE_out=$DATA_DIR/BPE
data_in=$DATA_DIR/evaluation_data/$WMT.clean

bpe_operations=25000
bpe_threshold=15


#Apply BPE to WMT data
echo "Applying BPE to data"
python $BPE_SCRIPTS/apply_bpe.py -c $BPE_out/model_$src_lang.$tgt_lang.bpe --vocabulary $BPE_out/vocab.$src_lang --vocabulary-threshold $bpe_threshold < $data_in.$src_lang > $data_in.bpe.$src_lang