cd /home/jupyter/FinalProject
mkdir -p dataset
cd /home/jupyter/FinalProject/dataset
wget -N https://s3.amazonaws.com/opennmt-trainingdata/wmt_ende_sp.tar.gz
for f in *.tar.gz; do tar xf "$f"; done