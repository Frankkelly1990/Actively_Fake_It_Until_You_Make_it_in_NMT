#!/bin/bash
set -e

pip install subword-nmt

TEST_FILES=( ~/exp3/opus/orig_data_bpe ~/exp3/opus/orig_data_bpe1  ~/exp3/paracrawl/orig_data_bpe )

# TEST_FILES=( ~/exp3/opus/synth_data_bpe ~/exp3/opus/synth_data_bpe1  ~/exp3/paracrawl/synth_data_bpe )

for DIR in "${TEST_FILES[@]}"
do
cd $DIR

echo $DIR
TEST_SCRIPTS=$DIR/scripts/test_indomain_scripts

cd $TEST_SCRIPTS

bash main_test_indomain.sh $DIR

cd $DIR
zip -r test_data.zip test_data

done