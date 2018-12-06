describe 'links' do
    before :all do
      visit '/'
    end

  context 'header' do
    it 'check login' do
      byebug
      click_link ('')
    end
    xit 'check my account'
    xit 'check logout'
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

end
