require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Noisu
  class Application < Rails::Application
    # Log to STDOUT because Docker expects all processes to log here. You could then redirect logs to
    # a third party service on your own such as systemd or a third party host.
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.log_tags  = [ :subdomain, :uuid ]
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
    config.log_level = ENV['LOG_LEVEL']

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    config.action_mailer.delivery_method     = :smtp
    config.action_mailer.smtp_settings       = {
      address:              ENV['SMTP_ADDRESS'],
      port:                 ENV['SMTP_PORT'].to_i,
      domain:               ENV['SMTP_DOMAIN'],
      user_name:            ENV['SMTP_USERNAME'],
      password:             ENV['SMTP_PASSWORD'],
      authentication:       ENV['SMTP_AUTH'],
      enable_starttls_auto: ENV['SMTP_ENABLE_STARTTLS_AUTO'] == 'true'
    }
    config.action_mailer.default_url_options = {
      host: ENV['ACTION_MAILER_HOST']
    }
    config.action_mailer.default_options     = {
      from: ENV['ACTION_MAILER_DEFAULT_FROM']
    }

    config.cache_store = :redis_store, ENV['REDIS_CACHE_URL']

    config.active_job.queue_adapter     = :sidekiq
    config.active_job.queue_name_prefix = "#{ENV['ACTIVE_JOB_QUEUE_PREFIX']}_#{Rails.env}"

    config.action_cable.url                     = ENV['ACTION_CABLE_FRONTEND_URL']
    config.action_cable.allowed_request_origins = ENV['ACTION_CABLE_ALLOWED_REQUEST_ORIGINS'].split(',').map{ |url| /#{url}/ }
  end
end
