    srun --nodes=1 --cpus-per-task=1 --time=3:00:00 --gres=gpu:1  --mem=16GB --pty /bin/bash
    module purge
    module load anaconda3/5.3.1
    module load cuda/10.0.130
    module load gcc/6.3.0
    NETID=mw3706
    source activate /scratch/${NETID}/nlu/env
    cd /scratch/${NETID}/nlu/code
    #--- First time setup ---#
    git clone https://github.com/google-research/bert.git
    pip install tensorflow==1.15.0
    #------------------------#
    cd bert
    export BERT_BASE_DIR=/scratch/${NETID}/nlu/code/bert/pre_train_model/uncased_L-12_H-768_A-12
    export GLUE_DIR=/scratch/${NETID}/nlu/data
    python run_classifier.py \
      --task_name=MRPC \
      --do_train=true \
      --do_eval=true \
      --data_dir=$GLUE_DIR/MRPC \
      --vocab_file=$BERT_BASE_DIR/vocab.txt \
      --bert_config_file=$BERT_BASE_DIR/bert_config.json \
      --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
      --max_seq_length=128 \
      --train_batch_size=32 \
      --learning_rate=2e-5 \
      --num_train_epochs=3.0 \
      --output_dir=/tmp/mrpc_output/
