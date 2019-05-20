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
                       net-tools \
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

RUN gem install --no-doc --no-ri foodcritic bundler

RUN pip3 install --upgrade pip setuptools awscli jmespath-terminal requests boto3 && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi

RUN apt-get clean -y && rm -rf /root/.gem

RUN useradd -m -d /home/chefdk -s /bin/bash -c ChefDK chefdk && \
    mkdir -p /home/chefdk/.ssh /home/chefdk/.chef /home/chefdk/Project && \
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
         -O /home/chefdk/.git-prompt.sh -o /dev/null

COPY bashrc /home/chefdk/.bashrc
COPY inputrc /etc/inputrc

RUN chown -R chefdk:chefdk /home/chefdk && \
    find /home/chefdk -type d | xargs chmod -v 700 && \
    find /home/chefdk -type f | xargs chmod -v 600

WORKDIR /home/chefdk

ENTRYPOINT ["/bin/bash", "-l", "-c"]
