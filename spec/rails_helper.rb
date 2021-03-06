# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
ENV['NEUNZIGT_MAIL'] ||= 'test@mail.de'
ENV['NEUNZIGT_HOST'] ||= 'test_host.de'

require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'spec_helper'
require 'rspec/rails'
require 'shoulda/matchers'
require 'capybara/rspec'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }
Dir[Rails.root.join('spec', '**', 'shared_examples', '**', '*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

# Create tmp/cache of not present
FileUtils.mkdir_p('tmp/cache')

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"


  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  config.include RSpec::Rails::RequestExampleGroup, type: :request, file_path: %r{spec\/api}

  config.before :each do
    Rails.cache.clear
  end

  config.after :each do
    ActionMailer::Base.deliveries.clear
  end
end
