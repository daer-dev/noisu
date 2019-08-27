# frozen_string_literal: true

Rails.application.config.active_job.queue_adapter     = :sidekiq
Rails.application.config.active_job.queue_name_prefix = "#{ENV['ACTIVE_JOB_QUEUE_PREFIX']}_#{Rails.env}"
