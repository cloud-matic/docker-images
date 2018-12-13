FROM       ubuntu:18.04
MAINTAINER Mauricio Araya

ENV LANGUAGE=en_US
ENV LANG=en_US.UTF-8

RUN apt-get update

RUN apt-get install -y openssh-client \
                       apt-transport-https \
                       bash-completion \
                       wget \
                       vim \
                       curl \
                       gnupg2 \
                       grc \
                       netcat \
                       iputils-ping \
                       git \
                       jq

RUN apt-get install -y libxml2 zlib1g-dev \
                      build-essential \
                      ruby-full \
                      python3 \
                      python3-pip

RUN curl -s https://packages.chef.io/chef.asc | \
         apt-key add - && \
    echo "deb https://packages.chef.io/repos/apt/stable bionic main" | \
         tee /etc/apt/sources.list.d/chef-stable.list && \
         apt-get update && \
         apt-get install chefdk

RUN gem install --no-doc --no-ri foodcritic

RUN pip3 install --upgrade pip setuptools awscli jmespath-terminal requests boto3 && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi

RUN apt-get clean -y && \
    rm -rf /root/.gem

RUN adduser -h /home/chefdk -s /bin/bash chefdk -D && \
    mkdir -p /home/chefdk/.ssh /home/chefdk/Project

COPY bashrc /home/chefdk/.bashrc
COPY inputrc /etc/inputrc

RUN chown -R chefdk:chefdk /home/chefdk && \
    chmod -R 700 /home/chefdk

WORKDIR /home/chefdk

ENTRYPOINT ["/bin/bash"]
