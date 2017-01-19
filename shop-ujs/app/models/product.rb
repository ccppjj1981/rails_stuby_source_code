class Product < ApplicationRecord
  belongs_to :user
  has_many :variants#,dependent: :destroy
  validates :user_id, presence: true
end
