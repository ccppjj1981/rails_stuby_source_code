class Product < ApplicationRecord
  # relationships .............................................................
  belongs_to :user,
    optional: true
  has_many :variants,
    dependent: :destroy
  # extends ...................................................................
  mount_uploaders :avatars, AvatarUploader
end
