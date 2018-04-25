FROM       ubuntu:16.04
MAINTAINER Mauricio Araya

RUN apt-get update -y
RUN apt-get -y install git build-essential gcc autoconf python3 python3-pip curl coreutils
RUN apt-get -y install python-dev libxml2-dev libxslt-dev libtool libffi-dev libssl-dev \
                       libxml2-dev libxslt1-dev zlib1g-dev software-properties-common libmcrypt4
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade awscli --ignore-installed six

RUN rm -rf /var/lib/apt/lists/*
