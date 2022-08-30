class Booking < ApplicationRecord
  belongs_to :offer
  belongs_to :buyer, foreign_key: :buyer_id, class_name: "User"
end
