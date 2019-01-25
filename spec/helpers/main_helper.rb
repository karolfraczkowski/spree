module MainHelper
  def login(email, password)
   visit '/login'

   fill_in 'spree_user_email', with: email
   fill_in 'spree_user_password', with: password

   click_button 'Login'
 end

 def add_item
   first('.product-list-item').click

   find('#add-to-cart-button').click
 end
end
