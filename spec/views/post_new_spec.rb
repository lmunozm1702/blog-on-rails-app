require 'rails_helper'

RSpec.describe 'New Post', type: :system do
  describe 'POST #create' do
    it 'creates a new post' do
      visit('/')
      click_link('New Post', match: :first)
      expect(current_path).to have_content('/posts/new')

      fill_in('Title', with: "Title #{Date.new}")
      fill_in('Text',	with: "Text #{Date.new}")
      click_button('Create Post')
      expect(current_path).to have_content('/users/')
      expect(page).to have_content('Post was successfully created.')
    end
  end
end
