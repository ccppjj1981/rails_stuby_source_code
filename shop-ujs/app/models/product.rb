class Product < ApplicationRecord
  belongs_to :user,
    optional: true
  has_many :variants,
    dependent: :destroy
  # validates :user_id, presence: true
end
