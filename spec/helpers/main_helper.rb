module MainHelper
  def login(email, password)
    visit '/login'

    fill_in 'spree_user_email', with: email
    fill_in 'spree_user_password', with: password

    click_button 'Login'
  end

  def fill_in_credenntials(email, password)
   fill_in 'spree_user_email', with: email
   fill_in 'spree_user_password', with: password
  end

  def logout
    visit '/logout'
  end

  def signup(email, password, password_confirmation)
    visit '/signup'

    fill_in_credenntials(email, password)
    fill_in 'spree_user_password_confirmation', with: password_confirmation

    click_button 'Create'
  end

  def wait_for(seconds = 5)
    begin
      Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
    rescue Selenium::WebDriver::Error::TimeOutError
      false
    end
  end
end
