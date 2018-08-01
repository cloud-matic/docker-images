FROM       alpine
MAINTAINER Mauricio Araya

ENV LANGUAGE=en_US
ENV LANG=en_US.UTF-8

RUN apk update

RUN apk add --update git openssh wget unzip

RUN rm -rf /var/cache/apk/*

RUN cd /tmp/ && \
    wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip -o terraform.zip && \
    unzip terraform.zip && \
    mv terraform /usr/bin && \
    ls -l /usr/bin/terraform && \
    terraform -version
