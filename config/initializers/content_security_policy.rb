Rails.application.config.content_security_policy do |p|
  # Needed to allow connections to "webpack-dev-server" running in a separate Docker container.
  if Rails.env.development?
    p.connect_src :self, :https, 'http://localhost:3035',
                                 'ws://localhost:3035',
                                 'http://0.0.0.0:3035',
                                 'ws://0.0.0.0:3035'
  end
end
