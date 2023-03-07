require 'rails_helper'

RSpec.describe 'Post Index Page', type: :system do
  describe 'Post List Tests' do
    before(:each) do
      visit user_posts_path(2)
    end

    it 'shows the user profile picture' do
      expect(page).to have_css('img')
    end

    it 'shows the right username' do
      expect(page).to have_content('Tom')
    end

    it 'shows user number of post' do
      expect(page).to have_content('Number of posts: 9')
    end

    it 'shows a post title' do
      expect(page).to have_content('Text Test 99')
    end

    it 'shows a post body' do
      expect(page).to have_content('consectetur adipisicing', minimum: 1)
    end

    it 'find first comment on a posts' do
      expect(page).to have_content('Tom: gjhjgh')
    end

    it 'show comment count on a post' do
      expect(page).to have_content('Comments: 6,')
    end

    it 'show comment count on a post' do
      expect(page).to have_content('Likes: 1')
    end

    it 'link to post/show page' do
      click_link('Details', match: :first)
      expect(current_path).to have_content('/users/2/posts/2')
    end
  end
end
