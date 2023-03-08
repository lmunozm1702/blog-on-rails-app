require 'rails_helper'

RSpec.describe 'User Index Page', type: :system do
  describe 'User List Tests' do
    before(:each) do
      visit users_path
    end
    it 'shows the right page title' do
      expect(page).to have_content('Users List')
    end
    it 'shows Lilly, Luis and Tom' do
      expect(page).to have_content('Lilly')
      expect(page).to have_content('Luis')
      expect(page).to have_content('Tom')
    end
    it 'shows post count' do
      expect(page).to have_content(/Number of posts: \d+/i, minimum: 1)
    end
    it 'shows user images' do
      expect(page).to have_css('img', minimum: 4)
    end

    it 'link to user show page' do
      click_link('Tom')
      expect(current_path).to have_content('/users/2')
    end

    it 'link to new post page' do
      click_link('New Post', match: :first)
      expect(current_path).to have_content(%r{/users/\d+/posts/new})
      expect(page).to have_content('Create New Post')
    end
  end
end
