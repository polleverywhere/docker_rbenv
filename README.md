# Docker rbenv

An Ubuntu 14.04 image with `rbenv` pre-installed. It is designed to be used as a base for building Ruby images.

We try to keep this image small as it is generally used as a base image. Thus, we don't install any build dependencies. You will need to install build tools when using this in your Ruby image.

A `Dockerfile` using this image to build Ruby 2.1.3 might like:

```
FROM polleverywhere/rbenv

ENV RUBY_VERSION 2.1.3

RUN apt-get update -q \
  && apt-get -q -y install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev \
  && rbenv install $RUBY_VERSION \
  && rbenv global $RUBY_VERSION \
  && apt-get purge -y -q autoconf bison build-essential libssl-dev zlib1g-dev \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists

RUN gem install --no-ri --no-rdoc bundler
RUN rbenv rehash
```
