require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Allow Cloud9 host
  config.hosts << "f976fbe88a5146b38972e8b5896b638f.vfs.cloud9.us-east-2.amazonaws.com"

  # Reload code on every request.
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system
  config.active_storage.service = :local
  config.active_storage.analyzers = []

  # Configure Action Mailer for SMTP delivery using Gmail.
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              "smtp.gmail.com",
    port:                 587,
    domain:               "gmail.com",
    user_name:            "valeyardvisuals@gmail.com",  # Corrected email address
    password:             ENV["GMAIL_PASSWORD"],       # Make sure this env variable is set
    authentication:       "plain",
    enable_starttls_auto: true
  }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { host: 'localhost', port: 8080 }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  config.assets.debug = true
  config.assets.quiet = true

  # Use an evented file watcher to asynchronously detect changes in source code.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
