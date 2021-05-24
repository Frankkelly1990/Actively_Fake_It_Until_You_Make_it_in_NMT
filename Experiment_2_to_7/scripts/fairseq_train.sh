#Set Directory Paths
DIR=~/exp3/paracrawl/orig_data_bpe
DATA=$DIR/execution_data
CHECKPOINT_DIR=$DIR/checkpoints
TBOARD_DIR=$DIR/tensorboard_log

FAIRSEQ_CLIENT=~/fairseq/fairseq_cli

src_lang=en
tgt_lang=de

CUDA_VISIBLE_DEVICES=0 fairseq-train $DATA \
      -s $src_lang -t $tgt_lang \
      --lr 0.0005 --stop-min-lr 1e-09 \
      --weight-decay 0.0 --clip-norm 0.1 \
      --dropout 0.3 \
      --max-tokens 3584 \
      --update-freq 2 \
      --arch transformer_vaswani_wmt_en_de_big \
      --optimizer adam --adam-betas '(0.9, 0.98)' \
      --lr-scheduler inverse_sqrt \
      --warmup-init-lr 1e-07 \
      --warmup-updates 4000 \
      --save-dir $CHECKPOINT_DIR \
      --restore-file $CHECKPOINT_DIR/checkpoint_best.pt \
      --tensorboard-logdir $TBOARD_DIR \
      --criterion label_smoothed_cross_entropy \
      --label-smoothing 0.1 \
      --no-progress-bar \
      --log-format simple \
      --log-interval 1 \
      --save-interval-updates 10000 \
      --fp16 \
      --save-interval 20 \
      --no-epoch-checkpoints \
      --keep-last-epochs 1 \
      --keep-best-checkpoints 1 \
      --scoring "bleu" \
      --eval-bleu \
      --eval-bleu-args '{"beam": 4, "max_len_a": 1.2, "max_len_b": 5}' \
      --best-checkpoint-metric bleu \
      --maximize-best-checkpoint-metric \
      --max-update 23000
