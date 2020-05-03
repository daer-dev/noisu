FROM ruby:2.6.3-alpine

MAINTAINER Daniel Herrero <daniel.herrero.101@gmail.com>

# Installs all the system's dependencies:
#   - Libxml & Libxslt: Nokogiri gem.
#   - Yarn, NodeJS & Gcompat: Webpack.
#   - Tzdata & Postgresql-dev: Rails gems.
RUN apk add --update --no-cache \
      build-base \
      libxml2-dev \
      libxslt-dev \
      tzdata \
      bash \
      yarn \
      nodejs \
      gcompat \
      postgresql-dev \
    && rm -rf /var/cache/apk/*

# Creates the project's main path and sets it as the current directory.
ENV     INSTALL_PATH /noisu
RUN     mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

# Updates the gem system to avoid incompatibilities with the defined Ruby version and installs all the gems.
COPY Gemfile Gemfile.lock ./
RUN  gem update --system && gem install bundler
RUN  bundle install

COPY . .

CMD RAILS_ENV=production rails assets:precompile

CMD puma -C config/puma.rb
