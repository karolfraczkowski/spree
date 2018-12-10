describe 'links' do
  before do
    visit '/'
  end

  context 'header' do
    before do
      find('#link-to-login').click

      fill_in 'spree_user_email', with: 'karol.fraczkowski@sparksolutions.co'
      fill_in 'spree_user_password', with: '1234567890'

      find('.btn.btn-lg').click
     end

     after do
       visit '/logout'
     end

     context 'login/logout' do
       it 'check search' do
         find('.btn-success').click
         sleep 2
         expect(page.current_url).to eq ("https://karol-spree.herokuapp.com/products?utf8=%E2%9C%93&taxon=&keywords=")
       end

       it 'check spree' do
         find('#logo [href="/"]').click
         expect(page.current_url).to eq "#{Capybara.app_host}/"
       end

       it 'check home' do
         find('.info', text: 'Ruby on Rails Tote').click
         find('#home-link [href="/"]').click
         expect(page).to have_link(nil, href: '/')
       end

       it 'user can login' do
         expect(page).to have_css('.navbar-right', text: 'My Account')
       end
     end

     it 'click my account' do
       find('#nav-bar [href="/account"]').click
       expect(page).to have_css('h1', text: /My Account/i)
     end

     it 'check cart' do
       find('#link-to-cart [href="/cart"]').click
       expect(page.current_url).to eq ("https://karol-spree.herokuapp.com/cart")
     end

   context 'pagination' do
     it 'check next' do
       find(:xpath, '//*[@id="content"]/div/ul/li[@class="next_page"]/a').click
       expect(page.current_url).to eq "#{Capybara.app_host}/#{'?page=2'}"
     end

       xit 'check last'
     end

     context 'categories' do
       xit 'check bags'
       xit 'check mugs'
       xit 'check clothing'
     end
     context 'brands' do
       xit 'check ruby'
       xit 'check apache'
       xit 'check spree'
       xit 'check rails'
     end
   end
 end
