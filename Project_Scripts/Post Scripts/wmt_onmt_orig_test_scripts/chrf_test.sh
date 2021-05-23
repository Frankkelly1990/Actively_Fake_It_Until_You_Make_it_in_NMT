#!/bin/bash
set -e
DIR=$1
TEST_DATA=$DIR/test_data
tl=de
sl=en

python ~/chrF/chrF++.py -R $TEST_DATA/test.$tl -H $TEST_DATA/test.hyp.detok.$tl > $TEST_DATA/test.chrF.score
