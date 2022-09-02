
class Offer < ApplicationRecord
  include PgSearch::Model
  has_many :bookings
  belongs_to :seller, foreign_key: :seller_id, class_name: "User"
  has_one_attached :photo
  pg_search_scope :search_by_title_description_and_address,
    against: [ :title, :description, :address],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
