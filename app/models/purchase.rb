class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  belongs_to :card

  belongs_to :seller, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User",optional: true
end
