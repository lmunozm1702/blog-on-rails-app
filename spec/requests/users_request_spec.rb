require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns 200' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template with User List text' do
      get '/users'
      expect(response.body).to include('Users List')
    end
    it 'renders the index template' do
      get '/users'
      expect(response).to render_template('users/index')
    end
  end

  describe 'GET /users/:id' do
    let(:user1) { FactoryBot.create :user }

    it 'returns 200' do
      get '/users/1'
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template with User List text' do
      get '/users/1'
      expect(response.body).to include('User Details')
    end
    it 'renders the show template' do
      get '/users/1'
      expect(response).to render_template('users/show')
    end
  end
end
