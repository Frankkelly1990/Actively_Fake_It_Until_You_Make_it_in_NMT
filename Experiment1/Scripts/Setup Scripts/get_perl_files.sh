cd /home/jupyter/FinalProject
mkdir -p dataset
cd dataset
mkdir -p test
cd test

wget -nc https://raw.githubusercontent.com/OpenNMT/OpenNMT-py/master/tools/multi-bleu-detok.perl
wget -nc https://raw.githubusercontent.com/OpenNMT/OpenNMT-py/master/tools/multi-bleu.perl
wget -nc https://raw.githubusercontent.com/OpenNMT/OpenNMT/master/benchmark/3rdParty/input-from-sgm.perl