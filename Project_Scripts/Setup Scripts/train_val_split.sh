#Script for splittig data into training and evaluation datsets
#Set Parameter values
val_size = 1000
src_file_in = '/home/jupyter/synthethic_dataset/synthethic_dataset/data/src-train.txt'
tgt_file_in = '/home/jupyter/synthethic_dataset/synthethic_dataset/data/tgt-train.txt'
output_dir = '/home/jupyter/synthethic_dataset/synthethic_dataset/data/'


#Code for excution does'nt require touching
import os

f_src = open(src_file_in,'r')
f_tgt = open(tgt_file_in,'r')

src_list = []
x=0
for line in f_src:
    line = line.replace('\n','')
    src_list.append(line)

tgt_list = []
x=0
for line in f_tgt:
    line = line.replace('\n','')
    tgt_list.append(line)

#Split input data into traingin and validation split
src_train = src_list[:-val_size]
tgt_train = tgt_list[:-val_size]
src_val = src_list[-val_size:]
tgt_val = tgt_list[-val_size:]

#Define Output Paths and then Create trainign and evaluation text files
src_val_path = output_dir+"/src-val.txt"
tgt_val_path = output_dir+"/tgt-val.txt"
src_train_path = output_dir+"/src-train.txt"
tgt_train_path = output_dir+"/tgt-train.txt"

src_eval_path = output_dir+"/src-val_split.txt"
tgt_eval_path = output_dir+"/tgt-val_split.txt"
src_train_path = output_dir+"/src-train_split.txt"
tgt_train_path = output_dir+"/tgt-train_split.txt"

with open(src_eval_path, 'w') as f:
    for item in src_val:
        f.write("%s\n" % item)
        
with open(tgt_eval_path, 'w') as f:
    for item in tgt_val:
        f.write("%s\n" % item)
        
with open(src_train_path, 'w') as f:
    for item in src_train:
        f.write("%s\n" % item)
        
with open(tgt_train_path, 'w') as f:
    for item in tgt_train:
        f.write("%s\n" % item)        
         