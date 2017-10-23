# https://hub.docker.com/_/ruby/
FROM ruby:2.4.1

MAINTAINER Daniel Herrero <daniel.herrero.101@gmail.com>

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential \
      nodejs \
      libpq-dev

ENV INSTALL_PATH /noisu

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./

RUN bundle install --binstubs

COPY . .

VOLUME ["$INSTALL_PATH/public"]

CMD puma -C config/puma.rb
