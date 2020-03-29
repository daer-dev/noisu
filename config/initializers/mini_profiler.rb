# frozen_string_literal: true

Rack::MiniProfiler.config.position = "bottom-right" unless ENV["RAILS_ENV"] == "test"
