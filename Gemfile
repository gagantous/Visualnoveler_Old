source 'https://rubygems.org'

gem 'rails', '4.2.4'
gem 'bootstrap-sass', '~> 3.3.5.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'twitter-typeahead-rails'
gem 'bootstrap-social-rails'
gem 'bootstrap-select-wrapper-rails'
gem 'fancybox2-rails', '~> 0.2.8'
gem 'friendly_id', '~> 5.1.0'
gem 'simple_form'
gem 'enum_help'
gem 'will_paginate', '~> 3.0.6'
gem 'will_paginate-bootstrap'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem "gibbon"
gem 'nprogress-rails'
gem 'pg_search'
gem 'acts-as-taggable-on', '~> 3.4'
#image & attachments 
gem 'carrierwave'
gem 'carrierwave-crop'
gem 'file_validators'
gem "mini_magick"
gem 'remotipart', git: 'https://github.com/JangoSteve/remotipart.git',branch: 'master'
#announcements
gem "starburst"
gem "html_truncator", "~>0.2"
gem "truncate_html"
# authentication
gem 'devise'
gem "pundit"
#omniauth
gem 'omniauth'
gem 'omniauth-oauth2', '~> 1.3.1'
gem 'omniauth-facebook'
gem "omniauth-google-oauth2"
gem 'omniauth-twitter'
#API
gem 'active_model_serializers'
#cloud
gem "fog"

#table
gem 'best_in_place', '~> 3.0.1'

gem "font-awesome-rails"
gem 'spring',        group: :development
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 2.0'
gem "cocoon"
gem 'dotenv-rails', :groups => [:development]
gem 'sitemap_generator'
gem 'whenever', require: false
# gem 'bcrypt', '~> 3.1.7'

#scraping
gem 'mechanize'
gem 'nokogiri'

#markdown
gem 'redcarpet'
# Use Unicorn as the app server

group :development do
	gem 'sqlite3'
	gem 'spring-commands-rspec', group: :development
	gem "guard-livereload",  :require => false
	gem "guard", ">= 2.2.2", :require => false
	gem "rack-livereload"
end

group :production do
	gem 'unicorn'
	gem 'pg'
	gem 'rails_12factor'
end

group :test do
	gem 'capybara'
	gem 'database_cleaner'
	gem 'launchy'
	gem 'selenium-webdriver'
	gem 'shoulda-matchers', '~> 3.1'
end

group :development, :test do
	gem 'factory_girl_rails'
	gem 'faker'
	gem 'rspec-rails', '~> 3.5', :require => false
end