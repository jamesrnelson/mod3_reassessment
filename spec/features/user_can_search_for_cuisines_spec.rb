require 'rails_helper'

describe 'User' do
  context 'enters Denver in the search' do
    it 'should send back information about cuisines and restaurants', vcr: true do
      visit root_path
      # As a user
      # When I visit "/"
      fill_in :search, with: 'Denver'
      click_on 'Search'
      # And I fill in a search box with "Denver" and click "search"
      expect(current_path).to eq('/search')
      # Then my current path should be "/search" (ignoring params)
      expect(page).to have_css('.cuisine', count: 5)
      expect(page).to have_css('.restaurant', count: 5)
      # And I should see the top 5 cuisines of Denver.
      # And I should see the top 5 restaurants of Denver
      expect(page).to have_css('.name', count: 5)
      expect(page).to have_css('.address', count: 5)
      expect(page).to have_css('.locality', count: 5)
      # And I should see the name, address and locality, for each of the 5 restaurants
      # *BOSS MODE* when I click page 2,
      # I should see the remaining 5 restaurants.
    end
  end
end
