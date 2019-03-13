# frozen_string_literal: true

source "https://rubygems.org"

gem "rails",                "5.0.7"
gem "puma",                 "3.7.1"
gem "jbuilder",             "2.7.0"
gem "pg",                   "0.21.0"
gem "redis-rails",          "5.0.2"
gem "sidekiq",              "4.2.10"
gem "sassc",                "2.0.1"
gem "uglifier",             "4.1.19"
gem "turbolinks",           "5.2.0"
gem "haml-rails",           "1.0.0"
gem "friendly_id",          "5.2.4"
gem "webpacker",            "3.5.5"
gem "rubocop",              "0.65.0", require: false
gem "rubocop-rails_config", "0.4.3"
gem "overcommit",           "0.46.0"
gem "bundler-audit",        "0.6.1"
gem "fasterer",             "0.5.0"

group :development, :test do
  gem "byebug", platform: :mri
end

group :development do
  gem "rack-mini-profiler"     #  Alt+P to disable it.
  gem "stackprof"
  gem "memory_profiler"        #  "?pp=profile-memory" in the URL for more info.
  gem "flamegraph"             #  "?pp=flamegraph" in the URL for more info.
  gem "pry-rails"              #  "binding.pry" as a breakpoint in code. "disable-pry" in the CLI to skip all breakpoints.
  gem "pry-remote"
  gem "pry-nav"
  gem "spring"
  gem "spring-watcher-listen"
end
