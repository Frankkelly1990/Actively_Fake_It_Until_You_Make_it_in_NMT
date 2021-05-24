# -*- coding: utf-8 -*-
"""
Created on Wed Apr 14 13:07:35 2021

@author: Frank
"""

#Script generates random numbers to be used for selecting random sample from large dataset with bash 

def get_random_number(input_file_path, output_file_path, qty, seed):
    f = open(input_file_path,'r')
    file_length = int(f.readlines()[0].split()[0])
    lo = 1
    hi = file_length
    
    random.seed(seed)
    random_gen = (random.randint(lo,hi) for i in range(qty))
    random_list = list(random_gen)
    
    with open(output_file_path, 'w') as f:
        f.writelines("%s\n" % num for num in random_list)
    
    return

def main():
    parser = argparse.ArgumentParser(description="Input_file_path output_file_path qty")
    parser.add_argument("--input_file", default="", type=str, help="Input file paths string")
    parser.add_argument("--output_file", default="", type=str, help="Output file paths string")
    parser.add_argument("--quantity", default=1, type=int, help="Specify Quantity of Numbers to Generate")
    parser.add_argument("--seed", default="", type=int, help="Specify Seed Number for generator")
    
    args = parser.parse_args()
    input_file_path = args.input_file
    output_file_path = args.output_file
    qty = args.quantity
    seed = args.seed

    get_random_number(input_file_path, output_file_path, qty, seed)
    
if __name__=='__main__':
    import os
    import random
    import argparse
    main()
    
    
    
