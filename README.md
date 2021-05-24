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

## Discussion
**Synthetic Trained NMT performed better than NMT trained on original data**
Statistical significance tests on BLEU and chrF++ scores indicate that NMT models trained on synthetic data performed better than NMT models trained on the original data. see attched MscThesis appendix section: “Statistical Significance Test Applied to Combined Experimental Results”. On initial observation of these results, it was surprising to find that synthetically trained models performed better.

**Transparency issue with neural networks**
Lack of transparency of neural networks makes it difficult to interpret the NMT internally themselves as to why one model performed better than the other. Due to the notorious difficulty in deciphering the internal workings of neural networks, it was decided to concentrate the analysis on all data associated with experiment to determine why the NMT trained on synthetic data performed better the NMT trained on original data. This data analysis encompasses input data used during experiment training phase, inference inputs and inference outputs during experiment testing phase.

**Visual inspection of Training Data**
To analyse the training phase of NMTs a human visual inspection was performed on the inputs (see attched MscThesis appendix section: “Samples of Sentences Used to Train Models”). The human visual inspection of the training data observed that translations annotated by the source models are of comparable quality to that of the original reference translation.

**Quality of samples generated by source model**
Recent state of the art models NMT output sentences are approaching similar quality to that human translations. The success of the active learning method applied for this project experiments are entirely reliant on performance of the source model used to translate sentences for the synthetic data training set. Active learning has been applied extensively to statistical machine translation. With the recent staggering improvement in machine translation due to adoption of neural network models and the availability of hardware sources for applying such methods, active learning has become an even more viable method for augmenting parallel corpora than previous research has previously indicated. The translation outputs of the publicly available ONMT model for German to English are of good adequacy but are not at the same adequacy and fluency as a Human translator.
For experiment 2 to 7 the quality of the Facebooks FAIRs model placed higher than a human annotator on the WMT2019 document level news translation task. The adequacy of this model is exceptional, but the fluency of human translations is still considered better than current state of the art NMT solutions.
As NMT are not at the same level of fluency as human translation a great level of scrutiny was applied when assessing experimental results when it was observed that the NMT model trained on synthetic data performed better than the NMT trained on the original data.

**Poor quality pairings when original parallel corpus was gathered**
When performing the human evaluation on results some obscure reference sentences which did not seem to fit with the source sentence were observed. A plausible cause for why the synthetic data trained models perform slightly better than that of the original data models is due to the poor sentence pairing within the original parallel corpus. The source model may have translated enough sentences that were a better representation of the source text than that matched during the initial creation of the parallel corpora. Unsupervised parallel corpora gathered by methods such as web crawling are particularly vulnerable to mismatch in pairing. Due to the sheer quantity of parallel sentences required to train state of the art NMT models, web crawled corpora are commonly used. For humans to annotate millions of high-quality sentence translations across various languages for all domains of knowledge which may use translation is impractical hence the use of unsupervised methods to generate corpora.

Automated generation and preparation of high quality parallel corpora is a difficult problem and still an active area of research. Unsupervised generation of parallel corpora rely on text alignment algorithms and filtering of noisy unsuitable sentences. Due to the wide variety of website crawled for large datasets and the variability in translation quality of websites, web crawling cab gather large quantity of noisy non sensical sentences. Use of too much noisy data is known to decreased performance in NMT models 
The noisy nature of web crawled data may have been the contributing factor in providing training data which resulted NMT outputs which did match the length of the reference sentence as often as the NMT model trained synthetic data.

**Sample Selection**
The active learning model extraction attack implemented during this project is simple to employ. For the project, all samples sentences were chosen randomly from a specified parallel corpora. More advanced active learning implementations use heuristic methods for finding more appropriate sample sentences for training. If an adversary is restricted to obtain a high functioning model within a specified query budget it would be prudent to employ some form of heuristic to find high performing source sentences as opposed to the random selection used within this project. During visual inspection of sentences, a correlation between long complex source sentences and poor target translations was observed. A simple heuristic would be to search sentences based on length so that these more challenging sentences would not appear within training corpora.
Total token entropy is a heuristic method originally applied to active learning with sequence models (Settles & Craven, 2008). Within uncertainty, sampling entropy can be used as a measure of informativeness as non-sparse populations distribution have a propensity for low entropy.
Zha and colleagues (2020) applied Total Token Entropy as a selection metric for sample training sentences and found sample selected via this method resulted in better NMT model performance than that compared to NMT models trained on randomly selected samples.
Experiment 2 to experiment 4 according to the training chart produced respectable test scores on withheld test data however performed poorly on WMT test sets. Due to the small sample size of 100K, both NMT models did not generalise well to the test sets. If a better sample selection method was used a higher BLEU score may have been achieved on the unseen test sets.

## Conclusion
The aim of this project work is to evaluate how effective a synthetic parallel corpus created via active learning model extraction attack are at training a substitute neural machine translation model. Analysis of experimental results confirmed that using solely a synthetic dataset generated from active learning with random sample selection can be used to train functioning NMT models.

A transformer NMT trained solely on synthetic data from active learning achieved a respectable BLEU score of 29.3 on the WMT2017 news test set. To put this BLEU score into perspective the LMUs recurrent neural network NMT submission in the WMT2017 news translation task achieved the best human evaluation score and had a BLEU score of 27.1 on the same WMT2017 news test set. Surprisingly, the statistical analysis test of experimental results indicated that NMT models trained solely on synthetic data performed better than NMTs trained on the original data.

As NMT models have not surpassed human quality translation the experimental result was surprising. The analysis of the large datasets used during training was found to contain web crawled parallel corpora that infrequently had poor translation pairing. Noise within the original training data allowed the NMT model trained on synthetically generated data to better match reference translation.

The objective of evaluation of the effectiveness of active learning model extraction on large scale data and was not properly realised during experiments due to poor sample sentence selection. While using the larger datasets the NMT trained on the original data was not representative of a well-performing NMT that would be worthwhile for an adversary to attack. Thus, a comparison of the difference in performance between original and synthetic data would not be conducive to the assessment of the effectiveness of model extraction attacks.

However, as the NMT model trained on synthetic data performed better than web crawled data, it showed that active learning is an effective unsupervised method of data augmentation. High variability of both synthetic and original NMT model’s performance is observed across the experiment. High variability of performance appeared to be caused by the random sample selection method. The greatest challenge in applying active learning model extraction attacks is the selection of high-quality sample sentences for translation.

Comprehensive analyses of results from experiments conclude that simple active learning model extraction attacks are a genuine threat to the monetization of NMT models.


