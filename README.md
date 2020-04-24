# Analyzing Effects of Aspect Features on Bert Performance on SentimentClassification on Financial Microblog and Headlines Dataset
we plan to leverage Bert for aspect-based sentiment classification, using data presented as subtask I of Financial Opinion Mining and Question Answering Open Challenge. We will focus on two questions:
1. How does different levels of aspect data influence the performance in the Bert model?
2. How does aspect data helps in sentiment classification?

We will first provide a comparative study using different methods of feeding the sentence and aspect data into different models. And then study the effect by manipulating the input with random, noisy aspect data, and study its effect.

## Basic Setup
We follow the instruction after building up transformers and run the example on prince. After downloading data, we modify data by running [data_preprossessing.ipynb](data/data_preprossessing.ipynb) to feed in bert model under transformers. After the modification, the training data should look like in this form:
>{'question': 'Royal Mail chairman Donald Brydon set to step down', 'passage': 'Corporate/Appointment', 'idx': 0, 'label': '0'}
