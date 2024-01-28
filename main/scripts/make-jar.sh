#!/usr/bin/env bash

# Java ソースのコンパイル
javac -classpath /usr/local/hadoop/share/hadoop/common/hadoop-common-3.3.6.jar:/usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-client-core-3.3.6.jar -d . WordCount.java


# コンパイルされたクラスファイルを jar にパッケージ化
jar cf wc.jar WordCount*.class
