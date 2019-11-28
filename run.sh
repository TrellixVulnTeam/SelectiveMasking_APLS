# DATA_DIR=${HOME}/nvidia-bert/data/yelp_amazon/yelp_review_full_csv
    # --bert_model bert-base-uncased \
DATA_DIR=${HOME}/nvidia-bert/data/rt-polaritydata/full/
# DATA_DIR=${HOME}/nvidia-bert/data/twitter/full_pre/
# DATA_DIR=${HOME}/nvidia-bert/data/Aspect-Based-Sentiment-Analysis/14data/



ITER=$1
SEED=$2

# OUTPUT_DIR=results/twitter/rand_amazon_pre/${SEED}/ckpt_${ITER}
# OUTPUT_DIR=results/twitter/origin/${SEED}/ckpt_${ITER}
# OUTPUT_DIR=results/twitter/test/${SEED}/ckpt_${ITER}
OUTPUT_DIR=results/mr_mask_no_stop/small_bert/${SEED}/ckpt_${ITER}

python3 run_classifier_ckpy.py \
    --bert_model=pretrain_bert_model/bert-base-uncased/ \
    --do_train \
    --do_eval \
    --task_name=mr \
    --data_dir=${DATA_DIR}/ \
    --output_dir=${OUTPUT_DIR}  \
    --max_seq_length=256   \
    --train_batch_size=32 \
    --num_train_epochs=10 \
    --learning_rate=2e-5 \
    --do_lower_case \
    --fp16 \
    --gradient_accumulation_steps 2 \
    --seed=${SEED} \
    --ckpt=results/small_bert/checkpoints/ckpt_${ITER}.pt \
