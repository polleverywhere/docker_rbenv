FROM ubuntu:trusty
MAINTAINER Andy Shinn <andy@polleverywhere.com>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV PATH $HOME/.rbenv/bin:$PATH

RUN apt-get -q update
RUN apt-get -q -y install build-essential curl git zlib1g-dev libssl-dev \
  libreadline-dev libyaml-dev libxml2-dev libxslt-dev
RUN apt-get -q clean

RUN git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git \
  $HOME/.rbenv/plugins/ruby-build
  
RUN echo 'eval "$(rbenv init -)"' >> $HOME/.profile
RUN echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc

RUN rbenv install 2.1.2
RUN rbenv global 2.1.2
