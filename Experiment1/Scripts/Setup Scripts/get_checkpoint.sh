cd /home/jupyter/FinalProject
mkdir -p model_checkpoint
cd /home/jupyter/FinalProject/model_checkpoint
wget -nc https://s3.amazonaws.com/opennmt-models/averaged-ende-ckpt500k.tar.gz
for f in *.tar.gz; do tar xf "$f"; done

#tar xf averaged-ende-ckpt500k.tar.gz