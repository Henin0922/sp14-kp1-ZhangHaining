#!/bin/bash

# 命令行参数传递随机数数量 $1 和重复次数 $2
N=$1
M=$2

if [ ! -d "random_numbers" ]; then
  mkdir random_numbers
fi

for i in $(seq 1 $M); do
    file_name="random_numbers_${i}.txt"

  for j in $(seq 1 $N); do
    echo $RANDOM >> "random_numbers/$file_name"
  done
done

unique_numbers=$(cat random_numbers/* | sort | uniq | wc -l)

echo "已生成 $N 个随机数，重复 $M 次。"
echo "共有 $unique_numbers 个唯一数字。"
