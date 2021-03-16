class Micropost < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validates :content, length: { maximum: 140 },
                      presence: true, unless: :was_attached?
end