class Item < ApplicationRecord
	has_and_belongs_to_many :carts
	has_and_belongs_to_many :orders
	mount_uploader :image, ImageUploader
end
