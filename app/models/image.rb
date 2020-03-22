class Image < ApplicationRecord  
  belongs_to :item
  mount_uploader :image, ImagesUploader
  validates :image, presence: true, length: { minimum: 1, maximum: 4 }
end
