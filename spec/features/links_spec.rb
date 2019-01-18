feature 'links' do
  before { visit '/' }

  after { logout }

  context 'Header' do
    scenario 'Redirects to My Account' do
      login(ENV['USERNAME_SPREE'], ENV['PASSWORD_SPREE'])
      click_link 'My Account'

      expect(page.current_url).to eq "#{Capybara.app_host}/account"
    end

    scenario 'Check logo' do
      find('#logo').click

      expect(page.current_url).to eq "#{Capybara.app_host}/"
    end

    scenario 'Check home' do
      first('.product-list-item').click
      find('#home-link').click_link

      expect(page.current_url).to eq "#{Capybara.app_host}/"
    end

    scenario 'Check cart' do
      find('#link-to-cart').click

      expect(page.current_url).to eq "#{Capybara.app_host}/cart"
    end
  end

  context 'Other links' do
    scenario 'Check categories' do
      categories = all('.list-group-item').collect(&:text)
      categories.each do |category|
        click_link category

        expect(page).to have_css('.taxon-title', text: category)

        expect(page.current_url).to eq "#{Capybara.app_host}/t/#{category.downcase}"
      end
    end

    scenario 'Check next/last' do
      find('.next_page [href="/?page=2"]').click

      expect(page.current_url).to eq "#{Capybara.app_host}/?page=2"
    end
  end
end
