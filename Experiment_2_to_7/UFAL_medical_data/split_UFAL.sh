#Split UFAL files out into seperate german and english UTF-8 txt files
#Also keep data type and orginal corpus names in sperate files but kept in correct order

DIR=~/UFAL_medical_shuffled/sample_data
FILES=$DIR/shuffled_data*
cd $DIR
echo "Start Script!"
shopt -s nullglob
for file in $FILES
do
while IFS=$'\t' read -r de_sent en_sent data_type name_of_original_corpus; do
    echo "$de_sent\n" >> shuffled_data.de
    echo "$en_sent\n" >> shuffled_data.en
    echo "$data_type\n" >> data_type.txt
    echo "$name_of_original_corpus\n" >> name_of_original_corpus.txt
done < $file
echo "$file\n"
done
echo "Script Finished!"