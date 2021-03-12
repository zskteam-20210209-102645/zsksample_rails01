class Micropost < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :content, length: { maximum: 140 }, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
