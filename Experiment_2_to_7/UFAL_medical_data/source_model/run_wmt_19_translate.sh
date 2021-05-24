DIR=~/exp4/UFAL/source_model/for_source_model/
INPUT_DATA=$DIR/en_aa
OUTPUT_DATA=$DIR/synth_de_aa

rm -f $OUTPUT_DATA

CUDA_VISIBLE_DEVICES=0 python load_facebook_wmt_19.py \
                                --src_file $INPUT_DATA \
                                --output_file $OUTPUT_DATA