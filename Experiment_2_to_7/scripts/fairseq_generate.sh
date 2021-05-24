#Set Directory Paths
DIR=~/exp3/paracrawl/orig_data_bpe
DATA=$DIR/execution_data
CHECKPOINT_DIR=$DIR/checkpoints
RESULTS=$DIR/results

FAIRSEQ_CLIENT=~/fairseq/fairseq_cli
MULTI_BLUE=~/mosesdecoder/scripts/generic/multi-bleu.perl
src_lang=en
tgt_lang=de

rm -f gen.out

fairseq-generate $DATA \
            --path $CHECKPOINT_DIR/checkpoint_best.pt \
            --beam 4 --lenpen 0.6 --remove-bpe > $RESULTS/gen.out
