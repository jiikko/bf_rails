require 'rails_helper'

describe TopController do
  describe 'GET #index' do
    it 'be success' do
      get '/'
      expect(response.body).to include('最終取引価格')
    end
  end
end
