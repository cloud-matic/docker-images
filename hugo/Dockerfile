FROM       alpine
MAINTAINER Mauricio Araya

ENV LANGUAGE=en_US
ENV LANG=en_US.UTF-8

RUN apk update

RUN apk add --no-cache --update git openssh openssl openssl-dev wget unzip vim bash-completion git-bash-completion

RUN apk add --no-cache --update jq build-base alpine-sdk bash zip python3 python3-dev && \
    apk add --no-cache --update bash ca-certificates curl gcc make libffi-dev musl-dev && \
    python3 -m ensurepip && update-ca-certificates && \
    pip3 install --upgrade pip setuptools awscli jmespath-terminal requests boto3 && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi

RUN rm -rf /var/cache/apk/*

RUN cd /tmp/ && \
    wget $(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | \
           jq -r '.assets[] | select(.name | contains("Linux-64bit.tar.gz") and contains("hugo_extended")) | .browser_download_url') \
        -O hugo.tgz -o /dev/null && \
    tar xzvf hugo.tgz && \
    mv hugo /usr/bin && \
    rm -f *

RUN adduser -h /home/hugo -s /bin/bash hugo -D && \
    mkdir -p /home/hugo/.ssh /home/hugo/Project && \
    wget "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh" -O /home/hugo/.git-prompt.sh -o /dev/null

COPY bashrc /home/hugo/.bashrc
COPY inputrc /etc/inputrc

RUN chown -R hugo:hugo /home/hugo && \
    chmod -R 700 /home/hugo

WORKDIR /home/hugo

ENTRYPOINT ["/bin/bash", "-l", "-c"]
