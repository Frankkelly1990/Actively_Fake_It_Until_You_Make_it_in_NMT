#Set Directory Paths
DIR=~/exp3/paracrawl/orig_data_bpe
BPE_MODEL=$DIR/BPE/model_en.de.bpe
MODEL_DATA=$DIR/execution_data

DATA_DIR=$DIR/WMT20_TEST

DATA_IN=$DATA_DIR/WMT20_en_de.src


CHECKPOINT_DIR=$DIR/checkpoints

FAIRSEQ_CLIENT=~/fairseq/fairseq_cli
MULTI_BLUE=~/mosesdecoder/scripts/generic/multi-bleu.perl
src_lang=en
tgt_lang=de

rm -f $DATA_DIR/wmt20_gen.out

# cat $DATA_IN | fairseq-interactive \
#             --path $CHECKPOINT_DIR/checkpoint_best.pt $MODEL_DATA \
#             --source-lang en --target-lang de \
#             --bpe subword_nmt \
#             --bpe-codes $BPE_MODEL \
#             --tokenizer moses \ 
#             --beam 4 \
#             --fp16 \
#             --lenpen 0.6 > $DATA_DIR/wmt20_gen.out


cat $DATA_IN | CUDA_VISIBLE_DEVICES=0 fairseq-interactive \
            --path $CHECKPOINT_DIR/checkpoint_best.pt $MODEL_DATA \
            --source-lang en --target-lang de \
            --bpe subword_nmt \
            --bpe-codes $BPE_MODEL \
            --tokenizer moses \
            --beam 4 \
            --fp16 \
            --lenpen 0.6 > $DATA_DIR/wmt20_gen.out      
