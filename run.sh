#!/bin/bash

set -x

lr=1e-3
depth=3
head=1
batch_size=25
embed_dim=24
model=gopt
am=librispeech

exp_dir=../exp/gopt-${lr}-${depth}-${head}-${batch_size}-${embed_dim}-${model}-${am}-br

# repeat times
repeat_list=(0 1 2 3 4)

for repeat in "${repeat_list[@]}"
do
  mkdir -p $exp_dir-${repeat}
  python ./traintest.py --lr ${lr} --exp-dir ${exp_dir}-${repeat} --goptdepth ${depth} --goptheads ${head} \
  --batch_size ${batch_size} --embed_dim ${embed_dim} \
  --model ${model} --am ${am}
done

python ./collect_summary.py --exp-dir $exp_dir