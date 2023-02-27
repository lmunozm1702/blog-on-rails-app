require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:id/posts' do
    it 'returns 200' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template with Post List text' do
      get '/users/1/posts'
      expect(response.body).to include('Posts Index')
    end
    it 'renders the index template' do
      get '/users/1/posts'
      expect(response).to render_template('posts/index')
    end
  end

  describe 'GET /users/:id/posts/:id' do
    let(:user1) { FactoryBot.create :user }

    it 'returns 200' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template with User List text' do
      get '/users/1/posts/1'
      expect(response.body).to include('Post Details')
    end
    it 'renders the show template' do
      get '/users/1/posts/1'
      expect(response).to render_template('posts/show')
    end
  end
end
