#!/bin/bash
qty=150000
seed=44219
src_lang=de-en
tgt_lang=
file_path=~/UFAL_medical_shuffled/shuffled

rm -f shuffled_data.$src_lang shuffled_data.$tgt_lang rand_num.txt file_length.txt
touch rand_num.txt

wc -l $file_path.$src_lang >> file_length.txt
python gen_rand_num.py --input_file file_length.txt --output_file rand_num.txt --quantity $qty --seed $seed

perl perl_numbers.perl rand_num.txt $file_path.$src_lang >> shuffled_data.$src_lang
