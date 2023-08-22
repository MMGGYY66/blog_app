require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'return success for /users' do
      get '/users'
      expect(response.status).to eq(200)
      expect(response.body).to include('Here is list of all users. Their picture and number of posts')
      expect(response).to render_template(:index)
    end

    it 'return success for /users/:id' do
      get '/users/:874'
      expect(response.status).to eq(200)
      expect(response.body).to include('Details for the a user. picture, name, all posts')
      expect(response).to render_template(:show)
    end
  end
end
