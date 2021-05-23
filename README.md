# Actively Fake It Until You Make it in NMT
## Abstract
Model extraction attacks can create functionally equivalent models if given query access to deep neural networks (DNNs).
State-of-the-art results in machine translation are currently achieved by training DNNs on vast quantities of parallel corpora. Gathering and annotating large quantities of high-quality data requires substantial time and financing. Active learning model extraction attacks bypass this hurdle by focusing on extracting this valuable information from deployed DNN models.

Active learning model extraction approaches generate synthetic training datasets by having a victim model label an adversary's input data. Such model extraction attacks enable an adversary to obtain a functionally equivalent model. Active learning model extraction is problematic for the monetization of DNN APIs as it undermines the valuable intellectual property of deployed models.

This study aims to evaluate how effective the active learning forward translation process can be for generating synthetic parallel corpora for training Neural Machine Translation (NMT) Models. For experiments the active learning model extraction process is used to generate a target language pair from source data which is a part of an existing parallel corpus. A NMT model is trained on the synthetic parallel corpora and another identical NMT model is trained on the original parallel corpora.

Experiments showed using synthetic parallel corpora generated from active learning via random sample selection can be used to train functioning NMT models.Active learning model extraction has been applied to various NLP tasks. However, to the best of my knowledge, this will be the first evaluation of active learning model extraction attack applied to a Neural Machine Translation model.
