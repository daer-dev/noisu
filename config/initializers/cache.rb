# frozen_string_literal: true

redis_cache_url = "redis://:#{ENV["REDIS_PASSWORD"]}@#{ENV["REDIS_HOST"]}:#{ENV["REDIS_PORT"]}/#{ENV["REDIS_NAMESPACE"]}/cache"

Rails.application.config.cache_store = :redis_store, redis_cache_url
