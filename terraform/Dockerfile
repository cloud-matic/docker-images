FROM       alpine
MAINTAINER Mauricio Araya

ENV LANGUAGE=en_US
ENV LANG=en_US.UTF-8
ENV TF_VERSION=0.11.7

RUN apk update

RUN apk add --update git openssh openssl openssl-dev wget unzip

RUN apk add --no-cache --update jq build-base alpine-sdk bash zip python3 python3-dev && \
    apk add --no-cache --update bash ca-certificates curl gcc make libffi-dev musl-dev && \
    python3 -m ensurepip && update-ca-certificates && \
    pip3 install --upgrade pip setuptools awscli jmespath-terminal azure-cli && \
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
    aws --version && \
    az --version

RUN mkdir -p /home/terraform
WORKDIR /home/terraform

ENTRYPOINT ["/bin/bash"]
