Rails.application.configure do
  # As the code isn't expected to change in the test env, it's better to cache it.
  config.cache_classes = true

  # Do not eager load code on boot. This avoids loading your whole application just for the purpose of running a single test.
  # In case of using a tool that preloads Rails for running tests, it has to be set to true.
  config.eager_load = false

  # Configure public file server for tests with Cache-Control for performance.
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => 'public, max-age=3600'
  }

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false
  config.action_mailer.perform_caching = false

  # Tells ActionMailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the "stderr".
  config.active_support.deprecation = :stderr

  # Raises error for missing translations.
  config.action_view.raise_on_missing_translations = true
end
