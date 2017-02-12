class Gallerie < ApplicationRecord
	mount_uploaders :images, ImageUploader
end
