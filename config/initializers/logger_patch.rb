# config/initializers/logger_patch.rb
unless defined?(ActiveSupport::LoggerThreadSafeLevel::Logger)
  ActiveSupport::LoggerThreadSafeLevel.const_set(:Logger, ::Logger)
end
