source 'https://rubygems.org'

gem 'rails', '4.2.10'

gem 'pg'

gem 'devise', '3.5.6'
gem 'faker'
gem 'figaro'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'json', '~> 1.8.5' # Required for Ruby 2.4+
gem 'puma'
gem 'rack-timeout'
gem 'sass-rails', '~> 5.0'
gem 'twitter-bootstrap-rails'
gem 'uglifier', '>= 1.3.0'

# Angular gems
# gem 'angularjs-rails', '1.4.8'
gem 'angular_rails_csrf'
gem 'angular-rails-templates'

source "https://rails-assets.org" do
  gem 'rails-assets-angular-devise'
end

group :development, :test do
  gem 'letter_opener'
  gem 'pry-rails'
  gem 'factory_bot_rails'
  gem 'spring'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-rspec', require: false
  gem 'meta_request'
  gem 'web-console', '~> 2.0'
end

group :production do
  gem "rails_12factor"
end

group :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'shoulda-matchers', '~> 3.0'
  gem 'shoulda-callback-matchers', '~> 1.1.1'
end
