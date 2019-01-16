describe 'links' do
  before { visit '/' }

  after { logout }

  context 'Header' do
    it 'Redirects to My Account' do
      login(ENV['USERNAME_SPREE'], ENV['PASSWORD_SPREE'])
      click_link 'My Account'

      expect(page).to have_css('h1', text: 'My Account')
    end

    it 'Check logo' do
      find('#logo').click

      expect(page.current_url).to eq "#{Capybara.app_host}/"
    end

    it 'Check home' do
      first('.product-list-item').click
      find('#home-link [href="/"]').click

      expect(page).to have_link(nil, href: '/')
    end

    it 'Check cart' do
      find('#link-to-cart [href="/cart"]').click

      expect(page.current_url).to eq "#{Capybara.app_host}/cart"
    end
  end

  context 'Other links' do
    it 'Check categories' do
      categories = all('.list-group-item').collect(&:text)
      categories.each do |category|
        click_link category

        expect(page).to have_css('.taxon-title', text: category)
      end
    end

    it 'Check next/last' do
      find('.next_page [href="/?page=2"]').click

      expect(page.current_url).to eq "#{Capybara.app_host}/?page=2"
    end
  end
end
