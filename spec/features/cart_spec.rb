feature 'cart' do
  before { visit '/' }

context 'Cart header' do

  scenario 'User can enter cart via header' do
    find('.cart-info').click
    byebug
    expect(page).to have_css('#content', text: 'Shopping Cart')
  end

  scenario 'Cart header icon is empty' do
    find('.cart-info').click

    expect(page).to have_css('.alert', text: 'Your cart is empty')
  end

  scenario 'Cart header icon is full' do

    expect(page).to have_no_css('.alert', text: 'Your cart is empty')
  end
end

context 'Cart buttons' do
#  before { add_item }
  scenario 'Continue shoping button' do
    add_item
    find('.btn-default').click

    expect(page.current_url).to eq "#{Capybara.app_host}/products"
  end
end

#scenario 'Empty cart button'
#scenario 'User can apply coupon code'
#scenario 'Invalid coupon code error'
#scenario 'User can remove item'
#scenario 'Logged in user can enter checkout'
#scenario 'Guest can enter registration form'
#scenario 'Quantity'
#cenario 'Price'
#scenario 'Total'
#scenario 'Total with adjustment'
end
