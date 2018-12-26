FROM       alpine
MAINTAINER Mauricio Araya

ENV LANGUAGE=en_US
ENV LANG=en_US.UTF-8

RUN apk update

RUN apk add --no-cache --update git openssh openssl openssl-dev wget unzip vim bash-completion git-bash-completion

RUN apk add --no-cache --update jq build-base alpine-sdk bash zip python3 python3-dev && \
    apk add --no-cache --update bash ca-certificates curl gcc make libffi-dev musl-dev nodejs nodejs-npm && \
    python3 -m ensurepip && update-ca-certificates && \
    pip3 install --upgrade pip setuptools awscli jmespath-terminal requests boto3 && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi

RUN npm install -g npm && npm install -g serverless

RUN rm -rf /var/cache/apk/*

RUN adduser -h /home/serverless -s /bin/bash serverless -D && \
    mkdir -p /home/serverless/.ssh /home/serverless/Project && \
    wget "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh" -O /home/serverless/.git-prompt.sh -o /dev/null

RUN npm install --save serverless-custom-packaging-plugin --prefix /home/serverless/serveless_plugins

COPY bashrc /home/serverless/.bashrc
COPY inputrc /etc/inputrc

RUN chown -R serverless:serverless /home/serverless && \
    chmod -R 700 /home/serverless

WORKDIR /home/serverless

ENTRYPOINT ["/bin/bash", "-l", "-c"]
