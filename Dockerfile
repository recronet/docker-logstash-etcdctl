FROM debian:stable
MAINTAINER RN_Sigurnosna_rjesenja@recro-net.hr

RUN apt-get -q update && apt-get install -y curl procps vim openjdk-7-jre-headless net-tools \
  && curl -o /tmp/logstash-1.4.2.tar.gz -L https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz \
  && tar -xzvf /tmp/logstash-1.4.2.tar.gz \
  && mv ./logstash-1.4.2 /opt/logstash \
  && /opt/logstash/bin/plugin install contrib \
  && curl -L https://github.com/coreos/etcd/releases/download/v0.4.6/etcd-v0.4.6-linux-amd64.tar.gz -o /tmp/etcd-v0.4.6-linux-amd64.tar.gz \
  && tar xzvf /tmp/etcd-v0.4.6-linux-amd64.tar.gz etcd-v0.4.6-linux-amd64/etcdctl \
  && mv etcd-v0.4.6-linux-amd64/etcdctl /usr/bin/ \
  && mkdir /opt/logstash/config \
  && rmdir etcd-v0.4.6-linux-amd64 \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/*
