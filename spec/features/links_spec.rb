describe 'links' do
    before (:each) do
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

       find('.navbar-right [href="/logout"]').click
    end
     context 'login/logout' do
      it 'user can login' do
        expect(page).to have_css('.navbar-right', text: 'My Account')
      end
     byebug
      it 'click my account' do
        find('#nav-bar [href="/account"]').click
      expect(page).to have_css('h1', text: /My Account/i)
      end

    xit 'check home'
    xit 'check spree'
    xit 'check cart'
    xit 'check search'
   end

  context 'pagination' do
    xit 'check next'
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
