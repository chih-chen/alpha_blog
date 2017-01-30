ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
  # simulating user log in
  def sign_in(user,password)
    #post to login path - which is the session create action
    # passing the params to log in
    post login_path, session: {email: user.email, password: password}
  end
  
end
