require_relative 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  Capybara.configure do |config|
    config.server_host = 'localhost'
    config.server_port = '3000'
  end
end
