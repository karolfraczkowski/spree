module MainHelper

  def login(email, password)
    visit '/login'

    fill_in 'spree_user_email', with: email
    fill_in 'spree_user_password', with: password

    click_button 'Login'
        #find('.btn.btn-lg').click
  end

  def logout
    visit '/logout'
  end
end
