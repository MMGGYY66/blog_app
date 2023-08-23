require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'return success for /posts' do
      get '/posts'
      expect(response.status).to eq(200)
      expect(response.body).to include('Here is all the posts for the user')
      expect(response).to render_template(:index)
    end

    it 'return success for /posts/:user_id' do
      get '/posts/974'
      expect(response.status).to eq(200)
      expect(response.body).to include('Here is only 1 - post for the user')
      expect(response).to render_template(:show)
    end
  end
end
