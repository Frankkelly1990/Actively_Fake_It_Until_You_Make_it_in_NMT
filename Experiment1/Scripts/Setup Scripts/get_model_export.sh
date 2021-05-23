#model 1 uncomment below
# cd /home/jupyter/FinalProject
# mkdir -p model_export
# cd /home/jupyter/FinalProject/model_export
# wget -N https://s3.amazonaws.com/opennmt-models/averaged-ende-export500k.tar.gz
# for f in *.tar.gz; do tar xf "$f"; done

cd /home/jupyter/FinalProject
mkdir -p model_export_v2
cd /home/jupyter/FinalProject/model_export_v2
wget -N https://s3.amazonaws.com/opennmt-models/averaged-ende-export500k-v2.tar.gz
for f in *.tar.gz; do tar xf "$f"; done
