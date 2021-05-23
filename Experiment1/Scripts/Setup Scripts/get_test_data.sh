cd /home/jupyter/FinalProject/dataset/
mkdir -p test
# Validation and test data are put into the $DATA_PATH/test folder
echo "Downloading and extracting newstest2014 data (4 MB) for validation..."
wget --trust-server-names -N http://www.statmt.org/wmt14/test-filtered.tgz
echo "Downloading and extracting newstest2017 data (5 MB) for testing..."
wget --trust-server-names -N http://data.statmt.org/wmt17/translation-task/test.tgz

for f in *.tgz; do tar zxvf "$f"; done


