require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Don't reload code between requests.
  config.cache_classes = true

  # Eager load code on boot.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Ensure a master key is available if using encrypted credentials.
  # config.require_master_key = true

  # Serve static files only if RAILS_SERVE_STATIC_FILES is set.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # We disable the fallback to the asset pipeline because we rely on jsbundling-rails for JavaScript.
  config.assets.compile = false

  # (Optional) Remove or comment out asset_host if not needed.
  # config.asset_host = 'https://vlystudios.com'

  # Store uploaded files on the local file system (update if using cloud storage).
  config.active_storage.service = :local

  # Uncomment and configure if using Action Cable on a separate domain.
  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://vlystudios.com/cable'
  # config.action_cable.allowed_request_origins = [ 'http://vlystudios.com', /http:\/\/vlystudios.*/ ]

  # Force SSL in production if desired.
   config.force_ssl = true

  # Set the log level.
  config.log_level = :info

  # Prepend all log lines with request id.
  config.log_tags = [ :request_id ]

  # Use a different cache store if necessary.
  # config.cache_store = :mem_cache_store

  # Configure Action Mailer for SMTP delivery.
  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              "smtp.gmail.com",
    port:                 587,
    domain:               "vlystudios.com",
    user_name:            "valeyardvisuals@gmail.com",
    password:             ENV["GMAIL_PASSWORD"],  # Use an environment variable for the password
    authentication:       "plain",
    enable_starttls_auto: true
  }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { host: 'vlystudios.com' }

  # Enable locale fallbacks for I18n.
  config.i18n.fallbacks = true

  # Notify registered listeners about deprecation notices.
  config.active_support.deprecation = :notify

  # Log disallowed deprecations.
  config.active_support.disallowed_deprecation = :log
  config.active_support.disallowed_deprecation_warnings = []

  # Use the default logging formatter.
  config.log_formatter = ::Logger::Formatter.new

  # Log to STDOUT if RAILS_LOG_TO_STDOUT is set.
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump the schema after migrations.
  config.active_record.dump_schema_after_migration = false
end