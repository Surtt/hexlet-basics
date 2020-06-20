# frozen_string_literal: true

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]

  def sign_in_as(name)
    user = users(name)

    visit new_session_url
    email_element = find('[type="email"]')
    password_element = find('[type="password"]')
    log_in_element = find('[type="submit"]')

    email_element.fill_in with: user.email
    password_element.fill_in with: 'password'
    log_in_element.click
  end
end
