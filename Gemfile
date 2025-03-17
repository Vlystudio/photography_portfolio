source 'https://rubygems.org'

ruby '3.1.2'

# Upgrade to Rails 7 – you can choose a patch level as needed
gem 'rails', '~> 7.0.4'

# Use SQLite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'

# Use bcrypt for secure passwords
gem 'bcrypt', '~> 3.1.7'

# Use Puma as the app server
gem 'puma', '~> 5.0'

# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'

# Build JSON APIs with ease
gem 'jbuilder', '~> 2.7'

# Use Active Storage variant for image processing
gem 'image_processing', '~> 1.2'

# Speed up boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Rails 7 now defaults to importmap-rails (or jsbundling-rails if you prefer a JS bundler)
# Uncomment one of the following as needed:
# gem 'importmap-rails'
# gem 'jsbundling-rails', '~> 1.3'

group :development, :test do
  # Debugging tool
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Interactive console on exception pages
  gem 'web-console', '>= 4.1.0'
  # File watcher for asynchronous detection of changes
  gem 'listen', '~> 3.3'
  # Speeds up development by keeping your app running in the background
  gem 'spring'
end

group :test do
  # Support for system testing with Capybara and Selenium
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
end

# Windows does not include zoneinfo files
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]