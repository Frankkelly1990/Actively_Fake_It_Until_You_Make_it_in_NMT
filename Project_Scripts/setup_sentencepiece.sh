#!/bin/bash
pip install sentencepiece

sudo apt-get install cmake build-essential pkg-config libgoogle-perftools-dev

git clone https://github.com/google/sentencepiece.git 
cd sentencepiece
mkdir build
cd build
cmake ..
make -j $(nproc)
sudo make install
sudo ldconfig -v