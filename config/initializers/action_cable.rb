# frozen_string_literal: true

Rails.application.config.action_cable.url                     = ENV["ACTION_CABLE_FRONTEND_URL"]
Rails.application.config.action_cable.allowed_request_origins = ENV["ACTION_CABLE_ALLOWED_REQUEST_ORIGINS"].split(",").map { |url| /#{url}/ }
