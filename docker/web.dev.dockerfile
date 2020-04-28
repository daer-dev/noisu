FROM ruby:2.6.3-alpine

MAINTAINER Daniel Herrero <daniel.herrero.101@gmail.com>

# Installs all the system's dependencies:
#   - Git, SSH & Vim: Git's use, needed inside the container due to Overcommit. Less for colored diffs.
#   - Libxml & Libxslt: Nokogiri gem.
#   - Yarn, NodeJS & Gcompat: Webpack.
#   - Tzdata & Postgresql-dev: Rails gems.
RUN apk add --update --no-cache \
      build-base \
      git \
      less \
      openssh \
      vim \
      libxml2-dev \
      libxslt-dev \
      tzdata \
      bash \
      yarn \
      nodejs \
      gcompat \
      postgresql-dev \
    && rm -rf /var/cache/apk/*

# Scripts available in the container startup.
COPY docker/scripts/aliases.sh /etc/profile.d/aliases.sh
COPY docker/scripts/config-git.sh /etc/profile.d/config-git.sh
COPY docker/scripts/bin-to-path.sh /etc/profile.d/bin-to-path.sh

# Creates the project's main path and sets it as the current directory.
ENV     INSTALL_PATH /noisu
RUN     mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

# Updates the gem system to avoid incompatibilities with the defined Ruby version and installs all the gems.
COPY Gemfile Gemfile.lock ./
RUN  gem update --system && gem install bundler
RUN  bundle install

COPY . .

RUN chmod 777 docker/scripts/*.sh bin/webpack-dev-server

CMD puma -C config/puma.rb
