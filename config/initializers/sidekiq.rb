# frozen_string_literal: true

redis_url    = "redis://:#{ENV["REDIS_PASSWORD"]}@#{ENV["REDIS_HOST"]}:#{ENV["REDIS_PORT"]}/#{ENV["REDIS_NAMESPACE"]}"
redis_config = { url: redis_url }

Sidekiq.configure_server do |config|
  config.redis = redis_config
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end
