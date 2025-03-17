# config/initializers/fix_logger.rb
require 'logger'

# Ensure that ActiveSupport::LoggerThreadSafeLevel has the Logger constant defined.
unless ActiveSupport::LoggerThreadSafeLevel.const_defined?(:Logger)
  ActiveSupport::LoggerThreadSafeLevel.const_set(:Logger, ::Logger)
end