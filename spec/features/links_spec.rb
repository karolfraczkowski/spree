describe 'links' do
  before do
    visit '/'
  end

  context 'header' do
    before do
      find('#link-to-login').click

      fill_in 'spree_user_email', with: ENV['USERNAME_SPREE']
      fill_in 'spree_user_password', with: ENV['PASSWORD_SPREE']

      find('.btn.btn-lg').click
    end

    after do
      visit '/logout'
    end

    context 'login/logout' do
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
      expect(page.current_url).to eq "#{Capybara.app_host}/#{'cart'}"
    end
  end

  context 'categories' do
    it 'check bags' do
      find('.list-group-item', text: 'Bags').click
      expect(page.current_url).to eq "#{Capybara.app_host}/#{'t/bags'}"
    end

    it 'check mugs' do
      find('.list-group-item', text: 'Mugs').click
      expect(page.current_url).to eq "#{Capybara.app_host}/#{'t/mugs'}"
    end

    it 'check clothing' do
      find('.list-group-item', text: 'Clothing').click
      expect(page.current_url).to eq "#{Capybara.app_host}/#{'t/clothing'}"
    end
  end

  context 'brands/pagination' do
    it 'check ruby' do
      find('.list-group-item', text: 'Ruby').click
      expect(page.current_url).to eq "#{Capybara.app_host}/#{'t/ruby'}"
    end

    it 'check apache' do
      find('.list-group-item', text: 'Apache').click
      expect(page.current_url).to eq "#{Capybara.app_host}/#{'t/apache'}"
    end

    it 'check spree' do
      find('.list-group-item', text: 'Spree').click
      expect(page.current_url).to eq "#{Capybara.app_host}/#{'t/spree'}"
    end

    it 'check rails' do
      find('.list-group-item', text: 'Rails').click
      expect(page.current_url).to eq "#{Capybara.app_host}/#{'t/rails'}"
    end

    it 'check next/last' do
      find(:xpath, '//*[@id="content"]/div/ul/li[@class="next_page"]/a').click
      expect(page.current_url).to eq "#{Capybara.app_host}/#{'?page=2'}"
    end
  end
end
