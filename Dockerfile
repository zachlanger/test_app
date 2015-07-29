FROM ubuntu:14.04
MAINTAINER Zach Langer zlanger@comverge.com
RUN apt-get update
RUN apt-get install -y ruby
RUN apt-get install -y rails
RUN apt-get install -y openjdk-7-jdk
RUN apt-get install -y openssh-server
RUN apt-get install -y git
RUN apt-get install zlib1g-dev
RUN apt-get install ruby-dev
RUN apt-get install libsqlite3-dev

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mysql-client postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install

COPY create_ssh_link.sh /usr/src/app/
RUN bash create_ssh_link.sh
