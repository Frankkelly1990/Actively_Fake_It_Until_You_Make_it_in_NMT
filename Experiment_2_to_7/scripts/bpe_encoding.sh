DATA_DIR=$1
BPE_SCRIPTS=~/subword-nmt/subword_nmt
BPE_out=$DATA_DIR/BPE
data_in=$DATA_DIR/processed_data/opus.clean

bpe_operations=25000
bpe_threshold=15
src_lang=en
tgt_lang=de

echo "Training Sub-Word BPE"
#Train Subword BPE 
python $BPE_SCRIPTS/learn_joint_bpe_and_vocab.py \
                    -i $data_in.$src_lang $data_in.$tgt_lang \
                    --write-vocabulary $BPE_out/vocab.$src_lang $BPE_out/vocab.$tgt_lang \
                    -s $bpe_operations \
                    -o $BPE_out/model_$src_lang.$tgt_lang.bpe
  
#Apply BPE to data
echo "Applying BPE to data"
python $BPE_SCRIPTS/apply_bpe.py -c $BPE_out/model_$src_lang.$tgt_lang.bpe --vocabulary $BPE_out/vocab.$src_lang --vocabulary-threshold $bpe_threshold < $data_in.$src_lang > $data_in.bpe.$src_lang

python $BPE_SCRIPTS/apply_bpe.py -c $BPE_out/model_$src_lang.$tgt_lang.bpe --vocabulary $BPE_out/vocab.$tgt_lang --vocabulary-threshold $bpe_threshold < $data_in.$tgt_lang > $data_in.bpe.$tgt_lang
