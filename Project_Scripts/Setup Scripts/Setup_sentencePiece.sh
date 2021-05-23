sudo apt-get install cmake build-essential pkg-config libgoogle-perftools-dev
cd /home/jupyter/FinalProject
git clone https://github.com/google/sentencepiece.git 
cd sentencepiece
mkdir build
cd build
cmake ..
make -j $(nproc)
sudo make install
sudo ldconfig -v

cd ~
pip3 install sacrebleu
pip install sentencepiece