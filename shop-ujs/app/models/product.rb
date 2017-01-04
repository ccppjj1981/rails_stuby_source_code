class Product < ApplicationRecord
  validates :price ,numericality: true
  has_many :likes
  def liked_count
  self.likes.size
  end

  def liked_by?(like_id)
    !! self.likes.where(id: like_id).first
  end
end
