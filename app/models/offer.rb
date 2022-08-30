class Offer < ApplicationRecord
  has_many :bookings
  belongs_to :seller, foreign_key: :seller_id, class_name: "User"
end
