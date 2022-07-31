require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET /drinks' do
    it 'returns http success' do
      get '/drinks'

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /snacks' do
    it 'returns http success' do
      get '/snacks'
      
      expect(response).to have_http_status(:success)
    end
  end
end
