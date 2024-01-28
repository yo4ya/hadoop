#!/usr/bin/env bash

#hdfs上に/user/hdfs/output01がある場合はまずそれを削除する
HDFS_DIR="/user/hdfs/output01"
if hdfs dfs -test -d $HDFS_DIR; then
    # ディレクトリが存在する場合、削除する
    echo "Delete the directory"
    hdfs dfs -rm -r $HDFS_DIR
fi

# WordCount.java の実行
# hadoop jar {jar ファイルのパス} {メインクラス名} {入力ファイルのパス} {出力先のパス}
hadoop jar wc.jar WordCount -D mapreduce.job.maps=3 -D mapreduce.job.reduces=3 /user/hdfs/input/input.txt /user/hdfs/output01

# 結果の表示
hdfs dfs -ls /user/hdfs/output01
hdfs dfs -cat /user/hdfs/output01/part-r-*
