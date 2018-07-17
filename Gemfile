source 'https://rubygems.org'
ruby "2.5.1"

gem 'rails',        '5.1.4'
gem 'devise', '~> 4.4', '>= 4.4.3'
gem 'activeadmin', '~> 1.3'      #for admin dashboard
gem "paperclip", "~> 6.0.0"      #for uploading photos
gem 'bootstrap-sass', '3.3.7'   
gem 'country_select'
gem 'bcrypt',       '3.1.12'
gem 'faker',          '1.7.3'
gem 'puma',         '3.9.1'
gem 'sass-rails',   '5.0.6'
gem 'uglifier',     '3.2.0'
gem 'coffee-rails', '4.2.2'
gem 'jquery-rails', '4.3.1'
gem 'jbuilder',     '2.7.0'
gem 'carrierwave', '~> 0.11.2'

group :development, :test do
  gem 'sqlite3', '1.3.13'
  gem 'byebug',  '9.0.6', platform: :mri       #for checking and debugging the code
  gem 'awesome_print'                          #for awesome printing the results in the rails console
end

group :development do
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'rails-controller-testing', '1.0.2'
  gem 'minitest',                 '5.10.3'
  gem 'minitest-reporters',       '1.1.14'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

group :production do
  gem 'pg', '0.18.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]