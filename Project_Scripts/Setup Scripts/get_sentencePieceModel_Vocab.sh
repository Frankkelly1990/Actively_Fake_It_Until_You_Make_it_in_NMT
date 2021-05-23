cd /home/jupyter/FinalProject
mkdir -p sentencePiece_model_vocab
cd /home/jupyter/FinalProject/sentencePiece_model_vocab
wget -N https://s3.amazonaws.com/opennmt-trainingdata/wmt_ende_sp_model.tar.gz
for f in *.tar.gz; do tar xf "$f"; done