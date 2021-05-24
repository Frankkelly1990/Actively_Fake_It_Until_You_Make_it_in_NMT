mkdir exp2
cd exp2/
mkdir UFAL_medical_shuffled

cd ~/
git clone https://github.com/NVIDIA/nccl.git

#Build
cd nccl
make -j src.build

# Install tools to create debian packages
sudo apt install build-essential devscripts debhelper fakeroot
# Build NCCL deb package
make pkg.debian.build
ls build/pkg/deb/

cd ~/
git clone https://github.com/pytorch/fairseq
cd fairseq
pip install --editable ./

cd ~/

git clone https://github.com/NVIDIA/apex
cd apex
pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" \
  --global-option="--deprecated_fused_adam" --global-option="--xentropy" \
  --global-option="--fast_multihead_attn" ./
    
cd ~/
pip install pyarrow
pip install fastBPE sacremoses

git clone https://github.com/moses-smt/mosesdecoder.git