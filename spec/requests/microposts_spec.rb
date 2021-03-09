require 'rails_helper'

describe MicropostsController, type: :request do
  let(:user) { FactoryBot.build(:user) }
  let(:micropost) { FactoryBot.create(:micropost, user: user) }

  # before do
  #   micropost
  #   sign_in user
  # end

  describe 'GET #index' do
    subject(:action) do
      get microposts_path(micropost)
      response
    end

    it { is_expected.to have_http_status(:ok) }
    it 'indexアクションにリクエストするとレスポンスに投稿済みのテキストが存在する' do
      expect(action.body).to include(micropost.content)
    end
  end

  describe 'GET #show' do
    subject(:action) do
      get microposts_path(micropost)
      response
    end
    it { is_expected.to have_http_status(:ok) }
    it 'showアクションにリクエストするとレスポンスに投稿済みのテキストが存在する' do
      expect(action.body).to include(micropost.content)
    end
  end
end
