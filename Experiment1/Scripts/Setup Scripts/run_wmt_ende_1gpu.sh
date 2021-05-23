#!/bin/bash
cd /home/jupyter/NewBasicModel/dataset
onmt-main --model_type Transformer \
          --config config/wmt_ende.yml --auto_config \
          train --with_eval