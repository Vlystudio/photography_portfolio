require 'logger'  # Ensure the built-in Logger class is loaded

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)
require 'bundler/setup'  # Set up gems listed in the Gemfile.

# Optionally, comment out Bootsnap for debugging:
# require 'bootsnap/setup'  # Speed up boot time by caching expensive operations.
