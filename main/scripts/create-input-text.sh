#!/usr/bin/env bash

# 入力のテキストファイルを作成
echo "KIOSTA BCDM WES BCDM KIOSTA KIOSTA" > input.txt

# 入力のテキストファイルを HDFS に配置
hdfs dfs -mkdir -p /user/hdfs/input
hdfs dfs -put -f input.txt /user/hdfs/input
