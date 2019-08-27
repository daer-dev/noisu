# frozen_string_literal: true

Rails.application.config.cache_store = :redis_store, ENV["REDIS_CACHE_URL"]
