# MLLU-Final-Project
Machine Learning for Language Understanding Final Project: Using BERT with aspect to improve sentimental analysis in Twitter and Stocktwits.

## Basic Setup
Follow [Setup_Instruction.md](https://github.com/OscarWan/MLLU-Final-Project/blob/master/Setup_Instructions.md) to run the example on prince. After cloneing [BERT model](https://github.com/google-research/bert) to local folder, downloading pre-train model to *bert* folder.

## Using Data
We will use [SemiEval-2017 Task 51](https://bitbucket.org/ssix-project/semeval-2017-task-5-subtask-1/src/master/). Its features include the raw message, cashtag (the stock ticket symbol) and the sentiment score in float point number. To adabt BERT model, we will adjust the data.
