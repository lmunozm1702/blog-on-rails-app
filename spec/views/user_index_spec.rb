require 'rails_helper'

RSpec.describe 'User Index Page', type: :system do
  describe 'user index page' do
    before(:each) do
      visit users_path
    end
    it 'shows the right content' do
      expect(page).to have_content('Number of posts')
    end
    it 'shows Lilly, Luis and Tom' do
      expect(page).to have_content('Lilly')
      expect(page).to have_content('Luis')
      expect(page).to have_content('Tom')
    end
    it 'shows post count' do
      expect(page).to have_content('Number of posts: 0').twice
      expect(page).to have_content('Number of posts: 10')
      expect(page).to have_content('Number of posts: 9')
    end
    it 'shows user images' do
      expect(page).to have_css('img', minimum: 4)
    end

    it 'link to user show page' do
      click_link('Tom')
      expect(current_path).to have_content('/users/2')
    end
  end
end
