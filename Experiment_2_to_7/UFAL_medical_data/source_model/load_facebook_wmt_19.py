def chunks(lst, n):
    """Yield successive n-sized chunks from lst."""
    for i in range(0, len(lst), n):
        yield lst[i:i + n]

def main():
    parser = argparse.ArgumentParser(description="src_file_path output_tgt_path ")
    parser.add_argument("--src_file", default="", type=str, help="Input file paths string")
    parser.add_argument("--output_file", default="", type=str, help="Output file paths string")
    args = parser.parse_args()
    src_file_path = args.src_file
    tgt_file_path = args.output_file
    batch_size=50000
    # Load a transformer trained on WMT'16 En-De
    # Note: WMT'19 models use fastBPE instead of subword_nmt, see instructions below
    en2de = torch.hub.load('pytorch/fairseq', 
                           'transformer.wmt19.en-de',
                           checkpoint_file='model1.pt',
                           tokenizer='moses',
                           bpe='fastbpe')

    en2de.eval()  # disable dropout

    # Move model to GPU for faster translation
    en2de.cuda()

    # Translate a sentence
    print("Starting!!")
    # 'Hallo Welt!'


    f = open(src_file_path, 'r', encoding='utf-8')
    src_list = f.readlines()

    #Use generator to sub divide data into smaller lists. Done due to memory issues with Translate function 
    
    mltp_src_list = list(chunks(src_list,batch_size))

    print("Translating!!")
    # Batched translation
    x=1
    
    with open(tgt_file_path, 'a', encoding='utf-8') as f:
        for src_list in mltp_src_list:
            print('batch {} of {}'.format(x,len(mltp_src_list)))
            tgt_list = en2de.translate(src_list)

            for translation in tgt_list:
                f.write('%s\n' % translation)
            x+=1
    f.close()

if __name__=='__main__':
    import torch
    import argparse
    main()
    