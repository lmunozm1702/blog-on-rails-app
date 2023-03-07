require 'rails_helper'

RSpec.describe 'User Show Page', type: :system do
  describe 'User List Tests' do
    before(:each) do
      visit user_path(2)
    end

    it 'shows the user profile picture' do
      expect(page).to have_css('img')
    end

    it 'shows the right username' do
      expect(page).to have_content('Tom')
    end

    it 'shows the right bio' do
      expect(page).to have_content('Teacher from Mexico.')
    end

    it 'shows user number of post' do
      expect(page).to have_content('Number of posts: 9')
    end

    it 'looks if exists last 3 posts' do
      expect(page).to have_content('Post #', minimum: 3)
    end

    it 'find link to all user posts' do
      expect(page).to have_link('See all posts')
    end

    it 'link to post/show page' do
      click_link('Details', match: :first)
      expect(current_path).to have_content('/users/2/posts/20')
    end

    it 'link to See all posts page' do
      click_link('See all posts')
      expect(current_path).to have_content('/users/2/posts')
    end
  end
end
