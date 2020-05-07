#!/bin/sh
#SBATCH --gres=gpu:1
#SBATCH --mem=16000
#SBATCH --time=0:30:00
#SBATCH --job-name="project"

module purge
module load anaconda3/5.3.1
module load cuda/10.0.130
module load gcc/6.3.0

# Replace with your NetID
NETID=yd1158
TASK_NAME=boolq
SUBTASK=random2_1_as_bert
source activate /scratch/${NETID}/nlu/env

cd /scratch/${NETID}/nlu/code/transformers
export PYTHONPATH=/scratch/${NETID}/nlu/code/transformers/src:$PYTHONPATH
python ./examples/run_glue.py \
    --model_type bert \
    --model_name_or_path bert-base-uncased \
    --task_name ${TASK_NAME} \
    --do_train \
    --do_eval \
    --data_dir /scratch/${NETID}/nlu/data/fin/1_as/random2 \
    --max_seq_length 64 \
    --per_gpu_eval_batch_size=8   \
    --per_gpu_train_batch_size=8   \
    --learning_rate 2e-5 \
    --num_train_epochs 3.0 \
    --output_dir /scratch/${NETID}/nlu/${SUBTASK}_run/

