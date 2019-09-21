# frozen_string_literal: true

Rails.application.config.active_job.queue_adapter        = :sidekiq
Rails.application.config.active_job.queue_name_delimiter = ':'
Rails.application.config.active_job.queue_name_prefix    = "#{ENV['COMPOSE_PROJECT_NAME']}:#{Rails.env}"
