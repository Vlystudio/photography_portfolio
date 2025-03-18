# config/initializers/00_fix_logger.rb
require 'logger'

unless ActiveSupport::LoggerThreadSafeLevel.const_defined?(:Logger)
  ActiveSupport::LoggerThreadSafeLevel.const_set(:Logger, ::Logger)
end