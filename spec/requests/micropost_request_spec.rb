require 'rails_helper'

RSpec.describe "Microposts", type: :request do
  let(:test) { FactoryBot.create :test }

  describe 'GET #index' do
    it 'renders a successful response' do
      get microposts_url
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      micropost = Micropost.new(user_id: 1, content: 'test')
      get microposts_url(micropost)
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'newアクションにリクエストすると正常にレスポンスが返ってくる' do
      # micropost = Micropost.new(user_id: 1, content: 'test')
      get new_micropost_url
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'editアクションにリクエストすると正常にレスポンスが返ってくる' do
      get edit_micropost_url(test)
      expect(test).to be_successful
    end
  end

  describe 'POST #create' do
    it 'マイクロポストが作成される' do
      expect do
        post microposts_url, params: { micropost: FactoryBot.attributes_for(:test) }
      end.to change(Micropost, :count).by(1)
    end

  describe 'DELETE #destroy' do
    it 'マイクロポストが破棄される' do
      expect do
        delete micropost_url test
      end.to change(Micropost, :count).by(-1)
    end
  end
end
