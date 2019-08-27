# frozen_string_literal: true

#  Disables a lot of unnecessary checkups on Yarn.
Rails.application.config.webpacker.check_yarn_integrity = false

# Code is not reloaded between requests.
Rails.application.config.cache_classes = true

# Eager load code on boot. This eager loads most of Rails and the application in memory,
# allowing both threaded web servers and those relying on copy on write to perform better.
# Rake tasks automatically ignore this option for performance.
Rails.application.config.eager_load = true

# Full error reports are disabled and caching is turned on.
Rails.application.config.consider_all_requests_local       = false
Rails.application.config.action_controller.perform_caching = true

# Disable serving static files from the `/public` folder by default since
# Apache or Nginx already handles this.
Rails.application.config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

# Compress JavaScripts and CSS.
Rails.application.config.assets.js_compressor  = :uglifier
Rails.application.config.assets.css_compressor = :sass

# Do not fallback to assets pipeline if a precompiled asset is missed.
Rails.application.config.assets.compile = false

# Specifies the header that your server uses for sending files.
# Rails.application.config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache.
# Rails.application.config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for Nginx.

# Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
Rails.application.config.force_ssl = true

Rails.application.config.action_mailer.perform_caching = false

# Ignore bad email addresses and do not raise email delivery errors.
# Set this to true and Rails.application.configure the email server for immediate delivery to
# raise delivery errors.
# Rails.application.config.action_mailer.raise_delivery_errors = false

# Makes lookups for any locale fallback to the default locale when a translation cannot be found.
Rails.application.config.i18n.fallbacks = [ I18n.default_locale ]

# Send deprecation notices to registered listeners.
Rails.application.config.active_support.deprecation = :notify

# Use default logging formatter so that PID and timestamp are not suppressed.
Rails.application.config.log_formatter = ::Logger::Formatter.new

# Do not dump schema after migrations.
Rails.application.config.active_record.dump_schema_after_migration = false
