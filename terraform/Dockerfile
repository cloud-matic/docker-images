FROM       alpine
MAINTAINER Mauricio Araya

ENV LANGUAGE=en_US
ENV LANG=en_US.UTF-8
ENV TF_VERSION=0.11.14

RUN apk update

RUN apk add --no-cache --update git openssh openssl openssl-dev wget unzip vim bash-completion git-bash-completion

RUN apk add --no-cache --update jq build-base alpine-sdk bash zip python3 python3-dev && \
    apk add --no-cache --update bash ca-certificates curl gcc make libffi-dev musl-dev && \
    python3 -m ensurepip && update-ca-certificates && \
    pip3 install --upgrade pip setuptools awscli jmespath-terminal && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi

RUN rm -rf /var/cache/apk/*

RUN cd /tmp/ && \
    wget "https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip" -O terraform.zip -o /dev/null && \
    unzip terraform.zip && \
    mv terraform /usr/bin && \
    rm -f terraform.zip

RUN adduser -h /home/terraform -s /bin/bash terraform -D && \
    mkdir -p /home/terraform/.ssh /home/terraform/Project && \
    wget "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh" -O /home/terraform/.git-prompt.sh -o /dev/null

COPY bashrc /home/terraform/.bashrc
COPY inputrc /etc/inputrc

RUN chown -R terraform:terraform /home/terraform && \
    chmod -R 700 /home/terraform

WORKDIR /home/terraform

ENTRYPOINT ["/bin/bash", "-l", "-c"]
