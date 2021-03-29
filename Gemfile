source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"

gem "rails", "~> 6.1.3"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 5.0"
gem "turbolinks", "~> 5"
gem "bcrypt", "~> 3.1.7"
gem "httparty", "~> 0.18.1"
gem "octicons_helper", "~> 12.1"
gem "ahoy_matey"
gem "chartkick"
gem "groupdate"
gem "bootsnap", ">= 1.4.4", require: false
gem "pundit", "~> 2.1"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "rubocop", "~> 1.7"
  gem "rubocop-rspec", "~> 2.1"
  gem "rubocop-rails", "~> 2.9", ">= 2.9.1"
  gem "rspec-rails", "~> 4.0", ">= 4.0.2"
  gem "shoulda-matchers", "~> 4.4", ">= 4.4.1"
  gem "factory_bot_rails", "~> 6.1"
  gem "pundit-matchers", "~> 1.6"
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "rack-mini-profiler", "~> 2.0"
  gem "listen", "~> 3.3"
  gem "spring"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
