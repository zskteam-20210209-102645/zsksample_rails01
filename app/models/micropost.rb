class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, length: { maximum: 140 },
                      presence: true
  # 15 Micropostの最大文字数を140文字に制限する 
end
