# frozen_string_literal: true

Rails.application.config.action_cable.url                     = "#{ENV["ACTION_CABLE_HOST"]}:#{ENV["ACTION_CABLE_PORT"]}"
Rails.application.config.action_cable.allowed_request_origins = ENV["ACTION_CABLE_ALLOWED_REQUEST_ORIGINS"].to_s.split(",").map { |url| /#{url}/ }
