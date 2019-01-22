feature 'registration' do
  let(:email)     { Faker::Internet.unique.email }
  let(:password1) { '1234567890' }
  let(:password2) { '987654321' }

  context 'signup form' do
    before { visit '/' }

    scenario 'User registration' do
      signup(email, password1, password1)

      expect(page).to have_css('.alert')
      logout
    end

    scenario 'Registration email has already been taken' do
      signup(ENV['USERNAME_SPREE'], password1, password1)

      expect(page).to have_css('#errorExplanation')
    end

    scenario 'Password invalid input' do
      signup(email, password1, password2)

      text = find('.alert-danger').text

      expect(text).to include "Password Confirmation doesn't match Password"
    end

    scenario 'Signup to Login as Existing Customer' do
      visit '/signup'
      click_link 'Login as Existing Customer'

      expect(page.current_url).to eq "#{Capybara.app_host}/login"
    end

    scenario 'New customer title' do
      visit '/signup'

      expect(page).to have_css('.panel-title')
    end
  end

  context 'login form' do
    before { visit '/login' }

    scenario 'Create a new account button' do
      click_link 'Create a new account'

      expect(page.current_url).to eq "#{Capybara.app_host}/signup"
    end

    scenario 'Login as Existing Customer title' do
      expect(page).to have_css('.panel-title')
    end

    scenario 'Forgot Password?' do
      click_link 'Forgot Password?'

      expect(page.current_url).to eq "#{Capybara.app_host}/password/recover"
    end

    scenario 'Forgot Password? title' do
      expect(page).to have_css('.panel-title')
    end

    scenario 'Remember me' do
      find("#spree_user_remember_me[value='1']").set(true)

      fill_in_credenntials('karol.fraczkowski@sparksolutions.co', password1)
      click_button 'Login'
      expire_cookies
      refresh

      expect(page).to have_css('#nav-bar', text: 'Logout')
    end

    scenario 'Login invalid input' do
      login(email, password2)

      text = find('.alert-error').text

      expect(text).to include 'Invalid email or password.'
    end
  end
end
