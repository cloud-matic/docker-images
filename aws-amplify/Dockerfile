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

RUN npm install -g npm && npm install -g @aws-amplify/cli

RUN rm -rf /var/cache/apk/*

RUN adduser -h /home/awsamplify -s /bin/bash awsamplify -D && \
    mkdir -p /home/awsamplify/.ssh /home/awsamplify/Project && \
    wget "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh" -O /home/awsamplify/.git-prompt.sh -o /dev/null

COPY bashrc /home/awsamplify/.bashrc
COPY inputrc /etc/inputrc

RUN chown -R awsamplify:awsamplify /home/awsamplify && \
    chmod -R 700 /home/awsamplify

WORKDIR /home/awsamplify

ENTRYPOINT ["/bin/bash", "-l", "-c"]
