require 'rails_helper'
 RSpec.describe 'Post Show Page', type: :system do
  describe 'Post Show Tests' do
    before(:each) do
      visit user_post_path(2, 3)
    end
    it 'shows the post title' do
      expect(page).to have_content('Hello 3')
    end
    ###
    it 'shows the comments count' do
      expect(page).to have_content('Comments: 11')
    end
    it 'shows the likes count' do
      expect(page).to have_content('Likes: 0')
    end
    it 'shows the post body' do
      expect(page).to have_content('consectetur adipisicing', minimum: 1)
    end
    it 'shows username of each commentor' do
      expect(page).to have_content('Tom:', minimum: 10)
    end
  end
end