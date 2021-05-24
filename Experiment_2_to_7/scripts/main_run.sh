#!/bin/bash

# bash main_preprocess_script.sh

bash fairseq_train.sh

bash fairseq_generate.sh

cd ~/exp3/paracrawl/orig_data_bpe/scripts/eval_scripts

bash main_post_process.sh