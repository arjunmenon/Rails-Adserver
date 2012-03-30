ENV["RAILS_ENV"] = "test"
require "rails_app/config/environment"
require "rails/test_help"
require "minitest/autorun"
require "capybara/rails"
require "active_support/testing/setup_and_teardown"
require 'factory_girl_rails' 

class IntegrationTest < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  include Factory::Syntax::Methods
  include Devise::TestHelpers
  include Warden::Test::Helpers
  Warden.test_mode!
  register_spec_type(/integration$/, self)
end

class HelperTest < MiniTest::Spec
  include ActiveSupport::Testing::SetupAndTeardown
  include ActionView::TestCase::Behavior
  include Factory::Syntax::Methods
  include Devise::TestHelpers
  include Warden::Test::Helpers
  Warden.test_mode!
  register_spec_type(/Helper$/, self)
end