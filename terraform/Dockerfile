FROM       alpine
MAINTAINER Mauricio Araya

ENV LANGUAGE=en_US
ENV LANG=en_US.UTF-8
ENV TF_VERSION=0.11.7

RUN apk update

RUN apk add --update git openssh wget unzip
RUN apk add --no-cache --update jq build-base alpine-sdk bash zip python3 python3-dev && \
    python3 -m ensurepip && \
    pip3 install --upgrade pip setuptools awscli && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi

RUN rm -rf /var/cache/apk/*

RUN cd /tmp/ && \
    wget "https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip" -O terraform.zip -o /dev/null && \
    unzip terraform.zip && \
    mv terraform /usr/bin && \
    ls -l /usr/bin/terraform && \
    terraform -version && \
    which aws && \
    aws --version

