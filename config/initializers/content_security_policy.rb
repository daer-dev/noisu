Rails.application.config.content_security_policy do |policy|
  # Needed to allow connections to "webpack-dev-server" running in a separate Docker container.
  if Rails.env.development?
    policy.connect_src :self, :https, "http://localhost:#{ENV['WEBPACK_PORT']}",
                                      "ws://localhost:#{ENV['WEBPACK_PORT']}",
                                      "http://0.0.0.0:#{ENV['WEBPACK_PORT']}",
                                      "ws://0.0.0.0:#{ENV['WEBPACK_PORT']}",
                                      "http://localhost:#{ENV['ACTION_CABLE_PORT']}",
                                      "ws://localhost:#{ENV['ACTION_CABLE_PORT']}",
                                      "http://0.0.0.0:#{ENV['ACTION_CABLE_PORT']}",
                                      "ws://0.0.0.0:#{ENV['ACTION_CABLE_PORT']}"
  end
end
