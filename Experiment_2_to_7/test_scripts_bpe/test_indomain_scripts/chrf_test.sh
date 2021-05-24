#!/bin/bash
set -e

DIR=$1
RESULTS=$DIR/test_data

python ~/chrF/chrF++.py -R $RESULTS/test.detok.de -H $RESULTS/test.gen.out.hyp.sorted.detok.de  > $RESULTS/test.chrF.score