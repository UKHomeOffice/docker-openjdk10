# Security patches etc. managed centrally
# =======================================
FROM quay.io/ukhomeofficedigital/centos-base:latest

# Install Open Java 10
# ===================

# Set correct environment variables.
ENV	HOME /root
ENV	LANG en_US.UTF-8
ENV	LC_ALL en_US.UTF-8

RUN yum clean all && \
    yum update -y && \
    yum install -y wget && \
    yum clean all && \
    rpm --rebuilddb

RUN cd /tmp && \
    wget https://download.java.net/java/GA/jdk10/10/binaries/openjdk-10_linux-x64_bin.tar.gz && \
    tar xvf openjdk-10*_bin.tar.gz && \
    mkdir -p /usr/lib/jvm/jdk-10 && \
    mv jdk-10 /usr/lib/jvm && \
    rm openjdk-10_linux-x64_bin.tar.gz

ENV JAVA_HOME /usr/lib/jvm/jdk-10
ENV PATH $PATH:$JAVA_HOME/bin
