# frozen_string_literal: true

# As the code isn't expected to change in the test env, it's better to cache it.
Rails.application.config.cache_classes = true

# Do not eager load code on boot. This avoids loading your whole application just for the purpose of running a single test.
# In case of using a tool that preloads Rails for running tests, it has to be set to true.
Rails.application.config.eager_load = false

# Configure public file server for tests with Cache-Control for performance.
Rails.application.config.public_file_server.enabled = true
Rails.application.config.public_file_server.headers = {
  "Cache-Control" => "public, max-age=3600"
}

# Show full error reports and disable caching.
Rails.application.config.consider_all_requests_local       = true
Rails.application.config.action_controller.perform_caching = false

# Raise exceptions instead of rendering exception templates.
Rails.application.config.action_dispatch.show_exceptions = false

# Disable request forgery protection in test environment.
Rails.application.config.action_controller.allow_forgery_protection = false

Rails.application.config.action_mailer.perform_caching = false

# Tells ActionMailer not to deliver emails to the real world.
# The :test delivery method accumulates sent emails in the ActionMailer::Base.deliveries array.
Rails.application.config.action_mailer.delivery_method = :test

# Print deprecation notices to the "stderr".
Rails.application.config.active_support.deprecation = :stderr

# Raises error for missing translations.
Rails.application.config.action_view.raise_on_missing_translations = true
