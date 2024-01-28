# yo4ya/hadoop:v1.0.0イメージをベースとして使用
FROM yo4ya/hadoop:v1.0.0

# 環境変数を設定
ENV HADOOP_HOME=/usr/local/hadoop \
    HDFS_NAMENODE_USER=root \
    HDFS_DATANODE_USER=root \
    HDFS_SECONDARYNAMENODE_USER=root \
    JAVA_HOME=/opt/java/openjdk

# PATH環境変数を更新
ENV PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH

# mainディレクトリをコンテナの指定した場所にコピー
#COPY main /path/to/container/directory

# 起動時に複数のコマンドを実行するためのスクリプトを作成
RUN echo '#!/bin/bash' > /startup.sh && \
    echo '/usr/sbin/sshd -D &' >> /startup.sh && \
    echo 'start-dfs.sh' >> /startup.sh && \
    echo 'tail -f /dev/null' >> /startup.sh && \
    chmod +x /startup.sh

# スタートアップスクリプトを実行
CMD ["/startup.sh"]
