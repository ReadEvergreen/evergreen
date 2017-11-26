source 'https://rubygems.org'

gem 'rails', '4.2.10'

gem 'pg'

gem 'devise'
gem 'faker'
gem 'figaro'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'json', '~> 1.8.5' # Required for Ruby 2.4+
gem 'sass-rails', '~> 5.0'
# gem 'sdoc', '~> 0.4.0', group: :doc
gem 'twitter-bootstrap-rails'
gem 'uglifier', '>= 1.3.0'

# Angular gems
gem 'angularjs-rails'
gem 'angular_rails_csrf'
gem 'angular-rails-templates'

source "https://rails-assets.org" do
  gem 'rails-assets-angular-devise'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'letter_opener'
  gem 'spring'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-rspec', require: false
  gem 'pry-rails'
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
