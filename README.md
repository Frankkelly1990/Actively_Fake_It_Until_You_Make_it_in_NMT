# Actively Fake It Until You Make it in NMT
## Abstract
Model extraction attacks can create functionally equivalent models if given query access to deep neural networks (DNNs).
State-of-the-art results in machine translation are currently achieved by training DNNs on vast quantities of parallel corpora. Gathering and annotating large quantities of high-quality data requires substantial time and financing. Active learning model extraction attacks bypass this hurdle by focusing on extracting this valuable information from deployed DNN models.

Active learning model extraction approaches generate synthetic training datasets by having a victim model label an adversary's input data. Such model extraction attacks enable an adversary to obtain a functionally equivalent model. Active learning model extraction is problematic for the monetization of DNN APIs as it undermines the valuable intellectual property of deployed models.

This study aims to evaluate how effective the active learning forward translation process can be for generating synthetic parallel corpora for training Neural Machine Translation (NMT) Models. For experiments the active learning model extraction process is used to generate a target language pair from source data which is a part of an existing parallel corpus. A NMT model is trained on the synthetic parallel corpora and another identical NMT model is trained on the original parallel corpora.

Experiments showed using synthetic parallel corpora generated from active learning via random sample selection can be used to train functioning NMT models.Active learning model extraction has been applied to various NLP tasks. However, to the best of my knowledge, this will be the first evaluation of active learning model extraction attack applied to a Neural Machine Translation model.

## Implemented Experiment Methodology
### Experiment Variations
In total 7 experiments were executed. A summary of variations between the experiments is shown the table below:
![alt text](https://github.com/Frankkelly1990/Actively_Fake_It_Until_You_Make_it_in_NMT/blob/master/images/Experiment%20summary.PNG?raw=true)

Except for variations in configuration stated in the above table, all 7 experiments follow the exact same process pipeline.
### Experiment Pipeline

The active learning model extraction attack experiment pipeline is shown below. Steps of active learning model extraction attack experiment pipeline are as follows:
1. Take the original source language sentences from parallel corpus and create a monolingual corpus.
2. Input monolingual original Source Language corpus into victim source model for translation.
3. Combine the original source sentences with its associated synthetic target sentences to create synthetic parallel corpora.
4. Perform identical pre-processing of synthetic parallel corpora and original parallel corpora.
5. Train NMT models of identical configuration on synthetic parallel corpora and original parallel corpora
6. Post training both NMT models performance are evaluated by translating the same withheld corpus data unseen by the NMT model
7. Post training both NMT models performance is then further evaluated by translating the same WMT test sets

![alt text](https://github.com/Frankkelly1990/Actively_Fake_It_Until_You_Make_it_in_NMT/blob/master/images/Active%20Learning%20Model%20Extraction%20Experiment%20Pipeline.PNG?raw=true)

### Automatic Evaluation Metric Results
A comparison of test set BLEU scores and chrF++ scores showed that best performing models were trained on synthetic parallel corpora during experiment1. It noted that the chrF++ evaluation metric reported less a smaller ratio of difference in performance between NMT trained on synthetic data vs the NMT trained on original data

**WMT2017 Test Set BLEU Score Comparison**
![alt text](https://github.com/Frankkelly1990/Actively_Fake_It_Until_You_Make_it_in_NMT/blob/master/images/WMT17%20Test%20Set%20Bleu%20Score%20Comparison.PNG?raw=true)

**WMT2017 Test Set chrf++ Score Comparison**
![alt text](https://github.com/Frankkelly1990/Actively_Fake_It_Until_You_Make_it_in_NMT/blob/master/images/WMT17%20Test%20Set%20CHRF%2B%2B%20Score%20Comparison.PNG?raw=true)

**WMT2020 Test Set BLEU Score Comparison**
![alt text](https://github.com/Frankkelly1990/Actively_Fake_It_Until_You_Make_it_in_NMT/blob/master/images/WMT20%20Test%20Set%20Bleu%20Score%20Comparison.PNG?raw=true)

**WMT2020 Test Set chrf++ Score Comparison**
![alt text](https://github.com/Frankkelly1990/Actively_Fake_It_Until_You_Make_it_in_NMT/blob/master/images/WMT20%20Test%20Set%20CHRF%2B%2B%20Score%20Comparison.PNG?raw=true)

### Human Evaluation Results
The relative ranking assessment performed by a native German speaker found the NMT model trained on synthetic data consistently performed better than the NMT trained on original data. The human judge noted many ties and stated that the magnitude of difference performance of both models seemed consistently marginal for experiments 1 to experiment 4. For experiment 5 to experiment 7 the difference in performance was noted to be much more significant.

**Comparison of Human Relative Ranking Scores Across All experiments**
![alt text](https://github.com/Frankkelly1990/Actively_Fake_It_Until_You_Make_it_in_NMT/blob/master/images/Comaprison%20of%20human%20relative%20ranking%20scores%20across%20all%20experiments.PNG?raw=true)


## Conclusion
The aim of this project work is to evaluate how effective a synthetic parallel corpus created via active learning model extraction attack are at training a substitute neural machine translation model. Analysis of experimental results confirmed that using solely a synthetic dataset generated from active learning with random sample selection can be used to train functioning NMT models.

A transformer NMT trained solely on synthetic data from active learning achieved a respectable BLEU score of 29.3 on the WMT2017 news test set. To put this BLEU score into perspective the LMUs recurrent neural network NMT submission in the WMT2017 news translation task achieved the best human evaluation score and had a BLEU score of 27.1 on the same WMT2017 news test set. Surprisingly, the statistical analysis test of experimental results indicated that NMT models trained solely on synthetic data performed better than NMTs trained on the original data.

As NMT models have not surpassed human quality translation the experimental result was surprising. The analysis of the large datasets used during training was found to contain web crawled parallel corpora that infrequently had poor translation pairing. Noise within the original training data allowed the NMT model trained on synthetically generated data to better match reference translation.

The objective of evaluation of the effectiveness of active learning model extraction on large scale data and was not properly realised during experiments due to poor sample sentence selection. While using the larger datasets the NMT trained on the original data was not representative of a well-performing NMT that would be worthwhile for an adversary to attack. Thus, a comparison of the difference in performance between original and synthetic data would not be conducive to the assessment of the effectiveness of model extraction attacks.

However, as the NMT model trained on synthetic data performed better than web crawled data, it showed that active learning is an effective unsupervised method of data augmentation. High variability of both synthetic and original NMT model’s performance is observed across the experiment. High variability of performance appeared to be caused by the random sample selection method. The greatest challenge in applying active learning model extraction attacks is the selection of high-quality sample sentences for translation.

Comprehensive analyses of results from experiments conclude that simple active learning model extraction attacks are a genuine threat to the monetization of NMT models.


