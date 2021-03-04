class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :content, length: { maximum: 140 }, # 140文字の文字数制限
                      presence: true # マイクロポストのコンテンツが存在しているかどうか
end
