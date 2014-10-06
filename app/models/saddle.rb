class Saddle < ActiveRecord::Base
  belongs_to :brand
  mount_uploader :image, ImageUploader
end
