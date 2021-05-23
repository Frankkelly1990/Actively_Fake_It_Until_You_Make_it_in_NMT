#!/bin/bash

set -e


EVAL_FILES=( ~/experiment1-100k-synthetic_data1 ~/experiment1-100k-synthetic_data2  )

for DIR in "${EVAL_FILES[@]}"
do

echo $DIR

rm -r -f $DIR/test_data

cp -r -f ./test_data $DIR

done