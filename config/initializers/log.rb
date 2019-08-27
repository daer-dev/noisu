# frozen_string_literal: true

# Log to STDOUT because Docker expects all processes to log here.
# You could then redirect logs to a third party service on your own such as systemd or a third party host.

logger           = ActiveSupport::Logger.new(STDOUT)
logger.formatter = Rails.application.config.log_formatter

Rails.application.config.log_tags  = [ :subdomain, :uuid ]
Rails.application.config.logger    = ActiveSupport::TaggedLogging.new(logger)
Rails.application.config.log_level = ENV["LOG_LEVEL"]

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [
                                                :password,
                                                :confirm_password
                                              ]
