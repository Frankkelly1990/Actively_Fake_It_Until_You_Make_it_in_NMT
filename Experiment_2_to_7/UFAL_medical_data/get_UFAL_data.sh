#Download UFAL Medical Corpus
wget -nc http://ufallab.ms.mff.cuni.cz/~varis/himlcorpus-data/UFAL_Medical_Corpus1.0_for_WMT17.tar.gz --user=18d140 --password=ufalmedi --continue

#Extract only required files
#tar -zxvf UFAL_Medical_Corpus1.0_for_WMT17.tar.gz UFAL_medical_shuffled/README
tar -zxvf UFAL_Medical_Corpus1.0_for_WMT17.tar.gz UFAL_medical_shuffled/shuffled.de-en.gz



# #split large files but dont break lines
# split -C 250M shuffled.de-en ufal_de_en_