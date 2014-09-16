FROM ubuntu:trusty
MAINTAINER Andy Shinn <andy@polleverywhere.com>

RUN locale-gen en_US.UTF-8

ENV HOME /root
ENV PATH $HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH
ENV SHELL /bin/bash
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get -q update \
  && DEBIAN_FRONTEND=noninteractive apt-get -q -y install \
  git \
  curl \
  autoconf \
  bison \
  build-essential \
  libssl-dev \
  libyaml-dev \
  libreadline6-dev \
  zlib1g \
  zlib1g-dev \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone --quiet --depth 1 https://github.com/sstephenson/rbenv.git \
  $HOME/.rbenv
RUN git clone --quiet --depth 1 https://github.com/sstephenson/ruby-build.git \
  $HOME/.rbenv/plugins/ruby-build

RUN echo 'eval "$(rbenv init -)"' >> $HOME/.profile
RUN echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc
