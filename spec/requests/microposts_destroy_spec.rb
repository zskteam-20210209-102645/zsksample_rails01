require 'rails_helper'

describe MicropostsController, type: :system do
  let(:user) { FactoryBot.build(:user) }

  before do
    @micropost1 = FactoryBot.create(:micropost, user: user)
  end

  describe 'GET #destroy' do
    subject(:action) do
      get microposts_path
      response
    end
    it { is_expected.to have_http_status(:ok) }
    it 'マイクロポストに「削除」ボタンがあることを確認する' do
      expect(action.body).to have_link 'Destroy'
    end
  end
end
