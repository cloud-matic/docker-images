FROM       alpine
MAINTAINER Mauricio Araya

ENV LANGUAGE=en_US
ENV LANG=en_US.UTF-8
ENV TF_VERSION=0.11.7

RUN apk update

RUN apk add --update git openssh wget unzip

RUN rm -rf /var/cache/apk/*

RUN cd /tmp/ && \
    wget "https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip" -O terraform.zip -o /dev/null && \
    unzip terraform.zip && \
    mv terraform /usr/bin && \
    ls -l /usr/bin/terraform && \
    terraform -version
