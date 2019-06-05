#!/usr/bin/env bash

export BERT_BASE_DIR=/home/ec2-user/SageMaker/bert/bert_model/chinese_L-12_H-768_A-12
export GLUE_DIR=/home/ec2-user/SageMaker/bert/data

python run_classifier.py \
  --task_name=mytask \
  --do_train=true \
  --do_eval=true \
  --data_dir=$GLUE_DIR/mytask \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --max_seq_length=32 \
  --train_batch_size=1024 \
  --learning_rate=2e-5 \
  --num_train_epochs=3.0 \
  --output_dir=/tmp/mytask_output/ \
  --use_tpu=False