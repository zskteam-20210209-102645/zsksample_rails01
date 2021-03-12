class Micropost < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :content, length: { maximum: 140 }, presence: true, unless: :was_attached?

  def was_attached?
    image.attached? # self.image.attached? の場合、[Checkのエラーが発生: Style/RedundantSelf: Redundant self detected.]
  end
end
