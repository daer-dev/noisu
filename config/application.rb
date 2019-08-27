# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems you've limited to any group name.
Bundler.require(*Rails.groups)

module Noisu
  class Application < Rails::Application
    # Settings in "config/environments/*" take precedence over those specified here.
    # The general app configuration is splitted in initializers.
  end
end
