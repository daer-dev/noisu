FROM ruby:2.6.1-alpine

ARG precompile_assets

MAINTAINER Daniel Herrero <daniel.herrero.101@gmail.com>

RUN apk add --update --no-cache \
      build-base \
      libxml2-dev \
      libxslt-dev \
      tzdata \
      bash \
      yarn \
      nodejs \
      postgresql-dev \
    && rm -rf /var/cache/apk/*

ENV INSTALL_PATH /noisu

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./

RUN gem update --system && gem install bundler
RUN bundle install --binstubs

COPY . .

VOLUME ["$INSTALL_PATH/public"]

CMD chmod 777 scripts/*.sh bin/webpack-dev-server

CMD scripts/potential-assets-precompile.sh $precompile_assets

CMD puma -C config/puma.rb
